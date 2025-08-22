import 'package:shared_preferences/shared_preferences.dart';

class CacheData{
 static late  SharedPreferences sharedPreferences ; //declare
  static  cacheInitialization() async{
  sharedPreferences= await SharedPreferences.getInstance(); //assignment
}
//method

//set
  static Future<bool> setData ({required String key, required dynamic value}) async {
  if(value is double) {
   await sharedPreferences.setDouble(key, value);
    return true;
  }
  if(value is int) {
     await sharedPreferences.setInt(key, value);
    return true;
  }
  if(value is String) {
    await sharedPreferences.setString(key, value);
    return true;
  }
  if(value is bool) {
    sharedPreferences.setBool(key, value);
    return true;
  }

  return false;
 }
 //get data => Key
  static dynamic getData({required String key}){
  return sharedPreferences.get(key);
}
//delete item=>
  static void deleteItem({
    required String key
  }){
  sharedPreferences.remove(key);
  }


}