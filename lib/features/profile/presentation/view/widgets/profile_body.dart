import 'package:flutter/material.dart';

import '../../../../authentication/login/data/models/user_model.dart';
import '../../../../watch list/view/watch_list_screen.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    super.key,
    this.userModel,
  });

  final UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        scrolledUnderElevation: 0,
        title: const Text(
          "Profile Data",
          style: TextStyle(fontSize: 15),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              Icons.edit,
              size: 16,
              color: Color(0xffB7950B),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        "${userModel?.name}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${userModel?.bio}",
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            const Text(
              "Saved Movies",
              style: TextStyle(fontSize: 15),
            ),
            const Expanded(flex: 3, child: Watchlist()),
          ],
        ),
      ),
    );
  }
}
