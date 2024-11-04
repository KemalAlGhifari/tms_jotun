import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:tms_jotun/src/pages/deliveryHistory/deliveryHistoryDetail.view.dart';
import 'package:tms_jotun/src/utils/fontManager.utils.dart';
import 'package:tms_jotun/src/widgets/appbar/appbarDetail.widget.dart';
import 'package:tms_jotun/src/widgets/box/box.widget.dart';
import 'package:tms_jotun/src/widgets/input/calendarField.input.dart';
import 'package:tms_jotun/src/widgets/pageLayout.widget.dart';

class DeliveryHistoryScreen extends StatefulWidget {
  const DeliveryHistoryScreen({super.key});

  @override
  State<DeliveryHistoryScreen> createState() => _DeliveryHistoryScreenState();
}

class _DeliveryHistoryScreenState extends State<DeliveryHistoryScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTypeDetail(title: 'Delivery History',onBack: (){},),
      body: PageLayout(
        child: Expanded(
          child: Container(
            width: double.infinity,
            child: FormBuilder(
              key: _formKey,
              onChanged: () {
                _formKey.currentState!.save();
                debugPrint(
                    _formKey.currentState!.value.toString());
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  ContainerStandart(
                    minHeight: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: CalendarFieldInput(name: 'startDate',initialValue: DateTime.now(),)),
                  ),
                  Center(
                    child: Text(
                    'To',
                    style: TextStyle(
                        fontFamily: 'Lato',
                        color: Colors.black,
                        fontSize: FontSize.sm.value,
                        fontWeight: FontWeight.w400
                        ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ContainerStandart(
                    minHeight: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: CalendarFieldInput(name: 'endDate',initialValue: DateTime.now(),)),
                  ),
                  Text(
                  '23 Sep 2024',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontFamily: 'Lato',
                      color: Colors.black,
                      fontSize: FontSize.xl.value,
                      fontWeight: FontWeight.w500
                      ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DeliveryHistoryDetail()));
                    },
                    child: ContainerStandart(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Text(
                            'EQUIPE SERVICE & TECHNOLOGY PTE LTD : 29 MANDAI ESTATE, #03-08 PRESTIGIO 1',
                            style: TextStyle(
                                fontFamily: 'Lato',
                                color: Colors.black,
                                fontSize: FontSize.sm.value,
                                fontWeight: FontWeight.w600
                                ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Center(
                              child: Text(
                              'Dispact Date: 23 Sep 2024 20:20:23',
                              style: TextStyle(
                                  fontFamily: 'Lato',
                                  color: Colors.black,
                                  fontSize: FontSize.sm.value,
                                  fontWeight: FontWeight.w400
                                  ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                'Status : ',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    color: Colors.black,
                                    fontSize: FontSize.sm.value,
                                    fontWeight: FontWeight.w400
                                    ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                'Deliverd',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    color: Colors.green,
                                    fontSize: FontSize.sm.value,
                                    fontWeight: FontWeight.w400
                                    ),
                                ),
                              ],
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
      ),
    );
  }
}