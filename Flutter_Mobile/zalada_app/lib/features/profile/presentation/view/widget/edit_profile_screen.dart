import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zalada_app/core/constant/color_app.dart';
import 'package:zalada_app/core/constant/style_app.dart';
import 'package:zalada_app/core/widgets/custom_button_app.dart';
import 'package:zalada_app/core/widgets/custom_text_field_app.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 44.h,
                width: 44.h,
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(34.r),
                    bottomRight: Radius.circular(34.r),
                    topLeft: Radius.circular(34.r),
                    topRight: Radius.circular(34.r),
                  ),
                  border: Border.all(color: ColorApp.blue100, width: 1.w),
                ),
                child: Icon(Icons.arrow_back_outlined, size: 20.sp),
              ),
            ),
            const CustomButtonApp(text: "Payment Method"),
            SizedBox(width: 10.w),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
          decoration: BoxDecoration(),
          child: Column(
            children: [
              SizedBox(height: 24.h),
              CircleAvatar(
                radius: 60.r,
                backgroundImage: AssetImage('assets/png/img_11.png'), //
              ),
              CustomTextFieldApp(
                controller: TextEditingController(),
                labelText: "Full Name",
                keyboardType: TextInputType.name,
                textHint: "Bryan Adam",
                colorEnableBorder: ColorApp.green100,
                colorFocusedBorder: ColorApp.green100,
              ),
              SizedBox(height: 16.h),

              // DatePickerScreen(),
              SizedBox(height: 16.h),
              CustomTextFieldApp(
                colorEnableBorder: ColorApp.blue100,
                colorFocusedBorder: ColorApp.blue100,
                controller: TextEditingController(),
                labelText: "Email Address",
                keyboardType: TextInputType.emailAddress,
                textHint: "bryan.adam87@gmail.com",
              ),
              SizedBox(height: 16.h),
              const PhoneNumberInput(),
              SizedBox(height: 16.h),
              CustomDropDown(),
              SizedBox(height: 24.h),
              CustomButtonApp(text: "Save Changes"),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Male",
          style: StylesTextApp.textStyle12.copyWith(color: ColorApp.blue100),
        ),
        SizedBox(height: 8.h),
        DropdownButtonFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          items: [
            DropdownMenuItem(
              value: "Male",
              child: Text(
                "Male",
                style: StylesTextApp.textStyle16.copyWith(
                  color: ColorApp.blue100,
                ),
              ),
            ),
            DropdownMenuItem(
              value: "Female",
              child: Text(
                "Female",
                style: StylesTextApp.textStyle16.copyWith(
                  color: ColorApp.blue100,
                ),
              ),
            ),
          ],
          onChanged: (value) {},
        ),
      ],
    );
  }
}

class PhoneNumberInput extends StatelessWidget {
  const PhoneNumberInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "General Phone Number",
          style: StylesTextApp.textStyle16.copyWith(color: ColorApp.blue100),
        ),
        SizedBox(height: 8.h),
        Container(
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              // Country Code Section
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                child: Row(
                  children: [
                    // Country Flag
                    Image(
                      image: AssetImage('assets/png/flag.png'),
                      width: 24.w,
                      height: 24.h,
                    ),
                    SizedBox(width: 8),
                    // Country Code
                    Text(
                      "+62",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              // Phone Number Input Field
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    border: InputBorder.none,
                    hintText: "812 788 611 672",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// class DatePickerScreen extends StatefulWidget {
//   const DatePickerScreen({super.key});

//   @override
//   DatePickerScreenState createState() => DatePickerScreenState();
// }

// class DatePickerScreenState extends State<DatePickerScreen> {
//   final TextEditingController _dateController = TextEditingController();
//   DateTime? _selectedDate;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//          Text(
//                 "Male",
//                 style: StylesTextApp.textStyle16.copyWith(
//                   color: ColorApp.blue100,
//                 ),

//               ),
//         SizedBox(height: 8.h),

//         TextFormField(
//           controller: _dateController,
//           decoration: const InputDecoration(
//             suffixIcon: Icon(Icons.calendar_today_outlined),
//             border: OutlineInputBorder(),
//           ),
//           readOnly: true, // Prevent manual text entry
//           onTap: () async {
//             DateTime? pickedDate = await showDatePicker(
//               context: context,
//               initialDate: _selectedDate ?? DateTime.now(),
//               firstDate: DateTime(2000),
//               lastDate: DateTime(2100),
//             );

//             if (pickedDate != null) {
//               setState(() {
//                 _selectedDate = pickedDate;
//                 _dateController.text = DateFormat(
//                   'dd/MM/yyyy',
//                 ).format(pickedDate);
//               });
//             }
//           },
//         ),
//       ],
//     );
//   }
// }
