import 'package:flutter/material.dart';
import 'package:tms_jotun/src/utils/colorManager.utils.dart';
import 'package:tms_jotun/src/utils/fontManager.utils.dart';
import 'package:tms_jotun/src/widgets/appbar/appbarDetail.widget.dart';
import 'package:tms_jotun/src/widgets/box/topTittleBox.widget.dart';
import 'package:tms_jotun/src/widgets/button/bottomButton.widget.dart';
import 'package:tms_jotun/src/widgets/emptyWidget.dart';
import 'package:tms_jotun/src/widgets/input/radioGroupField.input.dart';
import 'package:tms_jotun/src/widgets/pageLayout.widget.dart';

class TroubleScreen extends StatefulWidget {
  const TroubleScreen({super.key});

  @override
  State<TroubleScreen> createState() => _TroubleScreenState();
}

class _TroubleScreenState extends State<TroubleScreen> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      appBar: AppBarTypeDetail(title: 'Trouble',onBack: (){},),
      body: PageLayout(
        padding: 0,
        child: Expanded(
          child: Container(
            width: double.infinity,
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
                      'SELF COLLECT',
                      style: TextStyle(
                          fontFamily: 'Lato',
                          color: Colors.black,
                          fontSize: FontSize.sm.value,
                          fontWeight: FontWeight.w500
                          ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Select Obstacles',
                        style: TextStyle(
                            fontFamily: 'Lato',
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w600
                            ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Container(
                          width: 100,
                          height: 3,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      InputRadioGroupFieldCol(
                        value: 'speedState',
                        name: "speed",
                        label: "",
                        required: true,
                        options: const [
                          {"label": "Warehous is full", "value": "1"},
                          {"label": "Shop is Closed", "value": "2"},
                          {"label": "Customer cancel PO", "value": "3"}
                        ],
                        color: Colors.yellow  ,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: _isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                _isChecked = value ?? false;
                              });
                            },
                            fillColor: MaterialStateProperty.resolveWith((states) {
                              if (!states.contains(MaterialState.selected)) {
                                return null;
                              }
                              return Colors.blue;
                            }),
                            checkColor: Colors.white, // Warna tanda centang
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                          'Delivery Cancellation',
                          style: TextStyle(
                              fontFamily: 'Lato',
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                              ),
                          ),
                        ],
                      ),
                      _isChecked ?
                      InputRadioGroupFieldCol(
                        value: 'speedState',
                        name: "speed",
                        label: "",
                        required: true,
                        options: const [
                          {"label": "Cancel delivery to self COLLECT", "value": "2"},
                          {"label": "Cancel next delivey", "value": "3"}
                        ],
                        color: Colors.yellow,
                      ): EmptyWidget()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomButton(
        blueCondition: ValueNotifier(false),
        redCondition: ValueNotifier(true),
        titleBlue: 'SAVE',
        titleRed: "CANCEL",
        onTapBlue: (){},
        onTapRed: (){},
        ),
    );
  }
}