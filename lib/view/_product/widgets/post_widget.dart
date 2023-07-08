import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class PostView extends StatelessWidget {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(backgroundColor: Colors.red, minRadius: 20),
              Text("Kullanıcı adı", style: TextStyle(fontSize: 20)),
              Icon(Icons.more_horiz_outlined)
            ],
          ),
        ),
        Container(
          height: context.height * 0.5,
          color: Colors.blue,
        ),
        const Row(
          
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Açıklama"),
            Row(
              children: [
                Icon(Icons.insert_comment_outlined),
              ],
            )
          ],
        )
      ]),
    );
  }
}
