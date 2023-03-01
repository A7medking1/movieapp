import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/core/utils/enums.dart';
import 'package:movieapp/src/tv/domin/entitiy/menu_model.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(MenuInitial());

  static MenuCubit get(context) => BlocProvider.of(context);

  MenuType currentMenu = MenuType.episodes;

  void updateMenu(MenuInfoModel newMenu) {
    currentMenu = newMenu.menuType;
    /*print("current $currentMenu");
    print("new $newMenu");*/
    emit(UpdateMenuState());
  }



  PersonInfoType currentType = PersonInfoType.movie ;

  void updateInfoType(PersonShowsModel newMenu) {
    currentType = newMenu.personInfoType;
    /*print("current $currentMenu");
    print("new $newMenu");*/
    emit(UpdateMenuState());
  }


}
