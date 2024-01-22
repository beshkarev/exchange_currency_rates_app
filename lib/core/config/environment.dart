import 'package:envied/envied.dart';

part 'environment.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(obfuscate: true, useConstantCase: true)
  static final String apiKey = _Env.apiKey;

  @EnviedField(useConstantCase: true)
  static const String endpoint = _Env.endpoint;

  @EnviedField(useConstantCase: true)
  static const int currencyRequestsIntervalSec = _Env.currencyRequestsIntervalSec;
}
