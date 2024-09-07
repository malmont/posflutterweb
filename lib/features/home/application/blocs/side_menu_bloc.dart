// side_menu_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'side_menu_event.dart';
part 'side_menu_state.dart';

class SideMenuBloc extends Bloc<SideMenuEvent, SideMenuState> {
  SideMenuBloc()
      : super(const SideMenuState(isCollapsed: false, selectedMenuIndex: 0)) {
    on<SelectMenuItemEvent>((event, emit) {
      emit(state.copyWith(selectedMenuIndex: event.index));
    });

    on<ToggleMenuCollapseEvent>((event, emit) {
      emit(state.copyWith(isCollapsed: !state.isCollapsed));
    });
  }
}