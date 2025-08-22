
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/models/setting_data.dart';

import '../../shared/cubit/cubit.dart';
import '../../shared/styles/log_app.dart';
class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  LogApp logApp=LogApp();
  final String email = 'public_transport@cairo.gov.eg';
  final String phone = '23420765';
  void launchEmail(String email) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    await launch(emailLaunchUri.toString());
  }

  void launchPhone(String phone) async {
    final Uri phoneLaunchUri = Uri(
      scheme: 'tel',
      path: phone,
    );
    await launch(phoneLaunchUri.toString());
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {

   String? selectedLanguage='ar';
    return    SingleChildScrollView(
      primary: false,

      //physics: const BouncingScrollPhysics(),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Image(image:logApp.settingImage()),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    const Text("Theme"),

                   Switch(
                     activeColor: Colors.grey,
                    inactiveThumbColor: Colors.blue,
                     inactiveTrackColor: Colors.grey,
                     activeTrackColor: Colors.black,
                     value: AppCubit.get(context).isDark,
                       onChanged: (value) {
                     setState(() {

                       AppCubit.get(context).changeTheme();
                     });

                       },)
                   /* TextButton(onPressed: () {

                        AppCubit.get(context).changeTheme();
                    },
                        child:const Icon(Icons.brightness_4_outlined) ),*/
                  ],
                ),

              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    const Text("language"),

                    DropdownButton(
                      hint: const Text('language'),
                      value: selectedLanguage,
                      onChanged: (value) {

                        setState(() {

                          selectedLanguage=value ;

                        });

                      },

                      items: language.map((lang) {
                        return  DropdownMenuItem(

                          value: lang,
                          child: Text(lang),
                        );
                      }).toList(),

                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
               //const Text("Contact us",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 25)),
              const Text('إذا كان لديك أي أسئلة، فلا تتردد في الاتصال بنا',style: TextStyle(color: Colors.red,fontSize:15,fontWeight: FontWeight.bold )),
              const SizedBox(height: 16),
               InkWell(
          onTap: () => launchEmail(email),
      child: Text(email,
        style: const TextStyle(
          color: Colors.blue,
          fontSize: 15,
          decoration: TextDecoration.underline,
        ),
      ),
    ),
              const SizedBox(height: 16),
              InkWell(
          onTap: ()=>launchPhone(phone),
      child: Text(
        phone,
        style: const TextStyle(
          color: Colors.blue,
          fontSize: 15,
          decoration: TextDecoration.underline,
        ),
      ),
    ),





            ]),
      ),
    );

  }


}
