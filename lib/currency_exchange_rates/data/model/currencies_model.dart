import 'package:exchange_currency_rates_app/core/network/network_interface.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/data/model/currency_model.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/domain/entities/currencies_entity.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/domain/entities/currency_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'currencies_model.g.dart';

@JsonSerializable(createToJson: false)
@CustomCurrenciesModelConverter()
class CurrenciesModel extends CurrenciesEntity {
  CurrenciesModel({
    required super.currencies,
    required super.timestamp,
  });

  factory CurrenciesModel.fromJson(JsonMap json) => _$CurrenciesModelFromJson(json);
}

class CustomCurrenciesModelConverter extends JsonConverter<List<CurrencyEntity>, List> {
  const CustomCurrenciesModelConverter();

  @override
  List<CurrencyEntity> fromJson(List json) {
    return json.map((e) => CurrencyModel.fromJson(e)).toList();
  }

  @override
  List toJson(List<CurrencyEntity> object) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
