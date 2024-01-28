import 'package:get_it/get_it.dart';
import 'package:weather_app/Core/Service/Local/shared_service.dart';

final getIt = GetIt.instance;

class DependenciesInjection {
  setUp() {
    getIt.registerLazySingleton(() => SharedPrefsService());
  }
}
