import 'package:flutter/material.dart';

class DescriptionTextWidget extends StatefulWidget {
  final String? text;

  DescriptionTextWidget({@required this.text});

  @override
  _DescriptionTextWidgetState createState() =>
      new _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  String? firstHalf;
  String? secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text!.length > 200) {
      firstHalf = widget.text!.substring(0, 200);
      secondHalf = widget.text!.substring(200, widget.text!.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return  secondHalf!.isEmpty
        ? Text(firstHalf!,style: TextStyle(letterSpacing: 1.2),)
        : Column(
      children: [
        Text(flag ? (firstHalf! + "...") : (firstHalf! + secondHalf!),style: TextStyle(letterSpacing: 1.2),),
        SizedBox(height: 10,),
        InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                flag ? "show more" : "show less",
                style: TextStyle(color: Colors.blue,fontSize: 17),
              ),
              SizedBox(width: 5,),
              Icon(
                flag ? Icons.arrow_downward :Icons.arrow_upward,
                size: 22,
                color: Colors.blue,
              ),
            ],
          ),
          onTap: () {
            setState(() {
              flag = !flag;
            });
          },
        ),
      ],
    );
  }
}
