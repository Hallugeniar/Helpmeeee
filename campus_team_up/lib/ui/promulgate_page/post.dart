import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Post extends StatelessWidget {
  const Post({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildPost(context);
  }

  Widget _buildPost(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    final barHeight = deviceHeight * 0.025;
    final barWidth = deviceWidth * 0.9;
    final bar = Card(
      margin: EdgeInsets.all(0),
      elevation: 10,
      child: Container(
        width: barWidth,
        height: barHeight,
        color: Colors.blue,
      ),
    );

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        bar,
        SizedBox(
          width: deviceWidth * 0.8,
          height: deviceHeight * 0.7,
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Text(
                  'title',
                  style: TextStyle(fontSize: 30),
                ),
                // Row(
                //   children: [Text('location'), Text('time')],
                // ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: AppLocalizations.of(context)
                              .post_content_template),
                      maxLines: null,
                    ),
                  ),
                ),

                //todo tag 多于一行
                Row(
                  children: [
                    // _tag(),
                    Spacer(),
                  ],
                )
              ],
            ),
          ),
        ),
        bar,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _button(Icons.image, AppLocalizations.of(context).add_image, () {}),
            _button(Icons.tag, AppLocalizations.of(context).add_tag, () {}),
          ],
        )
      ],
    );
  }

  Widget _tag() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: Row(
        children: [Icon(Icons.tag), Text('ybyb')],
      ),
    );
  }
}

Widget _button(IconData icon, String buttonText, Function() onClick) {
  final buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFADAFA)),
      foregroundColor: MaterialStateProperty.all<Color>(Color(0xFFC43DF3)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.white))));
  return ElevatedButton(
      onPressed: onClick,
      style: buttonStyle,
      child: Row(
        children: [Icon(icon), Text(buttonText)],
      ));
}
