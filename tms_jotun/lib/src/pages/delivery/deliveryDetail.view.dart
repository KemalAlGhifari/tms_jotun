import 'package:flutter/material.dart';
import 'package:tms_jotun/src/app.dart';
import 'package:tms_jotun/src/pages/delivery/deliveryTotal.view.dart';
import 'package:tms_jotun/src/pages/delivery/editShipDetail.form.dart';
import 'package:tms_jotun/src/pages/delivery/trouble.view.dart';
import 'package:tms_jotun/src/utils/colorManager.utils.dart';
import 'package:tms_jotun/src/utils/fontManager.utils.dart';
import 'package:tms_jotun/src/utils/helpers.utils.dart';
import 'package:tms_jotun/src/widgets/appbar/appbar.widget.dart';
import 'package:tms_jotun/src/widgets/appbar/appbarDetail.widget.dart';
import 'package:tms_jotun/src/widgets/box/box.widget.dart';
import 'package:tms_jotun/src/widgets/box/topTittleBox.widget.dart';
import 'package:tms_jotun/src/widgets/pageLayout.widget.dart';

class DeliveryDetailScreen extends StatefulWidget {
  const DeliveryDetailScreen({super.key});

  @override
  State<DeliveryDetailScreen> createState() => _DeliveryDetailScreenState();
}

class _DeliveryDetailScreenState extends State<DeliveryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarTypeDetail(
          title: 'Delivery Detail',
          onBack: () {
            Navigator.pop(context);
          },
        ),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                TopTittle(
                  tittle: 'General Information',
                ),
                SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.all(16),
                    children: [
                      ContainerStandart(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Customer',
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    color: Colors.black,
                                    fontSize: FontSize.sm.value,
                                    fontWeight: FontWeight.w400),
                              ),
                              Divider(
                                thickness: 0.5,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Customer',
                                        style: TextStyle(
                                            fontFamily: 'Lato',
                                            color: Colors.black,
                                            fontSize: FontSize.sm.value,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.3,
                                        child: Text(
                                          'EQUIPE SERVICE & TECHNOLOGY PTE LTD',
                                          style: TextStyle(
                                              fontFamily: 'Lato',
                                              color: Colors.black,
                                              fontSize: FontSize.sm.value,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Customer Contact',
                                        style: TextStyle(
                                            fontFamily: 'Lato',
                                            color: Colors.black,
                                            fontSize: FontSize.sm.value,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: Colors.orangeAccent),
                                        child: Center(
                                          child: Icon(
                                            Icons.call,
                                            color: Colors.white,
                                            size: 25,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Delivery Address',
                                        style: TextStyle(
                                            fontFamily: 'Lato',
                                            color: Colors.black,
                                            fontSize: FontSize.sm.value,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.2,
                                        child: Text(
                                          '29 MANDAI ESTATE,#03-08 PRESTIGIO 1',
                                          style: TextStyle(
                                              fontFamily: 'Lato',
                                              color: Colors.black,
                                              fontSize: FontSize.sm.value,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Status',
                                        style: TextStyle(
                                            fontFamily: 'Lato',
                                            color: Colors.black,
                                            fontSize: FontSize.sm.value,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        'Arrive',
                                        style: TextStyle(
                                            fontFamily: 'Lato',
                                            color: Colors.yellow,
                                            fontSize: FontSize.sm.value,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 25,
                              ),
                            ],
                          ),
                        ),
                      ),
                      ContainerStandart(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Ship \nDetail',
                                    style: TextStyle(
                                        fontFamily: 'Lato',
                                        color: Colors.black,
                                        fontSize: FontSize.sm.value,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Spacer(),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EditShipDetailScreen()));
                                    },
                                    child: Container(
                                      color: Colors.grey[300],
                                      padding: EdgeInsets.all(1),
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.black,
                                        size: 23,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Divider(
                                thickness: 0.5,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Ship Code',
                                        style: TextStyle(
                                            fontFamily: 'Lato',
                                            color: Colors.black,
                                            fontSize: FontSize.sm.value,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.2,
                                        child: Text(
                                          '',
                                          style: TextStyle(
                                              fontFamily: 'Lato',
                                              color: Colors.black,
                                              fontSize: FontSize.sm.value,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Ship Name',
                                        style: TextStyle(
                                            fontFamily: 'Lato',
                                            color: Colors.black,
                                            fontSize: FontSize.sm.value,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        '',
                                        style: TextStyle(
                                            fontFamily: 'Lato',
                                            color: Colors.black,
                                            fontSize: FontSize.sm.value,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      ContainerStandart(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Location Details',
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    color: Colors.black,
                                    fontSize: FontSize.sm.value,
                                    fontWeight: FontWeight.w400),
                              ),
                              Divider(
                                thickness: 0.5,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Rute',
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    color: Colors.black,
                                    fontSize: FontSize.sm.value,
                                    fontWeight: FontWeight.w600),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 2.2,
                                child: Text(
                                  'North-72',
                                  style: TextStyle(
                                      fontFamily: 'Lato',
                                      color: Colors.black,
                                      fontSize: FontSize.sm.value,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Delivery Address',
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    color: Colors.black,
                                    fontSize: FontSize.sm.value,
                                    fontWeight: FontWeight.w600),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 2.2,
                                child: Text(
                                  '29 MANDAI ESTATE,#03-08 PRESTIGIO 1',
                                  style: TextStyle(
                                      fontFamily: 'Lato',
                                      color: Colors.black,
                                      fontSize: FontSize.sm.value,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 55,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TroubleScreen()));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: 55,
                          color: Colors.red,
                          child: Center(
                            child: Text(
                              'TROUBLE',
                              style: TextStyle(
                                  fontFamily: 'Lato',
                                  color: Colors.white,
                                  fontSize: FontSize.xs.value,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showModal(
                              context,
                              MediaQuery.of(context).size.width / 1.5,
                              true,
                              Padding(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Confirm',
                                      style: TextStyle(
                                          fontFamily: 'Lato',
                                          color: Colors.black,
                                          fontSize: FontSize.xl.value,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Are you sure already arrived and ready to unload, the action cannot be reverted',
                                      style: TextStyle(
                                          fontFamily: 'Lato',
                                          color: Colors.grey  ,
                                          fontSize: FontSize.sm.value,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          'NO',
                                          style: TextStyle(
                                              fontFamily: 'Lato',
                                              color: Colors.blue,
                                              fontSize: FontSize.sm.value,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        InkWell(
                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>DeliveryTotalScreen()));
                                          },
                                          child: Text(
                                            'YES',
                                            style: TextStyle(
                                                fontFamily: 'Lato',
                                                color: Colors.blue,
                                                fontSize: FontSize.sm.value,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ));
                           
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: 55,
                          color: ColorManager.primary,
                          child: Center(
                            child: Text(
                              'ARRIVE',
                              style: TextStyle(
                                  fontFamily: 'Lato',
                                  color: Colors.white,
                                  fontSize: FontSize.xs.value,
                                  fontWeight: FontWeight.w500),
                            ),
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
    );
  }
}
