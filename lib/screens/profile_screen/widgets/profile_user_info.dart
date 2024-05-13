import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persian/persian.dart';
import 'package:bpbm_technician/common/methods/load_user.dart';

class ProfileUserInfo extends StatelessWidget {
  const ProfileUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CupertinoActivityIndicator();
        } else if (!snapshot.hasData) {
          return Center(
            child: Text('اطلاعاتی وجود ندارد'),
          );
        } else {
          final data = snapshot.data!;
          return Column(
            children: [
              CircleAvatar(
                radius: 60,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${data[0]} ${data[1]}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                data[2].withPersianNumbers(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          );
        }
      },
    );
  }
}
