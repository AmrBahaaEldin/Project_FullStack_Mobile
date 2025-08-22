

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/web_server/connect_app_api.dart';
import '../../shared/components/const.dart';
import '../../shared/styles/log_app.dart';
import '../adminApp/admin_view.dart';
import '../detector/intro_work_detector_view.dart';
import '../driver/driver_view.dart';
import '../helpDriver/help_driver_view.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late WebServices webServices;
  IconData suffixIconPassword = Icons.visibility_outlined;
  bool isPassword = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  LogApp logApp = LogApp();
  IconApp iconApp = IconApp();
  ImportComponents importComponents = ImportComponents();

  late String employeeType;

  late String employeeName;

  late String routeNumber;

  late String plateNumber;

  late String jobId;

  @override
  void initState() {
    super.initState();
    webServices = WebServices();
  }

  void updateData() async {
    // Authenticate and get the response
    final response = await authenticate(
      username: emailController.text,
      password: passwordController.text,
    );

    // Check if the response is not empty
    if (response.isNotEmpty) {
      setState(() {
        employeeType = response["job_name"].toString();
        employeeName = response["name"].toString();
        jobId = response["job_id"].toString();
        routeNumber = "00";
        plateNumber = "00";

        if (response["schedule"] != null) {
          routeNumber =
              response["schedule"]["bus"]["bus_id"]?.toString() ?? "00";
          plateNumber =
              response["schedule"]["bus"]["plate_number"]?.toString() ?? "00";
        }
      });

      // Navigate to the appropriate screen with the updated data
      navigateToEmployeeScreen(
        context,
        employeeType,
        jobId,
        routeNumber,
        plateNumber,
        employeeName,
      );
    } else {
      print("Failed to authenticate or empty data received.");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image(image: iconApp.loginLog()),
        title: const Center(
          child: Text(
            "CTA bus service",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context, true),
            icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        primary: false,
        child: Column(
          children: [
            const Image(
              image: AssetImage("asset/image/bus_login.png"),
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 10),
            const Column(
              children: [
                Text(
                  'مرحبا ',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'حافظ على حياتك وحياة الآخرين',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("تسجيل الدخول ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30)),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0xff1F8BE7),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        labelText: "حساب",
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "الرجاء إدخال حسابك بشكل صحيح";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 45),
                    TextFormField(
                      obscureText: isPassword,
                      controller: passwordController,
                      style: const TextStyle(fontWeight: FontWeight.normal),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xff1F8BE7),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 14,
                        ),
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                        labelText: "كلمة السر",
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          onPressed: () {
                            changePasswordVisibility();
                            setState(() {});
                          },
                          icon: Icon(suffixIconPassword),
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "الرجاء إدخال رقم السر بشكل صحيح";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                            MaterialStatePropertyAll(Colors.blue)),
                        child: const Text(
                          "دخول",
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () async {
                          FocusScope.of(context).unfocus();
                          if (formKey.currentState!.validate()) {
                            final response = await authenticate(
                              username: emailController.text,
                              password: passwordController.text,
                            );
                            handleNavigation(context, response);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void changePasswordVisibility() {
    setState(() {
      isPassword = !isPassword;
      suffixIconPassword = isPassword
          ? Icons.visibility_outlined
          : Icons.visibility_off_outlined;
    });
  }

  Future<Map<String, dynamic>> authenticate(
      {required String username, required String password}) async {
    try {
      return await webServices.getLogin(username: username, password: password);
    } catch (e) {
      return {};
    }
  }

  Future<void> handleNavigation(
      BuildContext context, Map<String, dynamic> response) async {
    if (response.isEmpty) {
      importComponents.messageLoginError(context);
      return;
    }

     employeeType = response["job_name"].toString();
     employeeName = response["name"].toString();
     jobId = response["job_id"].toString();
     routeNumber = "00";
     plateNumber = "00";

    if (response["schedule"] != null) {
      routeNumber =
          response["schedule"]["bus"]["route_number"]?.toString() ?? "00";
      plateNumber =
          response["schedule"]["bus"]["plate_number"]?.toString() ?? "00";
    }

    bool shouldRefresh = await navigateToEmployeeScreen(context, employeeType, jobId, routeNumber, plateNumber, employeeName);

    if (shouldRefresh) {
      setState(() {
        updateData();
      });
    }
  }

  Future<bool> navigateToEmployeeScreen(
      BuildContext context,
      String employeeType,
      String jobId,
      String routeNumber,
      String plateNumber,
      String employeeName) {
    if (employeeType == 'Driver' && jobId == "200") {
      return navigateTo(
        context,
        DriverView(
          routeNumberDriver: routeNumber,
          nameDriver: employeeName,
          plateNumberDriver: plateNumber,
          updateData: updateData,
        ),
      );
    } else if (employeeType == 'Inspector' && jobId == "100") {
      return navigateTo(
        context,
        IntroWorkDetectorView(
          routeNumberDetector: routeNumber,
          nameDetector: employeeName,
          plateNumberDetector: plateNumber,
          updateData: updateData, // Pass the updateData method here
        ),
      );
    } else if (employeeType == 'Admin' && jobId == "400") {
      return navigateTo(context, AdminView());
    } else if (employeeType == 'Conductor' && jobId == "300") {
      return navigateTo(
        context,
        HelperDriverView(
          routeNumberHelpDriver: routeNumber,
          nameHelpDriver: employeeName,
          plateNumberHelperDriver: plateNumber,
          updateData: updateData,
        ),
      );
    }
    return Future.value(false);
  }


  Future<bool> navigateTo(BuildContext context, Widget widget) async {
    bool shouldRefresh = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
    return shouldRefresh;
  }
}
