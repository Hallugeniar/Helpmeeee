import 'package:flutter/material.dart';

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
    final buttonStyle = ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFADAFA)),
        foregroundColor: MaterialStateProperty.all<Color>(Color(0xFFC43DF3)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.white))));
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
                          hintText: 'i18n 有没有一起去竞赛的小伙伴吖~'),
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
            ElevatedButton(
                onPressed: () {},
                style: buttonStyle,
                child: Row(
                  children: [Icon(Icons.image), Text('i18n add image')],
                )),
            ElevatedButton(
                onPressed: () {},
                style: buttonStyle,
                child: Row(
                  children: [Icon(Icons.tag), Text('i18n add tag')],
                ))
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
