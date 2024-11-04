import 'package:flutter/material.dart';
import 'package:tms_jotun/src/utils/colorManager.utils.dart';
import 'package:tms_jotun/src/utils/fontManager.utils.dart';
import 'package:tms_jotun/src/widgets/appbar/appbarDetail.widget.dart';
import 'package:tms_jotun/src/widgets/box/box.widget.dart';
import 'package:tms_jotun/src/widgets/button/button.widget.dart';
import 'package:tms_jotun/src/widgets/input/textField.input.dart';

class EditShipDetailScreen extends StatefulWidget {
  const EditShipDetailScreen({super.key});

  @override
  State<EditShipDetailScreen> createState() => EditShipDetailScreenState();
}

class EditShipDetailScreenState extends State<EditShipDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTypeDetail(
        title: "General Information",
        onBack: (){
          Navigator.pop(context);
        },
        ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 50,
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                    'General Information',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      color: Colors.black,
                      fontSize: FontSize.normal.value,
                      fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Container(
                      width: 100,
                      height: 3,
                      color: ColorManager.primary,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ContainerStandart(
                margin: EdgeInsets.symmetric(
                  horizontal: 15
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                      'Ship Details',
                      style: TextStyle(
                          fontFamily: 'Lato',
                          color: Colors.black,
                          fontSize: FontSize.sm.value,
                          fontWeight: FontWeight.w600
                          ),
                      ),
                      Divider(
                        thickness: 0.5,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                      'Kode Kapal',
                      style: TextStyle(
                          fontFamily: 'Lato',
                          color: Colors.black,
                          fontSize: FontSize.sm.value,
                          fontWeight: FontWeight.w400
                          ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ContainerStandart(
                        minHeight: 20,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: TextField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green), // Garis bawah saat tidak fokus
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue, width: 2), // Garis bawah saat fokus
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                      'Nama Kapal',
                      style: TextStyle(
                          fontFamily: 'Lato',
                          color: Colors.black,
                          fontSize: FontSize.sm.value,
                          fontWeight: FontWeight.w400
                          ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ContainerStandart(
                        minHeight: 2, 
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: TextField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 0),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green),
                                
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue, width: 2), // Garis bawah saat fokus
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 70,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blue
                        ),
                        child: Center(
                          child: Text(
                          'SAVE',
                          style: TextStyle(
                              fontFamily: 'Lato',
                              color:Colors.white,
                              fontSize: FontSize.sm.value,
                              fontWeight: FontWeight.w500
                              ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}