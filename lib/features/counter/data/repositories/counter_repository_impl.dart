import '../../domain/repositories/counter_repository.dart';

class CounterRepositoryImpl implements CounterRepository {
  int _value = 0;

  @override
  int get current => _value;

  @override
  int increment() => ++_value;

  @override
  int decrement() => --_value;

  @override
  void reset() => _value = 0;
}
