import 'package:flutter/material.dart';

class CartAppBarView extends StatelessWidget implements PreferredSizeWidget {
  const CartAppBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
