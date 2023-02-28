import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/src/core/functions/navigator.dart';

import 'custom_text.dart';

class SeeMoreWidget extends StatelessWidget {
  final String title;
  final Widget? page;
  final void Function()? onPressed;

  const SeeMoreWidget({
    Key? key,
    required this.title,
     this.page,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(
        16.0,
        24.0,
        16.0,
        8.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: title,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 19,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.15,
            ),
          ),
          /*Text(
            title,
            style:
          ),*/
          InkWell(
            onTap: onPressed ,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  CustomText(
                    text: 'See More',
                  ),
                  /*Text(
                    'See More',
                    style: TextStyle(
                      color: Colors.white,
                    ),*/
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16.0,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
