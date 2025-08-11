import 'package:flutter/material.dart';
import 'package:zalada_app/features/home/presentation/view/home_body_view.dart';
import 'package:zalada_app/features/profile/presentation/view/profile_body_view.dart';

class BodyViewModel {
  BodyViewModel._();
  static List<Widget> boyWidgets = [
    const HomeBodyView(),
    const Center(child: Text('🔍 Search', style: TextStyle(fontSize: 24))),
    const Center(child: Text('❤️ Favorites', style: TextStyle(fontSize: 24))),
    const Center(child: Text('❤️ Cart', style: TextStyle(fontSize: 24))),
    const ProfileBodyView(),
  ];
}
