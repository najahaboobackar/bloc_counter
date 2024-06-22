part of 'count_bloc.dart';

class CountEvent {}
class Increment extends CountEvent{

}
class Decrement extends CountEvent{
  
}
class SetLimit extends CountEvent {
  final int limit;

  SetLimit(this.limit);
}
