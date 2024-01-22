import 'package:exchange_currency_rates_app/core/di/dependencies.dart';
import 'package:exchange_currency_rates_app/core/router/router.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/presentation/view/currencies_exchange_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CoreDI.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: generateRoute,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: TextTheme(
          displayLarge: GoogleFonts.josefinSans(fontSize: 18, fontWeight: FontWeight.w600),
          displayMedium: GoogleFonts.josefinSans(fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ),
      home: const MyHomePage(title: 'Currency Exchange App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const CurrenciesExchangeView(),
    );
  }
}
