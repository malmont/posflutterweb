part of 'side_menu_bloc.dart';

abstract class SideMenuEvent extends Equatable {
  const SideMenuEvent();

  @override
  List<Object> get props => [];
}

class SelectMenuItemEvent extends SideMenuEvent {
  final int index;
  const SelectMenuItemEvent(this.index);

  @override
  List<Object> get props => [index];
}

class ToggleMenuCollapseEvent extends SideMenuEvent {}

class ChangeMenuIndexEvent extends SideMenuEvent {
  final int newIndex;

  const ChangeMenuIndexEvent(this.newIndex);

  @override
  List<Object> get props => [newIndex];
}
