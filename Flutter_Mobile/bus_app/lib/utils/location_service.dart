

import 'package:location/location.dart';

class LocationService{
  Location location=Location();
  ///First Step
  Future<void>  checkAndRequestLocationService ()async
  {
    bool isServiced= await location.serviceEnabled();
    if(!isServiced)
    {
      isServiced=await location.requestService();
      if(!isServiced)
      {
        throw LocationServiceException();
      }
    }

  }
  ///second step
  Future<void> requestLocationPermission()async
  {
    var isPermission=await location.hasPermission();
    if(isPermission==PermissionStatus.deniedForever)
    {
      throw LocationPermissionException();
    }
    if(isPermission==PermissionStatus.denied)
    {
      isPermission=await location.requestPermission();
      //granted mean  is accept
      // exist  if and else(using return bool) include if
      //return isPermission==PermissionStatus.granted;
      if(isPermission !=PermissionStatus.granted){
        throw LocationPermissionException();
      }

    }

  }
  ///third step

  void getRealTimeLocationData(void Function(LocationData)? onData)async
  {

    await checkAndRequestLocationService();
    await requestLocationPermission();
    location.onLocationChanged.listen((onData));
  }
 Future<LocationData> getLocation()async{
   await checkAndRequestLocationService();
   await requestLocationPermission();
    return await location.getLocation();
  }
}
class LocationServiceException implements Exception{}
class LocationPermissionException implements Exception{}