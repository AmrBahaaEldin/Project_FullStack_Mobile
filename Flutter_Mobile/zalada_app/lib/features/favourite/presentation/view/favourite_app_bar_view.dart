import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavouriteAppBarView extends StatelessWidget
    implements PreferredSizeWidget {
  const FavouriteAppBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
