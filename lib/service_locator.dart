import 'package:bingo_application/modelclass.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => ModelClass());
}
