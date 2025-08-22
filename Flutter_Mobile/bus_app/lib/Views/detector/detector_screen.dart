

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../data/web_server/connect_app_api.dart';
import '../../layout/Home_Screen/home_screen.dart';
import '../../shared/components/components.dart';
import '../../shared/components/const.dart';
import '../../shared/styles/custom_icon.dart';
import '../../shared/styles/log_app.dart';






class DetectorScreen  extends StatefulWidget {
   const DetectorScreen ({super.key});

  @override
  State<DetectorScreen> createState() => _DetectorScreenState();
}
class _DetectorScreenState extends State<DetectorScreen> {
WebServices webServices =WebServices();
final formKey = GlobalKey<FormState>();

  final IconApp iconApp=IconApp();
  // The group value
  var result1;
  var result2;
  var result3;
  var result4;

   ImportComponents importComponents=ImportComponents();

   TextEditingController platNumber=TextEditingController();
   TextEditingController description=TextEditingController();

   TextEditingController driverCode=TextEditingController();

   TextEditingController getData=TextEditingController();
Future<void> selectDateTime(BuildContext context) async {
  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2101),
  );

  if (pickedDate != null) {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      final selectedDateTime = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );

      getData.text = DateFormat('yyyy-MM-dd HH:mm').format(selectedDateTime);
    }
  }
}
 @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  Future<void> sendReport(BuildContext context) async {
    // نفس الخطوات السابقة لجلب البيانات

    final DateTime selectedDate = DateFormat('yyyy-MM-dd HH:mm').parse(getData.text);
    final bool isNumberTicket = result1 == 1;
    final bool isDriverCommitted = result2 == 1;
    final bool isBusCrowded = result3 == 1;
    final bool isDriverWell = result4 == 1;

    // استدعاء الوظيفة postLogin للحصول على الرد

      var response = await webServices.postDetector(
        employeeID: driverCode.text,
        plateNumber: platNumber.text,
        dataRide: selectedDate,
        isNumberTicket: isNumberTicket,
        isDriverCommitted: isDriverCommitted,
        isBusCrowded: isBusCrowded,
        isDriverWell: isDriverWell,
        description: description.text,
      );

      if (response.containsKey('message')) {
        ScaffoldMessenger.of(context).showSnackBar(

          SnackBar(
            duration: const Duration(seconds: 8),
            content: Text(
              "${response['message']}"),
          backgroundColor: Colors.blueAccent,
            action: SnackBarAction(
              label: 'سجل تقرير جديد' ,
              textColor: Colors.black,
              backgroundColor:Colors.green,
              onPressed: () {

                navigateBack(context,true);

              },
            ),
          ),
        );
      }
      else if (response.containsKey('error')) {
        ScaffoldMessenger.of(context).showSnackBar(

          SnackBar(
            duration: const Duration(seconds: 5),
            backgroundColor: Colors.red,
              content:
              Text("${response["error"]}"),

          ),
        );
      }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:AppBar(
        leading:const Image(image:AssetImage( "asset/image/bus-driver.png"),width: 20),

        title:const Center(
          child: Text("CTA bus service",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),),
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
      body: SingleChildScrollView(
        primary: false,

        child: Form(
          key:formKey,
          child: Padding(
            padding:  EdgeInsets.all(screenWidth * 0.05),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                            // Container(
                            //
                            //   decoration: BoxDecoration( borderRadius: BorderRadius.circular(30),color: Colors.grey.shade300),
                            //   width:double.infinity,
                            //   height: 50,
                            //   child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //     children: [
                            //       CircleAvatar(
                            //           backgroundColor: Colors.green,
                            //           radius: 25,
                            //           child: Image(image:iconApp.detectorImage(),width: screenWidth * 0.10,)),
                            //
                            //        Padding(
                            //          padding: const EdgeInsets.only(left: 8.0),
                            //          child: Text("ازيك يا استاذ حسن ",style: TextStyle(fontSize: screenWidth * 0.05)),
                            //        ),
                            //     ],
                            //   ),
                            // ),
                            Column(
                              children: [
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                  children: [
                                     Text("لوحة سيارة",style:
                                    TextStyle(fontSize:screenWidth * 0.04 , fontWeight: FontWeight.bold),),
                                    SizedBox(
                                      width: screenWidth * 0.5,
                                      child: Padding(
                                        padding:  EdgeInsets.all(screenWidth * 0.02),
                                        child: TextFormField(


                                          controller: platNumber,
                                          keyboardType: TextInputType.text,
                                          decoration: const InputDecoration(
                                            fillColor: Colors.blue,
                                            filled: true,
                                            prefixIcon: Icon(MyCustomIconApp.license_plate,color:Color(0xFF2B475E)),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(30)),
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return 'الرجاء اتدخل لوحة سيارة';
                                            }
                                            return null;
                                          },

                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("كود السائق",style:
                                    TextStyle(fontSize:screenWidth * 0.04 , fontWeight: FontWeight.bold),),
                                    SizedBox(
                                      width: screenWidth * 0.5,
                                      child: Padding(
                                        padding:  EdgeInsets.all(screenWidth * 0.02),
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return 'الرجاء اتدخل كود ';
                                            }
                                            return null;
                                          },
                                          controller: driverCode,
                                          keyboardType: TextInputType.number,
                                          decoration: const InputDecoration(
                                            prefixIcon: Icon(Icons.perm_identity,color:Color(0xFF2B475E)),
                                            fillColor: Colors.blue,
                                            filled: true,

                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(30)),
                                            ),
                                          ),

                                        ),
                                      ),
                                    ),
                                  ],
                                          ),
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("تاريخ",style:
                                    TextStyle(fontSize:screenWidth * 0.04 , fontWeight: FontWeight.bold),),
                                    SizedBox(
                                      width: screenWidth * 0.5,
                                      child: Padding(

                                        padding:  EdgeInsets.all(screenWidth * 0.02),
                                        child: TextFormField(
                                          readOnly: true,
                                          controller: getData,
                                          keyboardType: TextInputType.text,
                                          decoration:
                                          InputDecoration(
                                            fillColor: Colors.blue,
                                            filled: true,
                                            prefixIcon:
                                            IconButton(
                                              onPressed: () => selectDateTime(context),
                                              icon:const Icon(Icons.calendar_today,
                                                color:Color(0xFF2B475E),

                                              ),
                                              //Icon(Icons.event,color:Color(0xFF2B475E)),

                                            ),

                                            border: const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                            ),

                                        ),
                                          validator:
                                              (value) {
                                            if (value == null || value.isEmpty) {
                                              return 'الرجاء اتدخل التاريخ';
                                            }
                                            return null;
                                          },


                                                                                ),
                                    ),
                                    ),
                                  ],
                                                    ),
                              ],
                            ),
                //////////////////////////////////////////////////////////////////////
                const Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                const Text("هل مع كل ركاب تذكرة",style: TextStyle(fontSize: 20,color: Colors.green)),
                Column(
                  children: [
                    RadioListTile(

                        title: const Text('نعم'),
                        value: 1,
                        groupValue: result1,
                        onChanged: (value) {
                          setState(() {
                            result1 = value;
                          });
                        }),
                    RadioListTile(
                        title: const Text('لا'),
                        value: 0,
                        groupValue: result1,
                        onChanged: (value) {
                          setState(() {
                            result1 = value;
                          });
                        }),
                  ],
                ),
                const Text("السائق ملتزم بالطريق",style: TextStyle(fontSize: 20,color: Colors.green)),
                Column(
                  children: [
                    RadioListTile(
                        title: const Text('نعم'),
                        value: 1,
                        groupValue: result2,
                        onChanged: (value) {
                          setState(() {
                            result2 = value;
                          });
                        }),
                    RadioListTile(
                        title: const Text('لا'),
                        value: 0,
                        groupValue: result2,
                        onChanged: (value) {
                          setState(() {
                            result2 = value;
                          });
                        }),
                  ],
                ),
                const Text("كثافة عدد الركاب  ",style: TextStyle(fontSize: 20,color: Colors.green)),
                Column(
                  children: [
                    RadioListTile(
                        title: const Text('مزدحم'),
                        value: 1,
                        groupValue: result3,
                        onChanged: (value) {
                          setState(() {
                            result3 = value;
                          });
                        }),


                    RadioListTile(
                        title: const Text('قليل'),
                        value: 0,
                        groupValue: result3,
                        onChanged: (value) {
                          setState(() {
                            result3 = value;
                          });
                        }),
                  ],
                ),
                const Text(" معاملة مساعد السائق مع الناس جديدة",style: TextStyle(fontSize: 20,color: Colors.green)),
                Column(
                  children: [
                    RadioListTile(
                        title: const Text('نعم'),
                        value: 1,
                        groupValue: result4,
                        onChanged: (value) {
                          setState(() {
                            result4 = value;
                          });
                        }),
                    RadioListTile(
                        title: const Text('لا'),
                        value: 0,
                        groupValue: result4,
                        onChanged: (value) {
                          setState(() {
                            result4 = value;
                          });
                        }),
                  ],
                ),


            ////////////////////////////////////////////////////////////////////////////////
             Padding(
              padding: EdgeInsets.all(screenWidth * 0.05),
              child:  TextField(
                controller:description ,
                                minLines: 1,
                                maxLines: 10,
                                decoration: const InputDecoration(
                                  labelText: "ملاحظات وتقيم",
                                  border: OutlineInputBorder(),
                                ),
                              ),
            ),
                          Center(
                            child:ElevatedButton(
                              style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                              onPressed: () {
                                // إخفاء لوحة المفاتيح
                                FocusScope.of(context).unfocus();
                                if (formKey.currentState!.validate()){
                                  sendReport(context);

                                }

                              },
                              child: const Text(
                                "ارسال",
                              ),
                            )
                          ),
              ],
            ),
          ),
        ),
      ) ,
    );

  }
}

