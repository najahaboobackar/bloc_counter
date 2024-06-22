part of 'count_bloc.dart';



@immutable
class CountState {
  final int count;
  final int limit;
  final String errorMessage;

  CountState({required this.count, required this.limit, this.errorMessage = ''});
}
