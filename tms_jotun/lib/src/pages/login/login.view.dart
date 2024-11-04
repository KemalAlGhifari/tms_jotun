import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:tms_jotun/src/pages/home/home.view.dart';
import 'package:tms_jotun/src/utils/colorManager.utils.dart';
import 'package:tms_jotun/src/utils/fontManager.utils.dart';
import 'package:tms_jotun/src/widgets/input/passwordField.input.dart';
import 'package:tms_jotun/src/widgets/input/textField.input.dart';
import 'package:tms_jotun/src/widgets/pageLayout.widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
final _formKey = GlobalKey<FormBuilderState>();
bool _isPrivacyChecked = false;
bool _isRemberChecked = false;
bool _isValidLogin = false;

String? passwordError = '';
String? usernameError = '';
  void _validatePassword(String? value) {
    setState(() {
      if (value == null || value.isEmpty) {
        passwordError = 'Password tidak boleh kosong';
      } else {
        passwordError = null; // Reset jika valid
      }
    checkLogin();
    });
  }

  void _validateUsername(String? value) {
    setState(() {
      if (value == null || value.isEmpty) {
        usernameError = 'Username tidak boleh kosong';
      } else {
        usernameError = null; // Reset jika valid
      }
    checkLogin();
    });
  }

void checkLogin(){
  _formKey.currentState?.save();
  String? username = _formKey.currentState?.fields['username']?.value;
  String? password = _formKey.currentState?.fields['password']?.value;
    if (_isPrivacyChecked && password != null && password.isNotEmpty && username != null && username.isNotEmpty) {
    setState(() {
      _isValidLogin = true;
    });
  } else {
    setState(() {
      _isValidLogin = false;
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.primary,
        body: PageLayout(
            child: Expanded(
                child: Container(
                    padding:const EdgeInsets.all(16),
                    width: double.infinity,
                    child: Column(
                        children: [
                            const SizedBox(
                                height: 36,
                            ),
                            FormBuilder(
                                key: _formKey,
                                onChanged: () {
                                _formKey.currentState!.save();
                                debugPrint(
                                    _formKey.currentState!.value.toString());
                                },
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        InputTextField(name: 'username', placeholder: 'Username',onChanged: _validateUsername,),
                                        const SizedBox(
                                            height: 16,
                                        ),
                                        InputPasswordField(name: 'password', placeholder: "password",onChanged: _validatePassword,),
                                        Text(
                                            passwordError ?? '',
                                            style: const TextStyle(
                                            color: Colors.red,
                                            fontSize: 14,
                                            ),
                                        ),
                                        const SizedBox(
                                            height: 16,
                                        ),
                                        Row(
                                            children: [
                                                GestureDetector(
                                                    onTap: () {
                                                    setState(() {
                                                        _isRemberChecked = !_isRemberChecked;
                                                    });
                                                    },
                                                    child: Container(
                                                    margin: const EdgeInsets.all(10),
                                                      child: AnimatedContainer(
                                                      duration: const Duration(milliseconds: 300),
                                                      curve: Curves.easeInOut,
                                                      width: 15,
                                                      height: 15,
                                                      decoration: BoxDecoration(
                                                          color: _isRemberChecked
                                                              ? Colors.orangeAccent
                                                              : Colors.white,
                                                          borderRadius: BorderRadius.circular(1),
                                                          border: _isRemberChecked
                                                              ? null
                                                              : Border.all(width: 1.5,color: const Color(0xff717377))
                                                      ),
                                                      child: _isRemberChecked
                                                          ? const Icon(Icons.check, size: 15, color: Colors.white)
                                                          : null,
                                                      ),
                                                    ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                  'Remember me',
                                                  style: TextStyle(
                                                      fontFamily: 'Lato',
                                                      color: Colors.white,
                                                      fontSize: FontSize.sm.value,
                                                      fontWeight: FontWeight.w400
                                                      ),
                                                  ),
                                              ),
                                            ],
                                        ),
                                        Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                                GestureDetector(
                                                    onTap: () {
                                                    setState(() {
                                                        _isPrivacyChecked = !_isPrivacyChecked;
                                                        
                                                    });
                                                    checkLogin();
                                                    },
                                                    child: Container(
                                                    margin: const EdgeInsets.all(10),
                                                      child: AnimatedContainer(
                                                      duration: const Duration(milliseconds: 300),
                                                      curve: Curves.easeInOut,
                                                      width: 15,
                                                      height: 15,
                                                      decoration: BoxDecoration(
                                                          color: _isPrivacyChecked
                                                              ? Colors.orangeAccent
                                                              : Colors.white,
                                                          borderRadius: BorderRadius.circular(1),
                                                          border: _isPrivacyChecked
                                                              ? null
                                                              : Border.all(width: 1.5,color: const Color(0xff717377))
                                                      ),
                                                      child: _isPrivacyChecked
                                                          ? const Icon(Icons.check, size: 15, color: Colors.white)
                                                          : null,
                                                      ),
                                                    ),
                                                ),
                                               
                                                 Expanded(
                                                    child: Expanded(
                                                        child: RichText(
                                                            text: const TextSpan(
                                                            style: TextStyle(
                                                                fontFamily: 'Lato',
                                                                color: Colors.white,
                                                                fontSize: 13,
                                                                fontWeight: FontWeight.w400
                                                                ),
                                                            children: [
                                                                TextSpan(text: 'I agree with what jotun has set related '),
                                                                TextSpan(
                                                                text: 'Privacy Policy',
                                                                style: TextStyle(
                                                                    fontFamily: 'Lato',
                                                                    color: Colors.blue,
                                                                    fontSize: 13,
                                                                    fontWeight: FontWeight.w400
                                                                    ),
                                                                ),
                                                            ],
                                                            ),
                                                        ),
                                                        ),

                                                ),
                                            ],
                                        ),
                                    ],
                                ),
                            ),
                            const SizedBox(
                                height: 16,
                            ),
                            InkWell(
                                onTap: (){
                                    if(_isValidLogin){
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                                    }
                                },
                              child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2,
                                          color: _isValidLogin ? Colors.white : Color(0xff637CB1)
                                      )
                                  ),
                                  width: double.infinity,
                                  height: 45,
                                  child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                          Text(
                                          'LOGIN',
                                          style: TextStyle(
                                              fontFamily: 'Lato',
                                              color: _isValidLogin ? Colors.white : Color(0xff637CB1),
                                              fontSize: FontSize.sm.value,
                                              fontWeight: FontWeight.w500
                                              ),
                                          ),
                                          const SizedBox(
                                              width: 5,
                                          ),
                                           Icon(
                                              Icons.exit_to_app_outlined,
                                              size: 17,
                                              color: _isValidLogin ? Colors.white : Color(0xff637CB1),
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