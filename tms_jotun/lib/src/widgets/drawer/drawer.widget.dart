import 'package:flutter/material.dart';
import 'package:tms_jotun/src/pages/about/about.view.dart';
import 'package:tms_jotun/src/pages/changePassword/changePassword.view.dart';
import 'package:tms_jotun/src/pages/deliveryHistory/deliveryHistory.view.dart';
import 'package:tms_jotun/src/pages/deliveryHistory/deliveryHistoryDetail.view.dart';
import 'package:tms_jotun/src/pages/home/home.view.dart';
import 'package:tms_jotun/src/pages/login/login.view.dart';
import 'package:tms_jotun/src/pages/setting/language.view.dart';
import 'package:tms_jotun/src/utils/appLocalizations.utils.dart';
import 'package:tms_jotun/src/utils/colorManager.utils.dart';
import 'package:tms_jotun/src/utils/fontManager.utils.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer( // Sidebar menu
    backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: 220,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: ColorManager.primary,
                ),
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          width: 1,
                          color: Colors.white
                        )
                      ),
                      child: Center(
                        child: Icon(
                          Icons.person,
                          size: 50,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "SG 33445",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ], 
                )
              ),
            ),
            CardAppbar(
              tittle: AppLocalizations.of(context)!.translate("HOME"),
              icon: Icons.home,
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
              },
            ),
            CardAppbar(
              tittle: AppLocalizations.of(context)!.translate("ABOUT"),
              icon: Icons.perm_device_information,
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutScreen()));
              },
            ), 
            CardAppbar(
              tittle: AppLocalizations.of(context)!.translate("TERMS_AND_CONDITIONS"),
              icon: Icons.edit_document,
              onTap: (){},
            ),
            CardAppbar(
              tittle: AppLocalizations.of(context)!.translate("SETTINGS"),
              icon: Icons.settings,
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LanguageSelectionScreen()));
              },
            ),
            CardAppbar(
              tittle: AppLocalizations.of(context)!.translate("CHANGE_PASSWORD"),
              icon: Icons.lock,
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePasswordScreen()));
              },
            ),
            CardAppbar(
              tittle: AppLocalizations.of(context)!.translate("Delivery History"),
              icon: Icons.history,
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DeliveryHistoryScreen()));
              },
            ),
            CardAppbar(
              tittle: AppLocalizations.of(context)!.translate("LOGOUT"),
              icon: Icons.exit_to_app,
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
              },
            ),
          ],
        ),
      );
  }
}


class CardAppbar extends StatelessWidget {
  final String tittle;
  final IconData icon;
  final GestureTapCallback onTap;
  const CardAppbar({
    required this.tittle,
    required this.icon,
    required this.onTap,
    super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 3),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
              Icon(
                icon,
                color: ColorManager.primary,
                size: 25,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                  tittle,
                  style: TextStyle(
                    color: ColorManager.primary,
                    fontSize: FontSize.sm.value,
                    fontWeight: FontWeight.w400,
                  ),
                ),  
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              thickness: .5,
            ),
          ],
        ),
      ),
    );
  }
}