import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zalada_app/core/constant/router_app.dart';
import 'package:zalada_app/core/constant/style_app.dart';

class ProfileAppBarView extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          GoRouter.of(context).pop();
        },
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).push(RouterApp.editProfile);
          },
          icon: const Icon(Icons.mode_edit),
        ),
      ],
      title: const Text('Edit Profile', style: StylesTextApp.textStyle16),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
