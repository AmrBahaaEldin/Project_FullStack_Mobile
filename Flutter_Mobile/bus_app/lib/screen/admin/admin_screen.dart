import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../data/web_server/connect_app_api.dart';
import '../../shared/components/const.dart';
import '../../shared/styles/log_app.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  List<Schedule> schedules = [];

  List note=[];
  String periodTime="صباحي";

  List<Schedule> filteredSchedules = [];
  String? employeeName; // لتخزين اسم الموظف المعروض
  String? employeeIdAsString;  // لتخزين معرف الموظف كـ string
  final AdminApi scheduleService = AdminApi();
  bool showToolEmployeeData=false;
  bool isTableVisible = false;
  bool addEmployeeData = false;
  bool upEmployeeData = false;
  final ImportComponents importComponents = ImportComponents();
  final IconApp iconApp = IconApp();
  final LogApp logApp = LogApp();
  WebServices webServices =WebServices();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//add & update
  final TextEditingController employeeID = TextEditingController();
  final TextEditingController addBusID = TextEditingController();
  //final TextEditingController dateTime = TextEditingController();
  final TextEditingController scheduleId = TextEditingController();
  final TextEditingController description = TextEditingController();

  Future<void> loadInitialData() async {
    schedules = await scheduleService.loadInitialData();
    setState(() {});
  }

  Future<void> searchByEmployeeId(String employeeId) async {
    setState(() {
      filteredSchedules = [];  // تفريغ البيانات القديمة قبل البحث الجديد
      employeeName = null;
      employeeIdAsString = null;
    });

    filteredSchedules = await scheduleService.searchByEmployeeId(schedules, employeeId);
    if (filteredSchedules.isNotEmpty) {
      setState(() {
        employeeName = filteredSchedules.first.employeeName;
        employeeIdAsString = filteredSchedules.first.employeeId.toString();  // تحويل معرف الموظف إلى string
      });
    } else {
      setState(() {
        employeeName = null;  // إعادة تعيين الاسم إذا لم يتم العثور على الجداول
        employeeIdAsString = null;
      });
    }
  }
