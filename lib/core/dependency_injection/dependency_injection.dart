import 'package:get_it/get_it.dart';
import 'package:hr_management_user/core/dependency_injection/dependency_injection.config.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;
@InjectableInit()
Future<void> configureInjection() async {
  await $initGetIt(getIt, environment: Environment.prod);
}