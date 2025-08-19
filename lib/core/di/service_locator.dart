import 'package:get_it/get_it.dart';
import '../../features/counter/domain/repositories/counter_repository.dart';
import '../../features/counter/data/repositories/counter_repository_impl.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Repositories
  sl.registerLazySingleton<CounterRepository>(() => CounterRepositoryImpl());
}
