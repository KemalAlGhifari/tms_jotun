import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tms_jotun/src/pages/login/login.view.dart';
import 'package:tms_jotun/src/utils/colorManager.utils.dart';
import 'package:tms_jotun/src/utils/fontManager.utils.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      
      globalBackgroundColor: ColorManager.primary,
      dotsDecorator: DotsDecorator(
        color: Colors.grey, 
        activeColor: Colors.white,
        size: Size(20.0, 2.0), 
        activeSize: Size(20.0, 2.0),
        
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.0),
        ),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.0),
        ),
      ),
      pages: 
      [
       PageViewModel(
          title: "",
          bodyWidget: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column( 
                mainAxisAlignment: MainAxisAlignment.center, 
                children: <Widget>[
                  Image.asset(
                    'assets/imgs/illustration-task.png',
                    width: MediaQuery.of(context).size.width / 1.5,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Check Delivery Assignments',
                      style: TextStyle(
                      fontFamily: 'Lato',
                      color: Colors.white,
                      fontSize: FontSize.xl.value,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('View and process your order delivery assigments so that nothing is missed',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                      fontFamily: 'Lato',
                      color: Colors.white,
                      fontSize: FontSize.sm.value,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          decoration: const PageDecoration( 
          bodyAlignment: Alignment.center,
          ),
        ),
        PageViewModel(
          title: "",
          bodyWidget: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column( 
                mainAxisAlignment: MainAxisAlignment.center, 
                children: <Widget>[
                  Image.asset(
                    'assets/imgs/illustration-car.png',
                    width: MediaQuery.of(context).size.width / 1.5,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Start Delivery Execution',
                      style: TextStyle(
                      fontFamily: 'Lato',
                      color: Colors.white,
                      fontSize: FontSize.xl.value,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Deliver customer's orders carefully and obey trafic signs to arrive safely",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                      fontFamily: 'Lato',
                      color: Colors.white,
                      fontSize: FontSize.sm.value,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          decoration: const PageDecoration( 
          bodyPadding: EdgeInsets.zero,
          contentMargin: EdgeInsets.zero,
          imagePadding: EdgeInsets.zero,
          bodyAlignment: Alignment.center,
          ),
        ),
        PageViewModel(
          title: "",
          bodyWidget: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column( 
                mainAxisAlignment: MainAxisAlignment.center, 
                children: <Widget>[
                  Image.asset(
                    'assets/imgs/illustration-arrive.png',
                    width: MediaQuery.of(context).size.width / 1.5,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Arrive at Destination',
                      style: TextStyle(
                      fontFamily: 'Lato',
                      color: Colors.white,
                      fontSize: FontSize.xl.value,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Unload the customer's order from the truck and take a photo as proof of delivery then upload it on the application",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                      fontFamily: 'Lato',
                      color: Colors.white,
                      fontSize: FontSize.sm.value,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          decoration: const PageDecoration( 
          bodyAlignment: Alignment.center,
          ),
        ),
      ],
      onDone: () async {
        final prefs = await SharedPreferences.getInstance();
        prefs.setBool('onboarding',false);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
      },
      showSkipButton: true,
      skip: Text(
        'Skip',
        style: TextStyle(
            fontFamily: 'Lato',
            color: Colors.white,
            fontSize: FontSize.sm.value,
            fontWeight: FontWeight.w400,
          ),
        ),
      next: Container(
        width: 70,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(5)
        ),
        child: Center(
          child: Text(
          'Next',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Lato',
              color: Colors.white,
              fontSize: FontSize.sm.value,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      done: Container(
        width: 100,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(5)
        ),
        child: Center(
          child: Text(
          "Les't Work!",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Lato',
              color: Colors.white,
              fontSize: FontSize.sm.value,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ), 

    );

  }
}