import 'package:flutter/material.dart';
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Navigator between pages
//can back page
void navigateTo(context,widget)=>Navigator.push(context,
    MaterialPageRoute(builder: (context) => widget));
void navigateBack(context, bool bool)=>Navigator.pop(context);
//can't back page
void navigateStop(context,widget)=>Navigator.pushAndRemoveUntil(context,
    MaterialPageRoute(
        builder: (context) => widget), (route) => false);
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Divider page
Widget myDivider()=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Container(
    width: double.infinity,
    color: Colors.grey,
    height: 2,
  ),
);
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//search //
Widget fieldButton2({
  var text,
  Widget? prefix,
  required TextInputType type,
  required TextEditingController controller,
  Function(String value)  ?onSubmit,
  Function(String value)  ?onChanged,
  required String? Function(String? value) valid ,
})=>  TextFormField(
  keyboardType: type,


  decoration: InputDecoration(hintText: text,border: const OutlineInputBorder(),prefixIcon:prefix,),
  controller: controller,
  onFieldSubmitted: onSubmit,
  onChanged: onChanged,
  validator: valid,




);
//
//Text From Field // act Email/Password
Widget fieldButton({
  required TextInputType type,
  required TextEditingController controller,
  void Function(dynamic value) ?onchange,
  Function(String value)  ?onSubmit,
  required String? Function(String? value) valid ,
  bool isPassword =false,
  required Widget prefix,
  Widget ?suffix,

  Function()?suffixPressed,
  Function()? tap,

  required String label,
  AutovalidateMode ?autoValidateMode,})=>
    TextFormField(
  onChanged:onchange,
  onFieldSubmitted: onSubmit,

  validator: valid,
  obscureText: isPassword ,

  keyboardType: type,
  controller: controller,
  onTap: tap,
  decoration: InputDecoration(

      labelText:label ,
      prefixIcon:prefix,
      suffixIcon:suffix != null?IconButton(onPressed:suffixPressed,
          icon:suffix):null,
      border: const OutlineInputBorder()  ) ,

);
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Widget defaultButton({
  double? width=double.infinity,
  double? height =50,
  bool isUppercase=false,

  required String text ,
  required  Function()   pressed,})=> Container(

  width: width,



  child: MaterialButton(
    color: Colors.blue,
    onPressed:pressed,
    height: height,


    child: Text(

      isUppercase? text.toUpperCase():text,
      style:const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,

      ) ,


    ),
  ),
);
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
