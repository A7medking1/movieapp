import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/core/utils/api_constance.dart';
import 'package:movieapp/src/movie/domain/entity/person.dart';
import 'package:movieapp/src/movie/presentation/widget/loading_spankit.dart';
import 'package:movieapp/src/tv/domin/entitiy/menu_model.dart';

import '../../../../core/services/services_locator.dart';
import '../../../../core/utils/app_constance.dart';
import '../../../../core/utils/enums.dart';
import '../../../../tv/presentation/controller/menu_cubit/menu_cubit.dart';
import '../../../../tv/presentation/screens/tv_detail_screen/component/similar_tv.dart';
import '../../controller/credit_info_bloc/credit_info_bloc.dart';
import '../../widget/cached_image_widget.dart';
import '../../widget/custom_text.dart';
import '../movie_detail_screen/component/similar_movie_component.dart';

class CreditInfoScreen extends StatelessWidget {
  final int personId;

  const CreditInfoScreen({Key? key, required this.personId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) =>MenuCubit()),
        BlocProvider(
            create: (context) =>
                sl<CreditInfoBloc>()..add(GetCreditInfoEvent(personId))),
      ],
      child: CreditScreenContent(),
    );
  }
}

class CreditScreenContent extends StatelessWidget {
  const CreditScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreditInfoBloc, CreditInfoState>(
      builder: (context, state) {
        switch (state.personState) {
          case RequestState.loading:
            return Scaffold(body: customLoading);
          case RequestState.loaded:
            return Scaffold(
              body: CustomScrollView(
                slivers: [
                  CustomCreditAppBar(
                    person: state.person,
                  ),
                  PersonInfo(
                    person: state.person!,
                  ),
                  menuItem(),
                  BlocBuilder<MenuCubit, MenuState>(builder: (context, _) {
                    switch (context.read<MenuCubit>().currentType) {
                      case PersonInfoType.tv:
                        return TvCardGridView(
                          tv: state.person!.tv_credits,
                        );
                      case PersonInfoType.movie:
                        return MovieCardGridView(
                          movie: state.person!.movie_credits,
                        );
                    }
                  }),
                ],
              ),
            );
          case RequestState.error:
            return Text(state.message);
        }
      },
    );
  }
}

class menuItem extends StatelessWidget {
  const menuItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsetsDirectional.only(top: 20, bottom: 20),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: personItem
              .map((e) => PersonMenuButton(
                    personShowsModel: e,
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class PersonMenuButton extends StatelessWidget {
  final PersonShowsModel personShowsModel;

  const PersonMenuButton({Key? key, required this.personShowsModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuCubit, MenuState>(
      builder: (context, state) {
        MenuCubit cubit = MenuCubit.get(context);
        return MaterialButton(
          onPressed: () {
            cubit.updateInfoType(personShowsModel);
            // cubit.c(menuInfoModel);
          },
          child: Padding(
            padding: EdgeInsetsDirectional.only(
              start: 0,
            ),
            child: Column(
              children: [
                Text(
                  personShowsModel.title,
                  style: TextStyle(
                    fontSize: 18,
                    color: cubit.currentType == personShowsModel.personInfoType
                        ? Colors.deepOrangeAccent
                        : Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                cubit.currentType == personShowsModel.personInfoType
                    ? Container(
                        height: 2,
                        width: 80,
                        color:
                            cubit.currentType == personShowsModel.personInfoType
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

class PersonInfo extends StatelessWidget {
  final Person person;

  const PersonInfo({
    Key? key,
    required this.person,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsetsDirectional.only(start: 10, end: 10, top: 10),
      sliver: SliverToBoxAdapter(
        child: FadeInUp(
          from: 20,
          duration: const Duration(milliseconds: 500),
          child: Column(
            children: [
              Row(
                children: [
                  CustomText(
                    text: 'BirthDate :',
                    color: Colors.grey[400],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CustomText(
                    text: '${person.birthday}',
                    color: Colors.grey,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  CustomText(
                    text: 'Place Of Birth :',
                    color: Colors.grey[400],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CustomText(
                    text: '${person.place_of_birth}',
                    color: Colors.grey,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCreditAppBar extends StatelessWidget {
  final Person? person;

  const CustomCreditAppBar({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 270.0,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        background: FadeIn(
          duration: const Duration(milliseconds: 500),
          child: Stack(
            children: [
              CachedImages(
                imageUrl: person != null
                    ? ApiConstance.imageUrl(person!.profile_path!)
                    : AppConstance.errorImage,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 10),
                  child: Container(color: Colors.black.withOpacity(0)),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        const CircleAvatar(
                          backgroundColor: Colors.amber,
                          radius: 65,
                        ),
                        CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(
                            person!.profile_path != null
                                ? ApiConstance.imageUrl(person!.profile_path!)
                                : AppConstance.errorImage,
                          ),
                          radius: 60,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    CustomText(
                      text: person!.name,
                      fontSize: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
