import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tms_jotun/src/pages/home/home.view.dart';
import 'package:tms_jotun/src/pages/login/login.view.dart';
import 'package:tms_jotun/src/utils/colorManager.utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setToNext();

  }

  Future<void>setToNext()async{
        WidgetsFlutterBinding.ensureInitialized();
        final prefs = await SharedPreferences.getInstance();
        final isRemembered = prefs.getBool('remember') ?? false;
        final isOnboarding = prefs.getBool('onboarding') ?? true;
        Future.delayed(Duration(seconds: 1),(){
          if(isOnboarding){
            
          }else{
            if(isRemembered){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen(isFirstView: true,)));
            }else{
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
            }
          }
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
        child: Image.asset('assets/imgs/illustration-car.png',width: MediaQuery.of(context).size.width / 1.5,)
      ),
    );
  }
}