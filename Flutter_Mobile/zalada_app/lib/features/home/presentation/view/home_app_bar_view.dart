import 'package:flutter/material.dart';
import 'package:zalada_app/core/constant/style_app.dart';

class HomeAppBarView extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text('Home', style: StylesTextApp.textStyle16),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
