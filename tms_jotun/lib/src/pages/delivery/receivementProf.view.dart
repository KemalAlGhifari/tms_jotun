import 'package:flutter/material.dart';
import 'package:tms_jotun/src/pages/home/home.view.dart';
import 'package:tms_jotun/src/utils/appLocalizations.utils.dart';
import 'package:tms_jotun/src/utils/colorManager.utils.dart';
import 'package:tms_jotun/src/utils/fontManager.utils.dart';
import 'package:tms_jotun/src/widgets/appbar/appbarDetail.widget.dart';
import 'package:tms_jotun/src/widgets/box/topTittleBox.widget.dart';
import 'package:tms_jotun/src/widgets/pageLayout.widget.dart';

class ReceivementProfScreen extends StatefulWidget {
  const ReceivementProfScreen({super.key});

  @override
  State<ReceivementProfScreen> createState() => _ReceivementProfScreenState();
}

class _ReceivementProfScreenState extends State<ReceivementProfScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTypeDetail(
        title: 'Receivement Proft',
        onBack: (){

        },
      ),
      body: PageLayout(
        padding: 0,
        child: Expanded(
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), 
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 2), 
                      ),
                    ]
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                      'Project : THE ESTA : 33 AMBER GRADES (SMALL LORRY), PIC : EMON 989892183',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Lato',
                        color: Colors.black,
                        fontSize: FontSize.normal.value,
                        fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Container(
                  width: double.infinity,
                  height: 20,
                  color: Color(0xfff1f1f1),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal:  30,vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.translate('NAMA_PEN'),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[700],
                        ),
                      ),
                      TextField(                            
                        decoration: InputDecoration(
                          hintText: 'Enter ${AppLocalizations.of(context)!.translate('NAMA_PEN')}....',
                          hintStyle:TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[700],
                          ),
                          contentPadding: EdgeInsets.only(left: 15),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 2),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 2),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        AppLocalizations.of(context)!.translate('IC_NO'),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[700],
                        ),
                      ),
                      TextField(                            
                        decoration: InputDecoration(
                          hintText: 'Enter ${AppLocalizations.of(context)!.translate('IC_NO')}....',
                          hintStyle:TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[700],
                          ),
                          contentPadding: EdgeInsets.only(left: 15),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 2),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 2),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
        },
        child: Container(
          width: double.infinity,
          height: 55,
          color: ColorManager.primary,
          child: Center(
            child: Text(
              AppLocalizations.of(context)!.translate('SUBMIT'),
              style: TextStyle(
                fontFamily: 'Lato',
                color: Colors.white,
                fontSize: FontSize.xs.value,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),   
    );
  }
}