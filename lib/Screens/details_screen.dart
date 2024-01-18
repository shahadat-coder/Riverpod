import 'package:flutter/material.dart';
import 'package:river_pod/Model/user_model.dart';
class DetailScreen extends StatelessWidget {

  const DetailScreen( {super.key,required this.e});
  final UserModel e;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod'),
      ),
      body: Column(
        children: [
          Center(
            child: CircleAvatar(
              maxRadius: 60,
              backgroundImage: NetworkImage(e.avatar),
            ),
          ),
          Text(
            e.firstname + " " + e.lastname,
          ),
          Text(e.email),
        ],
      )
    );
  }
}
