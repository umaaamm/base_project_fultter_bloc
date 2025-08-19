import 'package:base_flutter/features/counter/domain/repositories/counter_repository.dart';
import 'package:bloc/bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final CounterRepository _repo;

  CounterBloc(this._repo) : super(CounterState(value: _repo.current)) {
    on<CounterIncrementPressed>((event, emit) {
      emit(state.copyWith(value: _repo.increment()));
    });

    on<CounterDecrementPressed>((event, emit) {
      emit(state.copyWith(value: _repo.decrement()));
    });

    on<CounterResetPressed>((event, emit) {
      _repo.reset();
      emit(state.copyWith(value: _repo.current));
    });
  }
}
