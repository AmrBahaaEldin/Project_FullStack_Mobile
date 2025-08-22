
import 'package:flutter/material.dart';
import '../../Views/Login_Screen/login_screen.dart';
import '../../layout/Home_Screen/home_screen.dart';
import '../../screen/helpdriver/help_driver_screen.dart';
import '../../shared/components/components.dart';
import '../../shared/components/const.dart';
import '../../shared/styles/log_app.dart';


class HelperDriverView extends StatelessWidget {
  final IconApp iconApp=IconApp();
  final ImportComponents importComponents=ImportComponents();
final String routeNumberHelpDriver;
final String nameHelpDriver;
final String plateNumberHelperDriver;
final VoidCallback updateData;


  HelperDriverView({super.key,
    required this.routeNumberHelpDriver,
    required this.nameHelpDriver,
    required this.plateNumberHelperDriver,
    required this.updateData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image(image: iconApp.helperDriverIconImage(), width: 20),

        title: const Center(
          child: Text("CTA bus service",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),),
        ),


      ),
      body: HelpDriverScreen(
        routeNumberHelpDriver: routeNumberHelpDriver,
        nameHelpDriver: nameHelpDriver,
        plateNumberHelperDriver: plateNumberHelperDriver,
        updateData: updateData,

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) =>
                AlertDialog(
                  title: const Text("للخروج من الصفحة"),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                navigateStop(context,
                                    HomeScreen()); // Navigate to HomeScreen
                              },
                              icon: const Icon(Icons.home),
                            ),
                            const Text("صفحة رئيسية"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
          );
        },
        child: const Icon(Icons.door_back_door_outlined),
      ),
    );
  }




  }





