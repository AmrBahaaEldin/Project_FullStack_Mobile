import 'package:flutter/material.dart';


import '../../data/web_server/connect_app_api.dart';
import '../../screen/TourStation/data_table_screen.dart';
import '../../shared/styles/log_app.dart';



class TourStationScreen extends StatefulWidget {
  const TourStationScreen({Key? key}) : super(key: key);

  @override
  State<TourStationScreen> createState() => _TourStationScreenState();
}

class _TourStationScreenState extends State<TourStationScreen> {

  List<Map<String, dynamic>> filteredData = [];
  late List<Map<String, dynamic>> data=[];
  TextEditingController searchController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  late WebServices webServices;
  String searchText = "";
  var selectedSearchType = "المدينة";
LogApp logApp=LogApp();
  bool isSearching = false; // متغير لتتبع حالة البحث
  @override
  void initState() {
    super.initState();
    webServices = WebServices();
    filteredData = [];


  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Map<String,dynamic>>>(
        future: webServices.getDataTable(),
        builder: (context, snapshot) {
          if (snapshot.hasError){
            return Center(child: Text('Error: ${snapshot.error}'));
          }else if(!snapshot.hasData){
            return const Center(child: CircularProgressIndicator());
          }
          else {
            data = snapshot.data!;

            if (filteredData.isEmpty) {
              // عند التحميل الأول، اجعل filteredData هي نفسها data
              filteredData = List<Map<String, dynamic>>.from(data);
            }
              return SingleChildScrollView(
              primary: false,

              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Center(
                      child: Image(
                        image: logApp.tourStationImage(),
                        height: 300,
                        width: 400,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "دليل المحطات",
                      style: TextStyle(color: Color(0xFF0057FF),
                          fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: searchController,
                            style: const TextStyle(fontWeight: FontWeight.normal),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(
                                  color: Colors.yellow, // Default border color
                                  width: 2.0,
                                ),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(
                                  color: Color(0xFF0057FF), // Color when the TextFormField is enabled
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(
                                  color:Color(0xFF0057FF), // Color when the TextFormField is focused
                                  width: 2.0,
                                ),
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(
                                  color: Colors.red, // Color when there's an error
                                  width: 2.0,
                                ),
                              ),
                              focusedErrorBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(
                                  color: Colors.red, // Color when the TextFormField is focused and there's an error
                                  width: 2.0,
                                ),
                              ),
                              labelText: selectedSearchType,
                              labelStyle: const TextStyle(color: Color(0xFF0057FF),),
                              prefixIcon: const Icon(Icons.search, color: Colors.blue),
                              suffixIcon: chooseSearchData(),
                            ),
                            keyboardType: TextInputType.text,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "الرجاء إدخال البيانات بشكل صحيح";
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                searchText = value;
                              });
                            },
                          ),


                        ],
                      ),
                    ),
                  ),

                  ElevatedButton(



                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      checkDataTable();

                    },
                    child:const Text( "البحث",style:
                    TextStyle(color: Color(0xFF0057FF),

                    )),),
                  if (isSearching||noResultsMessage.isNotEmpty) // يظهر زر الإغلاق فقط عند البحث
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          filteredData = List<Map<String, dynamic>>.from(data);
                          isSearching = false; // تحديث حالة البحث
                          noResultsMessage = ""; // إخفاء رسالة "لم يتم العثور على نتائج"
                          searchController.clear(); // تفريغ حقل البحث
                        });
                      },
                      child: const Text(
                        "إغلاق",
                        style: TextStyle(
                          color: Color(0xFF0057FF),
                        ),
                      ),
                    ),




                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: noResultsMessage.isEmpty?DataTableScreen(filteredData: filteredData,):Center(child: Text(noResultsMessage)), // إذا لم يكن هناك بيانات
                  ),
                ],
              ),
            );
          }
        },
    );

  }

  DropdownButton<String> chooseSearchData() {
    return DropdownButton(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    dropdownColor: Colors.white60,
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                    icon: const Icon(
                      Icons.arrow_downward,
                      color: Colors.blue,
                    ),
                    value: selectedSearchType,
                    items: <String>["المدينة", "رقم الاتوبيس", "المناطق", "السعر"].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (changeValue) {
                      setState(() {
                        selectedSearchType = changeValue!;
                      });
                    },
                  );
  }

  String noResultsMessage = "";
// رسائل الخطأ
  void checkDataTable() {
    if (formKey.currentState!.validate()) {
      // تصفية البيانات بناءً على نوع البحث والنص المدخل
      filteredData = data.where((entry) {
        switch (selectedSearchType) {
          case 'المدينة':
            return entry['City']
                .toString()
                .toLowerCase()
                .contains(searchText.toLowerCase());
          case 'رقم الاتوبيس':
            return entry['Bus Number'].toString().contains(searchText);
          case 'المناطق':
            return entry['Stations']
                .toString()
                .toLowerCase()
                .contains(searchText.toLowerCase());
          case 'السعر':
            return entry['Price'].toString().contains(searchText);
          default:
            return false;
        }
      }).toList();

      if (filteredData.isEmpty) {
        noResultsMessage = "لم يتم العثور على نتائج"; // رسالة خطأ إذا لم يكن هناك نتائج
      } else {
        noResultsMessage = ""; // إعادة تعيين الرسالة إذا كان هناك نتائج
      }

      isSearching = true; // تحديث حالة البحث
      // تحديث واجهة المستخدم
      setState(() {});
    }
  }

}

