import 'package:flutter/material.dart';
import 'package:tms_jotun/src/utils/colorManager.utils.dart';
import 'package:tms_jotun/src/utils/fontManager.utils.dart';
import 'package:tms_jotun/src/widgets/appbar/appbarDetail.widget.dart';
import 'package:tms_jotun/src/widgets/input/fieldChangePassword.input.dart';
import 'package:tms_jotun/src/widgets/input/passwordField.input.dart';
import 'package:tms_jotun/src/widgets/pageLayout.widget.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBarTypeDetail(title: 'Change Password',onBack: (){},),
      body: PageLayout(
        child: Expanded(
          child: Container(
            width: double.maxFinite,
            child: Column(
              children: [
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: Colors.white, width: 1)
                  ),
                  child: Center(
                    child: Icon(Icons.person, color: Colors.grey,size: 80,),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                'SG.1 tonne001',
                style: TextStyle(
                  fontFamily: 'Lato',
                  color: Colors.white,
                  fontSize: FontSize.normal.value,
                  fontWeight: FontWeight.w400
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                'Change Your Password',
                style: TextStyle(
                  fontFamily: 'Lato',
                  color: Colors.white,
                  fontSize: FontSize.xl.value,
                  fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                'Please enter your old and new password below to change password',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Lato',
                  color: Colors.white,
                  fontSize: FontSize.sm.value,
                  fontWeight: FontWeight.w400
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  padding: EdgeInsets.only(left: 15),
                  child: Column(
                    children: [
                      ChangePasswordInputField(name: "old", placeholder: "Old Password"),
                      ChangePasswordInputField(name: "new", placeholder: "New Password"),
                      ChangePasswordInputField(name: "confirm", placeholder: "Confirm Password"),
                    ],
                  )
                ),
                SizedBox(
                  height: 25,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 100,
                    padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.grey,width: .5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                        'SUBMIT',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          color: Colors.grey,
                          fontSize: FontSize.sm.value,
                          fontWeight: FontWeight.w500
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.grey,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}