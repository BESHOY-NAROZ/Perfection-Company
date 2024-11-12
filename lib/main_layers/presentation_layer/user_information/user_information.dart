import 'package:flutter/material.dart';

import 'package:perfection_task/core/app_lists/app_lists.dart';
import 'package:perfection_task/core/app_size/app_size.dart';

class UserInformation extends StatelessWidget {
  final int userId;

  const UserInformation({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    AppSize.init(context: context, designHeight: 812, designWidth: 375);

    return Scaffold(
        appBar: AppBar(
          title: const Text("User Details"),
        ),
        body:
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(AppLists.userAvatar[userId-1]),
              ),
              const SizedBox(height: 10),
              Text(AppLists.userName[userId-1], style: const TextStyle(fontSize: 24)),
              Text(AppLists.userMail[userId-1], style: const TextStyle(fontSize: 16)),
            ],
          ),
        )
    );
  }
}


