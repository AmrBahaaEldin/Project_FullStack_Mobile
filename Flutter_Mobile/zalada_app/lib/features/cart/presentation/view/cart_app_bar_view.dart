import 'package:flutter/material.dart';
import 'package:zalada_app/core/constant/style_app.dart';

class CartAppBarView extends StatelessWidget implements PreferredSizeWidget {
  const CartAppBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text('Cart', style: StylesTextApp.textStyle18),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
