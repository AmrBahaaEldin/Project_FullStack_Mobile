




import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';

class WebServices {
  final dio = Dio();

  Future<List<Map<String, dynamic>>> getDataTable() async {
    //get
    //post insert & del & edit
    try {
      final response = await dio.request(

        'http://192.168.1.5:8000/guide/',
        options: Options(
          method: 'GET',
          // 10 seconds timeout
        ),
      );

      return List<Map<String, dynamic>>.from(response.data);
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////
//////////////////////////
/////////////////
  Future<Map<String, dynamic>> getLogin(
      {required String username, required String password}) async {
    try {
      Response response = await dio.get(
        'http://192.168.1.5:8000/employees/login/',

        queryParameters: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return response.data; // تأكد من البيانات التي تتوقعها
      } else {
        throw Exception("فشل في تسجيل الدخول: ${response.statusCode}");
      }
    } catch (e) {
      print("خطأ أثناء إرسال الطلب: $e");
      throw Exception("فشل في تسجيل الدخول");
    }
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////
//////////////////////////
/////////////////
////////////
//////////
///////
//////



  Future<List<dynamic>> getAllStations() async {
    try {
      final response = await dio.get('http://192.168.1.5:8000/guide/get_all_stations');

      return response.data;
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }



  ////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////
  ///////////////////////////////////
  /////////////////////////
  //////////////////////////
  /////////////////////
  ////////
  ////////////////////////////////////////
  ///////////////////////
  ///////////////
  ////////////////////////////////////////////////
  Future<Map<String,dynamic>> addSchedule(
      {
        required String employeeId,
        required String busId,
        // required DateTime dateJob,
      })async

  {
    // final dateString = DateFormat('yyyy-MM-dd').format(dateJob);
    final addEmployeeJob = {
      "employee_id": employeeId,
      "bus_id": busId,
      // "datetime":dateString

    };

    try {
      // إرسال الطلب
      Response response = await dio.post(
        'http://192.168.1.5:8000/schedule/add_schedule/',
        data: addEmployeeJob,
      );
      print("البيانات المرسلة: $addEmployeeJob");

      return response.data; // الاستجابة بنجاح
    }
    on DioException catch  (e) {

      if (e.response != null) {
        if (e.response!.statusCode == 400) {
          print('Error: Bad request. ${e.response!.data}');
          return e.response!.data;

        } else {
          print('Error: ${e.response!.statusCode} - ${e.response!.statusMessage}');
        }
      } else {
        // لم يتم استلام استجابة من الخادم
        print('Error: No response from server. Check your network connection.');
      }
      throw Exception("Request failed with status code ${e.response?.statusCode}");
    }
  }
////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////


  Future<Map<String,dynamic>> updateSchedule({
    required int scheduleId,
    required  int employeeId,
    required  int busId,
    // required DateTime dateJob,
   }
      ) async {

    final String url = 'http://192.168.1.5:8000/schedule/update_schedule/$scheduleId/';

    try {
      // final dateString = DateFormat('yyyy-MM-dd').format(dateJob);
      // إعداد البيانات المطلوبة
      final data = {
        'employee_id': employeeId,
        'bus_id': busId,
        // "datetime":dateString,
      };

      // إرسال الطلب
      final response = await dio.post(
        url,
        data: data,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      return response.data;
    }


      on DioException catch  (e) {

      if (e.response != null) {
        if (e.response!.statusCode == 404) {
          print('Error: Bad request. ${e.response!.data}');
          return e.response!.data;

        } else {
          print('Error: ${e.response!.statusCode} - ${e.response!.statusMessage}');
        }
      } else {
        // لم يتم استلام استجابة من الخادم
        print('Error: No response from server. Check your network connection.');
      }
      throw Exception("Request failed with status code ${e.response?.statusCode}");
    }
  }



  //////////////////
  ///////////////
  //////////
  /////////////
/////////////////////////////////////////////////////////////////////
  Future<Map<String, dynamic>> postDetector({
    required String employeeID,
    required String plateNumber,
    required DateTime dataRide,
    required bool isNumberTicket,
    required bool isDriverCommitted,
    required bool isBusCrowded,
    required bool isDriverWell,
    String? description,
  }) async {
    final dateString = DateFormat('yyyy-MM-dd').format(dataRide);

    final dataReport = {
      "employee_id": employeeID,
      "plate_number_bus": plateNumber,
      "date_ride": dateString,
      "number_of_tickets_equal_number_of_passenger": isNumberTicket,
      "driver_committed_to_route": isDriverCommitted,
      "bus_crowded": isBusCrowded,
      "driver_treated_well": isDriverWell,
      "description": description,
    };

    try {
      Response response = await Dio().post(
        'http://192.168.1.5:8000/reporting/',
        data: dataReport,
      );

      print("البيانات المرسلة: $dataReport");

      return response.data; // الاستجابة بنجاح

    }
    on DioException catch  (e) {

      if (e.response != null) {
        if (e.response!.statusCode == 400) {
          print('Error: Bad request. ${e.response!.data}');
          return e.response!.data;

        } else {
          print('Error: ${e.response!.statusCode} - ${e.response!.statusMessage}');
        }
      } else {
        // لم يتم استلام استجابة من الخادم
        print('Error: No response from server. Check your network connection.');
      }
      throw Exception("Request failed with status code ${e.response?.statusCode}");
    }
  }
  ///////////////////////////////////////////////

  Future<Map<String, dynamic>> getRouteNumber(
      {required int routeNumber, required LatLng userLiveLocation}) async {
    try {
      Response response = await dio.get(
        'http://192.168.1.5:8000/guide/route_with_ordered_stations/',

        queryParameters: {
          'route_number': routeNumber,
          'latitude': userLiveLocation.latitude,
          'longitude': userLiveLocation.longitude,
        },
      );

      if (response.statusCode == 200) {
        return response.data; // تأكد من البيانات التي تتوقعها
      }

      else {
        throw Exception("فشل في تسجيل الدخول: ${response.statusCode}");
      }
    }   on DioException catch  (e) {

      if (e.response != null) {
        if (e.response!.statusCode == 400) {
          print('Error: Bad request. ${e.response!.data}');
          return e.response!.data;

        } else {
          print('Error: ${e.response!.statusCode} - ${e.response!.statusMessage}');
        }
      } else {
        // لم يتم استلام استجابة من الخادم
        print('Error: No response from server. Check your network connection.');
      }
      throw Exception("Request failed with status code ${e.response?.statusCode}");
    }

    }

///////////////////////////////////////////////////
  ///////////////////////////////////////////////
  ////////////////////////////////////////
  ///////////////////////////////////
  ///////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////



////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////
  Future<Map<String, dynamic>> findStation(
      {required String stationName, required LatLng userLiveLocation}) async {
    try {
      Response response = await dio.get(
        'http://192.168.1.5:8000/guide/find_station/',

        queryParameters: {
          'station_name': stationName,
          'latitude': userLiveLocation.latitude,
          'longitude': userLiveLocation.longitude,
        },
      );

      if (response.statusCode == 200) {
        print(response.data);
        return response.data; // تأكد من البيانات التي تتوقعها
      }

      else {
        throw Exception("فشل في تسجيل الدخول: ${response.statusCode}");
      }
    }   on DioException catch  (e) {

      if (e.response != null) {
        if (e.response!.statusCode == 400) {
          print('Error: Bad request. ${e.response!.data}');
          return e.response!.data;

        } else {
          print('Error: ${e.response!.statusCode} - ${e.response!.statusMessage}');
        }
      } else {
        // لم يتم استلام استجابة من الخادم
        print('Error: No response from server. Check your network connection.');
      }
      throw Exception("Request failed with status code ${e.response?.statusCode}");
    }

  }









  }



























class AdminApi{
  final dio = Dio();
  Future<List<Schedule>> loadInitialData() async {
    try {
      var response = await dio.get('http://192.168.1.5:8000/schedule/get_schedules/');
      if (response.statusCode == 200) {
        return (response.data as List).map((item) => Schedule.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Network Error');
    }
  }

  Future<List<Schedule>> searchByEmployeeId(List<Schedule> schedules, String employeeId) async {
    return schedules.where((item) => item.employeeId.toString() == employeeId).toList();
  }
}
class Schedule {
  final int scheduleId;
  final int employeeId;
  final String employeeName;
  final int busId;
  final DateTime datetime;

  Schedule({required this.scheduleId,required this.employeeId, required this.employeeName, required this.busId, required this.datetime});

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      scheduleId: json["schedule_id"],
      employeeId: json['employee_id'],
      employeeName: json['employee_name'],
      busId: json['bus_id'],
      datetime: DateTime.parse(json['datetime']),



    );
  }
}









///////////////////////////////////////////////

























