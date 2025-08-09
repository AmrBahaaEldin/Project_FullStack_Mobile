import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zalada_app/core/constant/style_app.dart';

class HomeAppBarView extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBarView({super.key});

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
        IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_off)),
      ],
      title: const Text('Home', style: StylesTextApp.textStyle16),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
