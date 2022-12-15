import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  const Post({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [_buildPost(context), Positioned(left: 10, child: _avatar())],
    );
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
      children: [
        bar,
        SizedBox(
          width: deviceWidth * 0.8,
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Text(
                  'title',
                  style: TextStyle(fontSize: 30),
                ),
                Row(
                  children: [Text('location'), Text('time')],
                ),
                Text('content'),

                //todo tag 多于一行
                Row(
                  children: [
                    _tag(),
                    Spacer(),
                    Icon(Icons.message),
                    Text('replie count'),
                    Icon(Icons.thumb_up),
                    Text('like count'),
                  ],
                )
              ],
            ),
          ),
        ),
        bar
      ],
    );
  }

  Widget _avatar() {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.all(Radius.circular(50)),
      child: Container(
        height: 64,
        width: 64,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://i2.hdslb.com/bfs/face/8c883fbb3acd84c3ffd1a34424559a9c885b9636.jpg'),
              fit: BoxFit.cover),
          shape: BoxShape.circle,
        ),
      ),
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
