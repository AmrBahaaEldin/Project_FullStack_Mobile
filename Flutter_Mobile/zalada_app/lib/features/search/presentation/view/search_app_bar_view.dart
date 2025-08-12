import 'package:flutter/material.dart';

class SearchAppBarView extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar();
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
