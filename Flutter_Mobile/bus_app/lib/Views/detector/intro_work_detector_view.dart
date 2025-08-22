
import 'package:flutter/material.dart';
import '../../shared/components/const.dart';
import '../../shared/styles/log_app.dart';
import 'intro_work_detector_screen.dart';


class IntroWorkDetectorView extends StatefulWidget {
  final String nameDetector;
  final String routeNumberDetector;
  final String  plateNumberDetector;
  final VoidCallback updateData; // إضافة مرجع لميثود التحديث

  const IntroWorkDetectorView({
    super.key,
    required this.nameDetector,
    required this.routeNumberDetector,
    required this.plateNumberDetector,
    required this.updateData, // استقبال مرجع التحديث هنا

  });

  @override
  State<IntroWorkDetectorView> createState() => _IntroWorkDetectorViewState();
}

class _IntroWorkDetectorViewState extends State<IntroWorkDetectorView> {
  final IconApp iconApp=IconApp();

  final ImportComponents importComponents=ImportComponents();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:Image(image: iconApp.detectorIconImage(),width: 20),

        title:const Center(
          child: Text("CTA bus service",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),),
        ),


      ),
      body:  IntroDetectorScreen(
        name:widget.nameDetector ,
        routeNumber: widget.routeNumberDetector,
          plateNumber: widget.plateNumberDetector,
        updateData: widget.updateData,
      ),

    );

  }
}
