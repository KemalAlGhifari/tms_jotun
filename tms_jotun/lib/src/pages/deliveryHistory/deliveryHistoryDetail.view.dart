import 'package:flutter/material.dart';
import 'package:tms_jotun/src/utils/colorManager.utils.dart';
import 'package:tms_jotun/src/utils/fontManager.utils.dart';
import 'package:tms_jotun/src/widgets/appbar/appbarDetail.widget.dart';
import 'package:tms_jotun/src/widgets/box/box.widget.dart';
import 'package:tms_jotun/src/widgets/box/topTittleBox.widget.dart';
import 'package:tms_jotun/src/widgets/pageLayout.widget.dart';

class DeliveryHistoryDetail extends StatefulWidget {
  const DeliveryHistoryDetail({super.key});

  @override
  State<DeliveryHistoryDetail> createState() => _DeliveryHistoryDetailState();
}

class _DeliveryHistoryDetailState extends State<DeliveryHistoryDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTypeDetail(title: "Delivery Total", onBack: (){},),
      body: PageLayout(
        padding: 0,
        child: Expanded(
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                TopTittle(tittle: 'General Information'),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ContainerStandart(
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                              'Customer',
                              style: TextStyle(
                                  fontFamily: 'Lato',
                                  color: Colors.black,
                                  fontSize: FontSize.sm.value,
                                  fontWeight: FontWeight.w600
                                  ),
                              ),
                              
                              Text(
                              'EQUIPE SERVICE & TECHNOLOGY PTE LTD',
                              style: TextStyle(
                                  fontFamily: 'Lato',
                                  color: Colors.black,
                                  fontSize: FontSize.sm.value,
                                  fontWeight: FontWeight.w400
                                  ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Text(
                              'Delivery Address',
                              style: TextStyle(
                                  fontFamily: 'Lato',
                                  color: Colors.black,
                                  fontSize: FontSize.sm.value,
                                  fontWeight: FontWeight.w600
                                  ),
                              ),
                              Text(
                              '29 MANDAI ESTATE,#03-08 PRESTIGIO 1',
                              style: TextStyle(
                                  fontFamily: 'Lato',
                                  color: Colors.black,
                                  fontSize: FontSize.sm.value,
                                  fontWeight: FontWeight.w400
                                  ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                      'Customer Contact',
                                      style: TextStyle(
                                          fontFamily: 'Lato',
                                          color: Colors.black,
                                          fontSize: FontSize.sm.value,
                                          fontWeight: FontWeight.w600
                                          ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Colors.orangeAccent
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.call,
                                            color: Colors.white,
                                            size: 25,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 55,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                      'Status',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          fontFamily: 'Lato',
                                          color: Colors.green,
                                          fontSize: FontSize.sm.value,
                                          fontWeight: FontWeight.w600
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
                                          color: Colors.black,
                                          fontSize: FontSize.sm.value,
                                          fontWeight: FontWeight.w600
                                          ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
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
          
        },
        child: Container(
          width: double.infinity,
          height: 55,
          color: ColorManager.primary,
          child: Center(
            child: Text(
              'NEXT',
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