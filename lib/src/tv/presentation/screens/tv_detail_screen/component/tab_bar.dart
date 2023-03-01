import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domin/entitiy/menu_model.dart';
import '../../../controller/menu_cubit/menu_cubit.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: menuItem
              .map((e) => BuildMenuButton(
            menuInfoModel: e,
          ))
              .toList(),
        ),
      ),
    );
  }
}

class BuildMenuButton extends StatelessWidget {
  final MenuInfoModel menuInfoModel;

  const BuildMenuButton({Key? key, required this.menuInfoModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuCubit, MenuState>(
      builder: (context, state) {
        MenuCubit cubit = MenuCubit.get(context);
        return MaterialButton(
          onPressed: () {
            cubit.updateMenu(menuInfoModel);
          },
          child: Padding(
            padding: EdgeInsetsDirectional.only(
              start: 0,
            ),
            child: Column(
              children: [
                Text(
                  menuInfoModel.title,
                  style: TextStyle(
                    fontSize: 18,
                    color: cubit.currentMenu == menuInfoModel.menuType
                        ? Colors.deepOrangeAccent
                        : Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                cubit.currentMenu == menuInfoModel.menuType
                    ? Container(
                  height: 2,
                  width: 80,
                  color: cubit.currentMenu == menuInfoModel.menuType
                      ? Colors.deepOrangeAccent
                      : Colors.white,
                )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        );
      },
    );
  }
}
