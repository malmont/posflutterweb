// side_menu_state.dart
part of 'side_menu_bloc.dart';

class SideMenuState extends Equatable {
  final bool isCollapsed;
  final int selectedMenuIndex;

  const SideMenuState({
    required this.isCollapsed,
    required this.selectedMenuIndex,
  });

  SideMenuState copyWith({
    bool? isCollapsed,
    int? selectedMenuIndex,
  }) {
    return SideMenuState(
      isCollapsed: isCollapsed ?? this.isCollapsed,
      selectedMenuIndex: selectedMenuIndex ?? this.selectedMenuIndex,
    );
  }

  @override
  List<Object?> get props => [isCollapsed, selectedMenuIndex];
}
