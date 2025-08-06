abstract class MainNavigationState {}

class MainNavigationInitial extends MainNavigationState {
  final int index;
  MainNavigationInitial({this.index = 0});
}

class MainNavigationChanged extends MainNavigationState {
  final int index;
  MainNavigationChanged(this.index);
}
