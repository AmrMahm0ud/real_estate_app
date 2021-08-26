abstract class HomeEvent {}

class GetHomeDataEvent extends HomeEvent {
  final int lastRowItem;

  GetHomeDataEvent(this.lastRowItem);
}