///////////////////////////////////////////////////////////
//   Future<void> selectDateTime(BuildContext context) async {
//     final DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );
//
//     if (pickedDate != null) {
//       final TimeOfDay? pickedTime = await showTimePicker(
//         context: context,
//         initialTime: TimeOfDay.now(),
//       );
//
//       if (pickedTime != null) {
//         final selectedDateTime = DateTime(
//           pickedDate.year,
//           pickedDate.month,
//           pickedDate.day,
//           pickedTime.hour,
//           pickedTime.minute,
//         );
//
//         dateTime.text = DateFormat('yyyy-MM-dd HH:mm').format(selectedDateTime);
//       }
//     }
//   }
  ////////////////////////////////////////////////////
  Future<void> addDataEmployee(BuildContext context) async {
    // نفس الخطوات السابقة لجلب البيانات

    // final DateTime selectedDate = DateFormat('yyyy-MM-dd HH:mm').parse(dateTime.text);
    //

    // استدعاء الوظيفة postLogin للحصول على الرد

    var response = await webServices.addSchedule(
      busId: addBusID.text,
      employeeId: employeeID.text,
      // dateJob:selectedDate,
    //
    );

    if (response.containsKey('message')) {
      ScaffoldMessenger.of(context).showSnackBar(

        SnackBar(
          duration: const Duration(seconds: 8),
          content: Text(
              "${response['message']}"),
          backgroundColor: Colors.blueAccent,
          action: SnackBarAction(
            label: 'تم تسجيل الموظف بنجاح' ,
            textColor: Colors.black,
            backgroundColor:Colors.green,
            onPressed: () {
              //  reloadPage();

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
  ///////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////

  Future<void> upDataEmployee(BuildContext context) async {
    // نفس الخطوات السابقة لجلب البيانات

    //final DateTime selectedDate = DateFormat('yyyy-MM-dd HH:mm').parse(dateTime.text);


    // استدعاء الوظيفة postLogin للحصول على الرد

    var response = await webServices.updateSchedule(
      scheduleId:int.parse(scheduleId.text),
      busId: int.parse(addBusID.text),
      employeeId:int.parse( employeeID.text),
      // dateJob:selectedDate,

    );

    if (response.containsKey('success') && response['success'] == true) {
      ScaffoldMessenger.of(context).showSnackBar(

        SnackBar(
          duration: const Duration(seconds: 8),
          content: const Text("تم تحديث بيانات الموظف بنجاح"),
          backgroundColor: Colors.blueAccent,
          action: SnackBarAction(
            label: 'تم تحديث بيانات الموظف بنجاح' ,
            textColor: Colors.black,
            backgroundColor:Colors.green,
            onPressed: () {
              searchByEmployeeId(employeeID.text);

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
          content: Text("${response['error']}"),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 5),
          backgroundColor: Colors.red,
          content: Text("حدث خطأ غير متوقع"),
        ),
      );
    }
  }
  ////////////////////////////////////////////////
  /////////////////////////////////////
/////////////////////////////////////////////////////////////


  @override
  void initState() {
    super.initState();
    loadInitialData();
  }

  void closeShowEmployee()async{
    setState(() {
      isTableVisible = false;// إخفاء الجدول
      employeeID.clear();  // مسح حقل الإدخال
      filteredSchedules = [];  // تفريغ البيانات القديمة
      employeeName = null;
      employeeIdAsString = null;

    });
    await loadInitialData();

  }

  void closeToolDataEmployee(){
    setState(() {
      showToolEmployeeData = false;
    });
  }

  void openToolDataEmployee() {
    setState(() {
      showToolEmployeeData = true;
    });
  }
  void addEmployee() {
    setState(() {
      addEmployeeData = true;
    });
  }
  void closeAddEmployee()async{
    setState(() {
      employeeID.clear();  // مسح حقل الإدخال
      addBusID.clear();
      // dateTime.clear();
      addEmployeeData = false;// إخفاء الجدول


    });


  }
  void openUpDateEmployee() {
    setState(() {
      upEmployeeData=true;
    });
  }
  void closeUpDateEmployee() {
    setState(() {

      employeeID.clear();
      addBusID.clear();
      // dateTime.clear();
      scheduleId.clear();
      upEmployeeData=false;
    });
  }
  void openTableAdmin() {
    setState(() {
      isTableVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      primary: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image(image: logApp.adminImage()),
          ),
          Column(
            children: [
              const SizedBox(width: 35,),
              //get data employee button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue),
                    ),
                    onPressed: () {

                      FocusScope.of(context).unfocus();
                      openToolDataEmployee();
                      closeAddEmployee();
                      closeUpDateEmployee();
                      closeShowEmployee();

                    },
                    child: const Text(
                      "  بيانات الموظف ",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  //Add Button
                  ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue),
                    ),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      addEmployee();
                      closeToolDataEmployee();
                      closeUpDateEmployee();
                      closeShowEmployee();



                    },
                    child: const Text(
                      "اضافة جدول",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  //updata Button
                  ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue),
                    ),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                        closeToolDataEmployee();
                        openUpDateEmployee();
                        closeAddEmployee();
                      closeShowEmployee();


                    },
                    child: const Text(
                      "تحديث بيانات",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),

              //////////////////////////////////////////////////////////////////////
              ///////////////////////////////////////////////////////////////////////
              ///////////////////////////////////////////////////////////////////////
              ////////////////////////////////////////////////////////////////////////
              Visibility(
                visible: upEmployeeData,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        labelText: "رقم الجدول",
                        prefixIcon:Icon(Icons.table_rows_rounded)

                    ),
                    controller: scheduleId,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "الرجاء ادخل رقم الجدول ";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Visibility(
                visible: showToolEmployeeData||addEmployeeData||upEmployeeData,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      labelText: "كود السائق",
                      prefixIcon: Image(
                        image: iconApp.driverIconImage(),
                        width: 10,
                      ),
                    ),
                    controller: employeeID,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "الرجاء ادخل الكود الموظف";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Visibility(
                 visible: addEmployeeData||upEmployeeData,
                 child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      labelText: "كود الاتوبيس",
                      prefixIcon: Image(
                        image: iconApp.busIDImage(),
                        width: 9,
                      ),
                    ),
                    controller: addBusID,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "الرجاء ادخل الكود الاول";
                      }
                      return null;
                    },
                  ),
                               ),
               ),
              Visibility(
                visible: addEmployeeData || upEmployeeData,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      labelText: "موعيد العمل",
                      prefixIcon: Icon(Icons.timelapse_sharp)
                    ),
                    value: periodTime, // القيمة الحالية للإختيار
                    items: <String>['صباحي', 'مسائي'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        periodTime = newValue!;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "الرجاء اختر موعيد العمل";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Visibility(
                visible: addEmployeeData || upEmployeeData,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: description,
                    minLines: 1,
                    maxLines: 10,
                    decoration: const InputDecoration(
                      labelText: "ملاحظات وتقييم",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      prefixIcon: Icon(Icons.note),
                    ),
                  ),
                ),
              ),





              // Visibility(
              //    visible: addEmployeeData||upEmployeeData,
              //    child: Padding(
              //     padding: const EdgeInsets.all(20.0),
              //     child: TextFormField(
              //       readOnly: true,
              //       keyboardType: TextInputType.text,
              //       decoration: InputDecoration(
              //         border: const OutlineInputBorder(
              //           borderRadius: BorderRadius.all(Radius.circular(30)),
              //         ),
              //         hintText: "تاريخ العمل",
              //         prefixIcon:
              //         IconButton(
              //           onPressed: () => selectDateTime(context),
              //           icon:const Icon(Icons.calendar_today,
              //             color:Color(0xFF2B475E),
              //
              //           ),
              //           //Icon(Icons.event,color:Color(0xFF2B475E)),
              //
              //         ),
              //
              //       ),
              //       controller: dateTime,
              //       validator: (value) {
              //         if (value!.isEmpty) {
              //           return "الرجاء ادخل الكود الاول";
              //         }
              //         return null;
              //       },
              //     ),
              //                  ),
              //  ),
              Visibility(
                visible: addEmployeeData,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ElevatedButton(
                    onPressed: () async{
                      setState(() {
                        note.add(description.text);

                      });
                       await addDataEmployee(context);
                       await  searchByEmployeeId(employeeID.text);
                      closeAddEmployee();
;                    },
                    child: const Text("اضافة"),
                  ),
                ),
              ),
              Visibility(
                visible: upEmployeeData,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ElevatedButton(
                    onPressed: () async{

                      FocusScope.of(context).unfocus();
                       await upDataEmployee(context);
                       await  searchByEmployeeId(employeeID.text);
                      closeUpDateEmployee();
                      setState(() {
                        note.add(description.text);
                      });
;                    },
                    child: const Text("رفع بيانات"),
                  ),
                ),
              ),
              Visibility(
                visible: showToolEmployeeData,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        FocusScope.of(context).unfocus();
                      });
                      searchByEmployeeId(employeeID.text);  // استدعاء الدالة بدون محاولة استخدام النتيجة بشكل غير صحيح
                      openTableAdmin();
                    },
                    child: const Text("بحث"),
                  ),
                ),
              ),
            ],
          ),
          ///Table Show Employee
          Visibility(
            visible: isTableVisible,
            child: Column(
              children: [
                if (employeeName != null)
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey.shade300),
                      width: double.infinity,
                      height: 50,
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.greenAccent,
                              radius: 25,
                              child: Image(image: iconApp.driverIconImage(),
                                width: screenWidth * 0.10,)),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text("$employeeName", // عرض اسم الموظف}
                                style: TextStyle(fontSize: screenWidth * 0.05)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text("$employeeIdAsString", // عرض اسم الموظف}
                                style: TextStyle(fontSize: screenWidth * 0.05)),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (filteredSchedules.isNotEmpty) Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        headingRowColor:const MaterialStatePropertyAll(Colors.blue),
                        columns: const [
                          DataColumn(
                              label: Text('رقم الجدول',style: TextStyle(color: Colors.white),)),
                          DataColumn(label: Text('كود الاتوبيس',style: TextStyle(color: Colors.white))),
                          DataColumn(label: Text('تاريخ',style: TextStyle(color: Colors.white),)),
                          DataColumn(label: Text('موعيد العمل',style: TextStyle(color: Colors.white),)),
                          DataColumn(label: Text('ملاحظات',style: TextStyle(color: Colors.white),)),
                        ],
                        rows: filteredSchedules.map((schedule) {
                          return DataRow(
                            cells: [
                              DataCell(Text(schedule.scheduleId.toString())),
                              DataCell(Text(schedule.busId.toString())),
                              DataCell(Text(DateFormat('yyyy-MM-dd – HH:mm:ss').format(schedule.datetime))),
                              DataCell(Text(periodTime)),
                              DataCell(
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:  note.map((n) => Text(n)).toList(),
                                ),
                              ),

                            ],
                          );
                        }).toList(),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                      onPressed:  () async {

                        closeShowEmployee();  // استدعاء الدالة المعدلة بدون محاولة استخدام النتيجة بشكل غير صحيح
                        employeeID.clear();
                        await searchByEmployeeId(employeeID.text);

                      },
                      child: const Text(
                        "اغلاق",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ) else const Center(
                  child: Text('No data found for this employee ID.'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
