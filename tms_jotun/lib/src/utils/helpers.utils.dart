  import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tms_jotun/src/models/response/login.response.dart';
import 'package:tms_jotun/src/utils/appLocalizations.utils.dart';
import 'package:tms_jotun/src/utils/fontManager.utils.dart';

import '../blocs/bloc/user_bloc.dart';

Future<void>showModal(BuildContext context,double width,bool back, Widget child )async {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            InkWell(
              onTap: (){
                if(back){
                  Navigator.pop(context);
                }
              },
              child: Container(
                color: Colors.transparent,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: double.infinity
                ),
                
                width: width,
                color: Colors.white,
                child: child
              ),
            ),
          ],
        ),
      );
    },
  );
}


Future<void>ShowLoading(BuildContext context) async{
  showModal(context,
    MediaQuery.of(context).size.width / 2.5, 
    false,
      Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25,
                  width: 25,
                  child: CircularProgressIndicator(
                    strokeWidth: 1.0, // Mengatur ketebalan lebih tipis
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue), // Mengatur warna menjadi biru
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                'Please wait',
                style: TextStyle(
                  fontFamily: 'Lato',
                  color: Colors.grey,
                  fontSize: FontSize.sm.value,
                  fontWeight: FontWeight.w500
                  ),
                ),
              ],
            )
          ],
        ),
      )
    );
}

Future<void>ShowError(BuildContext context,String tittle, String text) async{
  showModal(context,
    MediaQuery.of(context).size.width / 1.5, 
    true,
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            color: Colors.grey[200],
            padding: EdgeInsets.all(16),
            child: Text(
            tittle,
            style: TextStyle(
                fontFamily: 'Lato',
                color: Colors.red,
                fontSize: FontSize.xl.value,
                fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontFamily: 'Lato',
                    color: Colors.grey,
                    fontSize: FontSize.sm.value,
                    fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Text(
                      AppLocalizations.of(context)!.translate('OK'),
                      style: TextStyle(
                        fontFamily: 'Lato',
                        color: Colors.red,
                        fontSize: FontSize.sm.value,
                        fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      )
    );
}


Future<void> clearLoginData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('login_data');
    await prefs.remove('remember');
  }

  Future<void> loadUserFromPreferences(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    String? loginData = prefs.getString('login_data');
    final userBloc = BlocProvider.of<UserBloc>(context);
    if (loginData != null) {
      // Deserialize JSON data to Login object
      Map<String, dynamic> jsonData = jsonDecode(loginData);
      Login userLogin = Login.fromJson(jsonData);
      userBloc.add(UpdateUser(userLogin));

    }
  }


