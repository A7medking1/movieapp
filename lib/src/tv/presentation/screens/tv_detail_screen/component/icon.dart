import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class BuildTvDetailIcons extends StatelessWidget {
  const BuildTvDetailIcons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          start: 30,
          bottom: 40,
        ),
        child: Row(
          children: [
            BuildIconWidget(
              title: 'Trailer',
              icon: 'assets/icons/video.svg',
              onTap: () {},
            ),
            SizedBox(
              width: 30,
            ),
            BuildIconWidget(
              title: 'My List',
              icon: 'assets/icons/plus.svg',
              onTap: () {},
            ),
            SizedBox(
              width: 30,
            ),
            BuildIconWidget(
              title: 'Share',
              icon: 'assets/icons/share.svg',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class BuildIconWidget extends StatelessWidget {
  final String icon;

  final String title;

  final void Function()? onTap;

  const BuildIconWidget(
      {Key? key, required this.title, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      from: 20,
      duration: const Duration(milliseconds: 500),
      child: InkWell(
        onTap: onTap,
        child: Container(
          // padding: EdgeInsetsDirectional.only(end: 30),
          child: Column(
            children: [
              SvgPicture.asset(
                icon,
                color: Colors.white,
                width: 30,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                title,
                style: TextStyle(color: Colors.grey[300]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
