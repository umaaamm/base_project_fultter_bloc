abstract class CounterRepository {
  int get current;
  int increment();
  int decrement();
  void reset();
}
