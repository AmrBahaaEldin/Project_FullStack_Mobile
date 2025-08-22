import 'package:flutter/material.dart';
import '../../layout/Home_Screen/home_screen.dart';
import '../../screen/admin/admin_screen.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/log_app.dart';
import '../Login_Screen/login_screen.dart';

class AdminView extends StatelessWidget {
  IconApp iconApp = IconApp();

  AdminView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image(image: iconApp.adminIconImage()),
        title: const Center(
          child: Text(
            "CTA bus service",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        actions:   [
          IconButton(onPressed: () {
            showDialog(context: context,
              builder: (context) => AlertDialog(
                title: const Text("للخروج من الصفحة "),
                actions: [
                  Column(
                    children: [
                      IconButton(onPressed: () {
                        navigateStop(context,  HomeScreen());
                      },
                          icon: const Icon(Icons.home)),
                      const Text("صفحة رئيسية")
                    ],
                  ),
                ],
                //importComponents.closeArrow(context,HomeScreen(),const LoginScreen())

              ),);
          },
              icon: const Icon(Icons.arrow_forward_ios,color: Colors.white,)),

        ],
      ),
      body: const AdminScreen(),


    );
  }
}