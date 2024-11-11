import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:tms_jotun/src/api/apiClientToken.dart';
import 'package:tms_jotun/src/api/userService.dart';
import 'package:tms_jotun/src/models/response/error.response.dart';
import 'package:tms_jotun/src/models/response/login.response.dart';
import 'package:tms_jotun/src/pages/login/login.view.dart';
import 'package:tms_jotun/src/utils/appLocalizations.utils.dart';
import 'package:tms_jotun/src/utils/colorManager.utils.dart';
import 'package:tms_jotun/src/utils/fontManager.utils.dart';
import 'package:tms_jotun/src/utils/helpers.utils.dart';
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
  final _formKey = GlobalKey<FormBuilderState>();
  late UserService _userService ;
  @override
  void initState() {
    
    super.initState();
    initApiClient;
  }

  Future<void>initApiClient()async{
    ApiClientToken apiClientToken = await ApiClientToken.create();
    _userService = UserService(apiClientToken.dio);
  }

  Future<void>changePassword()async{
    ApiClientToken apiClientToken = await ApiClientToken.create();
    _userService = UserService(apiClientToken.dio);
    String? old = _formKey.currentState?.fields['old']?.value;
    String? newpass = _formKey.currentState?.fields['new']?.value;
    String? confirm = _formKey.currentState?.fields['confirm']?.value;

    Map<String, dynamic> data = {
      "oldPassword": old,
      "newPassword": newpass
    };

    if(newpass == confirm){
      try {
        final response = await _userService.changePassword(data);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
      } catch (e) {
        if(e is DioException){
          print(e.response!.data);
          // ErrorLog error = ErrorLog.fromJson(e.response!.data);
          // ShowError(context, 'Login Failed', AppLocalizations.of(context)!.translate(error.errorDetails.first.code.toString()));
        }
      }
      
    }else{
      ShowError(context, 'Error', "password tidak cocok");
    }
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBarTypeDetail(title: AppLocalizations.of(context)!.translate('CHANGE_PASSWORD'),onBack: (){},),
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
                AppLocalizations.of(context)!.translate('CHANGE_PASSWORD'),
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
                AppLocalizations.of(context)!.translate('CHG_PAR'),
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
                  child: FormBuilder(
                    key: _formKey,
                    onChanged: () {
                    _formKey.currentState!.save();
                    },
                    child: Column(
                      children: [
                        ChangePasswordInputField(name: "old", placeholder: AppLocalizations.of(context)!.translate('old_pass')),
                        ChangePasswordInputField(name: "new", placeholder: AppLocalizations.of(context)!.translate('new_pass')),
                        ChangePasswordInputField(name: "confirm", placeholder: AppLocalizations.of(context)!.translate('CONFIRM_PASSWORD')),
                      ],
                    ),
                  )
                ),
                SizedBox(
                  height: 25,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: (){
                      changePassword();
                    },
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
                          AppLocalizations.of(context)!.translate('SUBMIT'),
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