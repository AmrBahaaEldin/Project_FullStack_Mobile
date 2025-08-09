import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:zalada_app/core/constant/style_app.dart';

import 'package:zalada_app/features/profile/presentation/view/widget/profile_edit_body.dart';

class ProfileEditView extends StatelessWidget {
  const ProfileEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        centerTitle: true,

        title: const Text('Edit Profile', style: StylesTextApp.textStyle18),
      ),
      body: const ProfileEditBody(),
    );
  }
}
