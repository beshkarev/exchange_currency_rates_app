import 'package:exchange_currency_rates_app/core/di/dependencies.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/domain/entities/currency_entity.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/domain/entities/currency_history_entity.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/presentation/bloc/history/bloc.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/presentation/widgets/currency_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CurrencyHistoryWidget extends StatefulWidget {
  const CurrencyHistoryWidget({required this.currencyKey, super.key});

  final String currencyKey;

  @override
  State<StatefulWidget> createState() => _CurrencyHistoryWidgetState();
}

class _CurrencyHistoryWidgetState extends State<CurrencyHistoryWidget> {
  static const _pageSize = 20;
  final _pagingController = PagingController<int, CurrencyHistoryEntity>(firstPageKey: 0);
  late int _offset;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CurrencyHistoryBloc, CurrencyHistoryState>(
      bloc: locator<CurrencyHistoryBloc>(),
      listener: (_, state) {
        if (state is CurrencyHistoryLoadedState) {
          try {
            final isLastPage = state.currencies.length < _pageSize;
            if (isLastPage) {
              _pagingController.appendLastPage(state.currencies);
            } else {
              final nextPageKey = _offset + state.currencies.length;
              _pagingController.appendPage(state.currencies, nextPageKey);
            }
          } catch (error) {
            _pagingController.error = error;
          }
        }
      },
      child: PagedListView<int, CurrencyHistoryEntity>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<CurrencyHistoryEntity>(
          itemBuilder: (context, item, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CurrencyWidget(
                currency: CurrencyEntity(
                  key: widget.currencyKey,
                  name: item.name,
                  exchange: item.exchangeRate,
                  flag: item.flag,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    _pagingController.addPageRequestListener((offset) {
      _offset = offset;
      locator<CurrencyHistoryBloc>().add(CurrencyHistoryFetch(_pageSize, offset: offset, key: widget.currencyKey));
    });
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
