import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'count_event.dart';
part 'count_state.dart';

class CountBloc extends Bloc<CountEvent, CountState> {
  CountBloc() : super(CountState(count: 0, limit: 10)) {
    on<Increment>((event, emit) {
      if (state.count + 1 > state.limit && state.limit != 0) {
        emit(CountState(
            count: 0, limit: state.limit, errorMessage: 'Limit reached'));
      } else {
        emit(CountState(
            count: state.count + 1, limit: state.limit, errorMessage: ''));
      }
    });

    on<Decrement>((event, emit) {
      if (state.count == 0) {
        emit(CountState(
            count: state.count,
            limit: state.limit,
            errorMessage: 'Limit reached'));
      } else {
        emit(CountState(
            count: state.count - 1, limit: state.limit, errorMessage: ''));
      }
    });

    on<SetLimit>((event, emit) {
      emit(
          CountState(count: state.count, limit: event.limit, errorMessage: ''));
    });
  }
}
