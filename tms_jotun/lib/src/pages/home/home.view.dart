import 'package:flutter/material.dart';
import 'package:tms_jotun/src/pages/delivery/deliveryDetail.view.dart';
import 'package:tms_jotun/src/utils/colorManager.utils.dart';
import 'package:tms_jotun/src/utils/fontManager.utils.dart';
import 'package:tms_jotun/src/utils/helpers.utils.dart';
import 'package:tms_jotun/src/widgets/appbar/appbar.widget.dart';
import 'package:tms_jotun/src/widgets/box/box.widget.dart';
import 'package:tms_jotun/src/widgets/drawer/drawer.widget.dart';
import 'package:tms_jotun/src/widgets/input/inputBasic.dart';
import 'package:tms_jotun/src/widgets/pageLayout.widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }




  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTypeHome(
        title: 'Pengiriman',
          actions: [
            IconButton(
            icon: Icon(Icons.lock_sharp, color: Colors.white), 
            onPressed: (){
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
                      'Check Passcode',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        color: Colors.black,
                        fontSize: FontSize.xl.value,
                        fontWeight: FontWeight.w500
                        ),
                      ),
                      Text(
                      'Security checks after cheking',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        color: Colors.red,
                        fontSize: FontSize.normal.value,
                        fontWeight: FontWeight.w400
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      InputTextBasic(name: "passcode", placeholder: 'Passcode'),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Text(
                            'CANCEL',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              color: Colors.blue,
                              fontSize: FontSize.sm.value,
                              fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                          'OK',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            color: Colors.blue,
                            fontSize: FontSize.sm.value,
                            fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              );
            }
          ),
          IconButton(
            icon: Icon(Icons.call, color: Colors.white), // Pengaturan icon
            onPressed: () {
              // Aksi untuk settings
              print('Settings Icon Tapped');
            },
          ),
        ],
        ),
      drawer: DrawerWidget(),
      body: PageLayout(
        onRefresh: ()async{
          ShowLoading(context);
        },
        child: Expanded(
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DeliveryDetailScreen()));
                  },
                  child: ContainerStandart(
                    child: 
                    Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 10,left: 10),
                                    child: Text(
                                    'EQUIPE SERVICE & TECHNOLOGY PTE LTD : 29 MANDAI ESTATE, #03-08 PRESTIGIO 1',
                                    style: TextStyle(
                                        fontFamily: 'Lato',
                                        color: Colors.black,
                                        fontSize: FontSize.sm.value,
                                        fontWeight: FontWeight.w600
                                        ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(50),
                                    )
                                  ),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Icon(
                                    Icons.location_on,
                                    color: Colors.black,
                                    size: 20,
                                    )
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10
                              ),
                              child: Row(
                                children: [
                                  Text(
                                  'Status :',
                                  style: TextStyle(
                                      fontFamily: 'Lato',
                                      color: Colors.black,
                                      fontSize: FontSize.sm.value,
                                      fontWeight: FontWeight.w400
                                      ),
                                  ),
                                  Spacer(),
                                  Text(
                                  'Arrive',
                                  style: TextStyle(
                                      fontFamily: 'Lato',
                                      color: Colors.yellow,
                                      fontSize: FontSize.sm.value,
                                      fontWeight: FontWeight.w400
                                      ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                    
                        ),
                      
                    ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DeliveryDetailScreen()));
                  },
                  child: ContainerStandart(
                    child: 
                    Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 10,left: 10),
                                    child: Text(
                                    'EQUIPE SERVICE & TECHNOLOGY PTE LTD : 29 MANDAI ESTATE, #03-08 PRESTIGIO 1',
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      color: Colors.black,
                                      fontSize: FontSize.sm.value,
                                      fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(50),
                                    )
                                  ),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Icon(
                                    Icons.location_on,
                                    color: Colors.black,
                                    size: 20,
                                    )
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10
                              ),
                              child: Row(
                                children: [
                                  Text(
                                  'Status :',
                                  style: TextStyle(
                                      fontFamily: 'Lato',
                                      color: Colors.black,
                                      fontSize: FontSize.sm.value,
                                      fontWeight: FontWeight.w400
                                      ),
                                  ),
                                  Spacer(),
                                  Text(
                                  'Arrive',
                                  style: TextStyle(
                                      fontFamily: 'Lato',
                                      color: Colors.yellow,
                                      fontSize: FontSize.sm.value,
                                      fontWeight: FontWeight.w400
                                      ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                    
                        ),
                      
                    ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DeliveryDetailScreen()));
                  },
                  child: ContainerStandart(
                    child: 
                    Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 10,left: 10),
                                    child: Text(
                                    'EQUIPE SERVICE & TECHNOLOGY PTE LTD : 29 MANDAI ESTATE, #03-08 PRESTIGIO 1',
                                    style: TextStyle(
                                        fontFamily: 'Lato',
                                        color: Colors.black,
                                        fontSize: FontSize.sm.value,
                                        fontWeight: FontWeight.w600
                                        ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(50),
                                    )
                                  ),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Icon(
                                    Icons.location_on,
                                    color: Colors.black,
                                    size: 20,
                                    )
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10
                              ),
                              child: Row(
                                children: [
                                  Text(
                                  'Status :',
                                  style: TextStyle(
                                      fontFamily: 'Lato',
                                      color: Colors.black,
                                      fontSize: FontSize.sm.value,
                                      fontWeight: FontWeight.w400
                                      ),
                                  ),
                                  Spacer(),
                                  Text(
                                  'Arrive',
                                  style: TextStyle(
                                      fontFamily: 'Lato',
                                      color: Colors.yellow,
                                      fontSize: FontSize.sm.value,
                                      fontWeight: FontWeight.w400
                                      ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                    
                        ),
                      
                    ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DeliveryDetailScreen()));
                  },
                  child: ContainerStandart(
                    child: 
                    Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 10,left: 10),
                                  child: Text(
                                  'EQUIPE SERVICE & TECHNOLOGY PTE LTD : 29 MANDAI ESTATE, #03-08 PRESTIGIO 1',
                                  style: TextStyle(
                                      fontFamily: 'Lato',
                                      color: Colors.black,
                                      fontSize: FontSize.sm.value,
                                      fontWeight: FontWeight.w600
                                      ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(50),
                                  )
                                ),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Icon(
                                  Icons.location_on,
                                  color: Colors.black,
                                  size: 20,
                                  )
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10
                            ),
                            child: Row(
                              children: [
                                Text(
                                'Status :',
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    color: Colors.black,
                                    fontSize: FontSize.sm.value,
                                    fontWeight: FontWeight.w400
                                    ),
                                ),
                                Spacer(),
                                Text(
                                'Arrive',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  color: Colors.yellow,
                                  fontSize: FontSize.sm.value,
                                  fontWeight: FontWeight.w400
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                   
                      ),
                      
                    ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DeliveryDetailScreen()));
                  },
                  child: ContainerStandart(
                    child: 
                    Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 10,left: 10),
                                    child: Text(
                                    'EQUIPE SERVICE & TECHNOLOGY PTE LTD : 29 MANDAI ESTATE, #03-08 PRESTIGIO 1',
                                    style: TextStyle(
                                        fontFamily: 'Lato',
                                        color: Colors.black,
                                        fontSize: FontSize.sm.value,
                                        fontWeight: FontWeight.w600
                                        ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(50),
                                    )
                                  ),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Icon(
                                    Icons.location_on,
                                    color: Colors.black,
                                    size: 20,
                                    )
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10
                              ),
                              child: Row(
                                children: [
                                  Text(
                                  'Status :',
                                  style: TextStyle(
                                      fontFamily: 'Lato',
                                      color: Colors.black,
                                      fontSize: FontSize.sm.value,
                                      fontWeight: FontWeight.w400
                                      ),
                                  ),
                                  Spacer(),
                                  Text(
                                  'Arrive',
                                  style: TextStyle(
                                      fontFamily: 'Lato',
                                      color: Colors.yellow,
                                      fontSize: FontSize.sm.value,
                                      fontWeight: FontWeight.w400
                                      ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                    
                        ),
                      
                    ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DeliveryDetailScreen()));
                  },
                  child: ContainerStandart(
                    child: 
                    Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 10,left: 10),
                                    child: Text(
                                    'EQUIPE SERVICE & TECHNOLOGY PTE LTD : 29 MANDAI ESTATE, #03-08 PRESTIGIO 1',
                                    style: TextStyle(
                                        fontFamily: 'Lato',
                                        color: Colors.black,
                                        fontSize: FontSize.sm.value,
                                        fontWeight: FontWeight.w600
                                        ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(50),
                                    )
                                  ),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Icon(
                                    Icons.location_on,
                                    color: Colors.black,
                                    size: 20,
                                    )
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10
                              ),
                              child: Row(
                                children: [
                                  Text(
                                  'Status :',
                                  style: TextStyle(
                                      fontFamily: 'Lato',
                                      color: Colors.black,
                                      fontSize: FontSize.sm.value,
                                      fontWeight: FontWeight.w400
                                      ),
                                  ),
                                  Spacer(),
                                  Text(
                                  'Arrive',
                                  style: TextStyle(
                                      fontFamily: 'Lato',
                                      color: Colors.yellow,
                                      fontSize: FontSize.sm.value,
                                      fontWeight: FontWeight.w400
                                      ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                    
                        ),
                      
                    ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DeliveryDetailScreen()));
                  },
                  child: ContainerStandart(
                    child: 
                    Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 10,left: 10),
                                    child: Text(
                                    'EQUIPE SERVICE & TECHNOLOGY PTE LTD : 29 MANDAI ESTATE, #03-08 PRESTIGIO 1',
                                    style: TextStyle(
                                        fontFamily: 'Lato',
                                        color: Colors.black,
                                        fontSize: FontSize.sm.value,
                                        fontWeight: FontWeight.w600
                                        ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(50),
                                    )
                                  ),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Icon(
                                    Icons.location_on,
                                    color: Colors.black,
                                    size: 20,
                                    )
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10
                              ),
                              child: Row(
                                children: [
                                  Text(
                                  'Status :',
                                  style: TextStyle(
                                      fontFamily: 'Lato',
                                      color: Colors.black,
                                      fontSize: FontSize.sm.value,
                                      fontWeight: FontWeight.w400
                                      ),
                                  ),
                                  Spacer(),
                                  Text(
                                  'Arrive',
                                  style: TextStyle(
                                      fontFamily: 'Lato',
                                      color: Colors.yellow,
                                      fontSize: FontSize.sm.value,
                                      fontWeight: FontWeight.w400
                                      ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                    
                        ),
                      
                    ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DeliveryDetailScreen()));
                  },
                  child: ContainerStandart(
                    child: 
                    Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 10,left: 10),
                                    child: Text(
                                    'EQUIPE SERVICE & TECHNOLOGY PTE LTD : 29 MANDAI ESTATE, #03-08 PRESTIGIO 1',
                                    style: TextStyle(
                                        fontFamily: 'Lato',
                                        color: Colors.black,
                                        fontSize: FontSize.sm.value,
                                        fontWeight: FontWeight.w600
                                        ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(50),
                                    )
                                  ),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Icon(
                                    Icons.location_on,
                                    color: Colors.black,
                                    size: 20,
                                    )
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10
                              ),
                              child: Row(
                                children: [
                                  Text(
                                  'Status :',
                                  style: TextStyle(
                                      fontFamily: 'Lato',
                                      color: Colors.black,
                                      fontSize: FontSize.sm.value,
                                      fontWeight: FontWeight.w400
                                      ),
                                  ),
                                  Spacer(),
                                  Text(
                                  'Arrive',
                                  style: TextStyle(
                                      fontFamily: 'Lato',
                                      color: Colors.yellow,
                                      fontSize: FontSize.sm.value,
                                      fontWeight: FontWeight.w400
                                      ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                    
                        ),
                      
                    ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DeliveryDetailScreen()));
                  },
                  child: ContainerStandart(
                    child: 
                    Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 10,left: 10),
                                    child: Text(
                                    'EQUIPE SERVICE & TECHNOLOGY PTE LTD : 29 MANDAI ESTATE, #03-08 PRESTIGIO 1',
                                    style: TextStyle(
                                        fontFamily: 'Lato',
                                        color: Colors.black,
                                        fontSize: FontSize.sm.value,
                                        fontWeight: FontWeight.w600
                                        ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(50),
                                    )
                                  ),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Icon(
                                    Icons.location_on,
                                    color: Colors.black,
                                    size: 20,
                                    )
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10
                              ),
                              child: Row(
                                children: [
                                  Text(
                                  'Status :',
                                  style: TextStyle(
                                      fontFamily: 'Lato',
                                      color: Colors.black,
                                      fontSize: FontSize.sm.value,
                                      fontWeight: FontWeight.w400
                                      ),
                                  ),
                                  Spacer(),
                                  Text(
                                  'Arrive',
                                  style: TextStyle(
                                      fontFamily: 'Lato',
                                      color: Colors.yellow,
                                      fontSize: FontSize.sm.value,
                                      fontWeight: FontWeight.w400
                                      ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                    
                        ),
                      
                    ),
                ),
                
                ],
              ),
            ) 
          ),
      ),
    );
  }
}