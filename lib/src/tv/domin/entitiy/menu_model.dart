import 'package:equatable/equatable.dart';
import 'package:movieapp/src/core/utils/enums.dart';

class MenuInfoModel extends Equatable {
  final MenuType menuType;

  final String title;

  const MenuInfoModel({
    required this.menuType,
    required this.title,
  });

  @override
  List<Object> get props => [menuType, title];
}

List<MenuInfoModel> menuItem = [
  MenuInfoModel(menuType: MenuType.episodes, title: 'EPISODES'),
  MenuInfoModel(menuType: MenuType.moreLikeThis, title: 'more Like This'),
  MenuInfoModel(menuType: MenuType.credits, title: 'Cast'),
];

class PersonShowsModel extends Equatable {
  final PersonInfoType personInfoType;

  final String title;

  PersonShowsModel({
    required this.personInfoType,
    required this.title,
  });

  @override
  List<Object> get props => [personInfoType, title];
}

List<PersonShowsModel> personItem = [
  PersonShowsModel(personInfoType: PersonInfoType.movie, title: 'movies'),
  PersonShowsModel(personInfoType: PersonInfoType.tv, title: 'tv'),
  PersonShowsModel(personInfoType: PersonInfoType.images, title: 'Person Images'),
];
