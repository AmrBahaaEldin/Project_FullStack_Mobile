import 'package:flutter/material.dart';
import '../../shared/components/const.dart';
import '../../shared/styles/log_app.dart';

class HelpDriverScreen extends StatefulWidget {
  final String routeNumberHelpDriver;
  final String nameHelpDriver;
  final String plateNumberHelperDriver;
  final VoidCallback updateData;

  const HelpDriverScreen({
    Key? key,
    required this.routeNumberHelpDriver,
    required this.nameHelpDriver,
    required this.plateNumberHelperDriver,
    required this.updateData,
  }) : super(key: key);

  @override
  State<HelpDriverScreen> createState() => _DriverScreenState();
}

class _DriverScreenState extends State<HelpDriverScreen> {
  final ImportComponents importComponents = ImportComponents();
  final IconApp iconApp = IconApp();
  final LogApp logApp = LogApp();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(
              image: logApp.driverImageHome(),
              width: screenWidth * 0.8,
            ),
          ),
          const SizedBox(height: 120),
          Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              width: 300,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("كمسري :", style: TextStyle(color: Colors.white)),
                      const SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          widget.nameHelpDriver,
                          style: const TextStyle(color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("رقم الاتوبيس :", style: TextStyle(color: Colors.white)),
                      const SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          widget.routeNumberHelpDriver,
                          style: const TextStyle(color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("رقم اللوحة :", style: TextStyle(color: Colors.white)),
                      const SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          widget.plateNumberHelperDriver,
                          style: const TextStyle(color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("موعد العمل :", style: TextStyle(color: Colors.white)),
                      SizedBox(width: 10),
                      Text("صباحي", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("ملاحظات:", style: TextStyle(color: Colors.white)),
                      SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          "حافظ علي هدوءك في الطريق_عدم الشجار في الطريق",
                          style: TextStyle(color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),
          MaterialButton(
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: () {
              widget.updateData();
            },
            child: const Text("تحديث المهمة"),
          ),
        ],
      ),
    );
  }
}
