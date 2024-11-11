import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:tms_jotun/src/api/apiClientToken.dart';
import 'package:tms_jotun/src/api/deliveryService.dart';
import 'package:tms_jotun/src/models/response/deliveryList.response.dart';
import 'package:tms_jotun/src/models/response/orderUnload.response.dart';
import 'package:tms_jotun/src/pages/delivery/notesCustomerPo.view.dart';
import 'package:tms_jotun/src/utils/appLocalizations.utils.dart';
import 'package:tms_jotun/src/utils/colorManager.utils.dart';
import 'package:tms_jotun/src/utils/helpers.utils.dart';
import 'package:tms_jotun/src/widgets/appbar/appbarDetail.widget.dart';
import 'package:tms_jotun/src/widgets/button/bottomButton.widget.dart';
import 'package:tms_jotun/src/widgets/button/uploadButton.widget.dart';
import 'package:tms_jotun/src/widgets/pageLayout.widget.dart';

class OrderUnloadScreen extends StatefulWidget {
  final DataDelivery dataDelivery;
  final String shipmentId;
  const OrderUnloadScreen({required this.dataDelivery,required this.shipmentId,super.key});

  @override
  State<OrderUnloadScreen> createState() => OrderUnloadScreenState();
}

class OrderUnloadScreenState extends State<OrderUnloadScreen> {
  late DeliveryService _deliveryService;
  OrderUnload orderUnload = OrderUnload();
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initApiClient();
  }

  Future<void>initApiClient()async{
    ApiClientToken apiClientToken = await ApiClientToken.create();
    _deliveryService = DeliveryService(apiClientToken.dio);
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ShowLoading(context);
      getTicket();
      });
  }

    Future<void>getTicket()async{
    try {
      final response = await _deliveryService.getUnload(widget.shipmentId,widget.dataDelivery.customerNo.toString(), widget.dataDelivery.deliverySchedule.toString());
      setState(() {
        orderUnload = OrderUnload.fromJson(response.data);
        Navigator.pop(context);
      });
    } catch (e) {
      if (e is DioException){
        print(e.response);
      }
    }
  }
  
  List<File> selectedImages = [];

  void handleImageSelection(List<File> images) {
    setState(() {
      selectedImages = images;
    });
  }

  Future<void>uploadImage()async{
    
    List<String> base64Images = selectedImages.map((imageFile) {
      List<int> imageBytes = imageFile.readAsBytesSync();
      return base64Encode(imageBytes);
    }).toList();

    Map<String, dynamic> requestBody = {
      "customer_no": widget.dataDelivery.customerNo,
      "delivery_schedule": widget.dataDelivery.deliverySchedule,
      "shipment_id": widget.shipmentId,
      "pictures": base64Images,
    };
    
    try {
      final response = await _deliveryService.postPodImage(requestBody);
      print(response.data);
    } catch (e) {
      if(e is DioException){
        print(e.response);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTypeDetail(title: '${AppLocalizations.of(context)!.translate('UNL_PES')} : ${widget.shipmentId}'),
      body: PageLayout(
        padding: 0,
        child: Expanded(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), 
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(0, 2), 
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.assignment_outlined,
                        size: 60,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      RichText(
                        text: TextSpan(
                        style: const TextStyle(
                            fontFamily: 'Lato',
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600
                          ),
                          children: [
                              TextSpan(text: AppLocalizations.of(context)!.translate('CUST_PO_NO')),
                              TextSpan(
                              text: ': ${orderUnload.data?.first.customerPoNo ?? ''}',
                              style: TextStyle(
                                  fontFamily: 'Lato',
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400
                                  ),
                              ),
                            ],
                          ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      RichText(
                          text: TextSpan(
                          style: const TextStyle(
                              fontFamily: 'Lato',
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600
                              ),
                          children: [
                              TextSpan(text: AppLocalizations.of(context)!.translate('ORD_NO')),
                              TextSpan(
                              text: ': ${widget.shipmentId}',
                              style: TextStyle(
                                  fontFamily: 'Lato',
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400
                                  ),
                              ),
                            ],
                          ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), 
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(0, 1), 
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.8,
                            child: Text(
                              AppLocalizations.of(context)!.translate('PROD_NAME'),
                              style: const TextStyle(
                                fontFamily: 'Lato',
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600
                                ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              AppLocalizations.of(context)!.translate('Total'),
                              style: const TextStyle(
                                fontFamily: 'Lato',
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600
                                ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              AppLocalizations.of(context)!.translate('NOTE'),
                              style: TextStyle(
                                fontFamily: 'Lato',
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600
                                ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: orderUnload.data?.map((item){
                          return CardPo(description: item.partDescription.toString(),total: item.qty ?? 0,partNo: item.partNo ?? '',);
                        }).toList() ?? []
                      ),
 
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Spacer(),
                          Text(
                            '${AppLocalizations.of(context)!.translate('TOT_BARANG')} : 8/8',
                            style: const TextStyle(
                              fontFamily: 'Lato',
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w400
                              ),
                          ),
                          SizedBox(
                            width: 50,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        thickness: 0.5,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Uploadbutton(
                        allowFile: false,
                        onChanged: handleImageSelection
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomButton(
        blueCondition: ValueNotifier(true),
        redCondition: ValueNotifier(true),
        titleBlue: AppLocalizations.of(context)!.translate('save'),
        titleRed: AppLocalizations.of(context)!.translate('Cancel'),
        onTapBlue: (){
          uploadImage();
        },
        onTapRed: (){},
        ),
    );
  }
}


class CardPo extends StatefulWidget {
  String description;
  String partNo;
  int total;

  CardPo({required this.description,required this.partNo,required this.total,super.key});

  @override
  State<CardPo> createState() => _CardPoState();
}

class _CardPoState extends State<CardPo> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2.1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.partNo,
                    style: TextStyle(
                      fontFamily: 'Lato',
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600
                      ),
                  ),
                  Text(
                    widget.description,
                    style: TextStyle(
                      fontFamily: 'Lato',
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400
                      ),
                  ),
                ],
              )
            ),
            const SizedBox(
              width: 5,
            ),
            SizedBox(
              width: 10,
            ),
            Row(
              children: [
                Container(
                  width: 50, 
                  height: 25,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1), 
                  ),
                  child: FormBuilder(
                    key: _formKey,
                    onChanged: () {
                      _formKey.currentState!.save();
                      
                    },
                    child: FormBuilderTextField(
                      name: 'description',
                      initialValue: widget.total.toString(),
                      keyboardType: TextInputType.number, 
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      textAlign: TextAlign.center, 
                      style: const TextStyle(
                        fontFamily: 'Lato',
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400
                        ),
                      cursorHeight: 15, 
                      decoration: const InputDecoration(
                        
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                        isDense: true, 
                      ),
                      onChanged: (value){
                        
                        if (value != null && value.isNotEmpty) {
                          int inputValue = int.parse(value);
                          // Batasi nilai input agar tidak melebihi total
                          if (inputValue > widget.total) {
                            // Jika input lebih besar dari total, set nilai maksimum ke total
                            inputValue = widget.total;
                            print(widget.description);
                            // Mengubah nilai text field menjadi maksimum (total)
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              // Menggunakan kontroler untuk mengubah nilai teks
                              _formKey.currentState?.fields['description']?.didChange(inputValue.toString());
                            });
                          }
                        }
                      },
                    ),
                  ),
                ),
                  SizedBox(
                  width: 5,
                ),
                Text(
                  '/ ${widget.total}',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400
                    ),
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const NotesCustomerPoScreen()));
                },
                child: Icon(
                  Icons.edit,
                  size: 25,
                  color: ColorManager.primary,
                  ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          thickness: 0.5,
        )
      ],
    );
  }
}