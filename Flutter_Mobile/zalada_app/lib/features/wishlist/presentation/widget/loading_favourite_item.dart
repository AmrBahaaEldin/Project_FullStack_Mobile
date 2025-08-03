import 'package:e_commerce_app/core/constants/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingFavouriteItem extends StatelessWidget {
  const LoadingFavouriteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppColor.importFontColor,
      ),
    );
  }
}