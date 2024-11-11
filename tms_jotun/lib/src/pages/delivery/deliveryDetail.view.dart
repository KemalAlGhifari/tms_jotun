import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tms_jotun/src/api/apiClientToken.dart';
import 'package:tms_jotun/src/api/deliveryService.dart';
import 'package:tms_jotun/src/models/response/deliveryDetail.response.dart';
import 'package:tms_jotun/src/models/response/deliveryList.response.dart';
import 'package:tms_jotun/src/pages/delivery/deliveryTicket.view.dart';
import 'package:tms_jotun/src/pages/delivery/editShipDetail.form.dart';
import 'package:tms_jotun/src/pages/delivery/trouble.view.dart';
import 'package:tms_jotun/src/utils/appLocalizations.utils.dart';
import 'package:tms_jotun/src/utils/colorManager.utils.dart';
import 'package:tms_jotun/src/utils/fontManager.utils.dart';
import 'package:tms_jotun/src/utils/helpers.utils.dart';
import 'package:tms_jotun/src/widgets/appbar/appbarDetail.widget.dart';
import 'package:tms_jotun/src/widgets/box/box.widget.dart';
import 'package:tms_jotun/src/widgets/box/topTittleBox.widget.dart';

class DeliveryDetailScreen extends StatefulWidget {
  final DataDelivery dataDelivery;
  const DeliveryDetailScreen({required this.dataDelivery,super.key});

  @override
  State<DeliveryDetailScreen> createState() => _DeliveryDetailScreenState();
}

class _DeliveryDetailScreenState extends State<DeliveryDetailScreen> {
  late DeliveryService _deliveryService;
  DeliveryDetail deliveryDetail = DeliveryDetail();

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
      });
      getDetail();
    }

  Future<void>getDetail()async{
    try {
      
      final response = await _deliveryService.getDetail(widget.dataDelivery.customerNo.toString(), widget.dataDelivery.deliverySchedule.toString());
      
      setState(() {
        deliveryDetail = DeliveryDetail.fromJson(response.data);
        Navigator.pop(context);
      });
      
    } catch (e) {
      if (e is DioException){
        print("e.response!.data");
      }
    }
  }

  Future<void>getDeliveryArrived()async{
    try {
      final response = await _deliveryService.getDeliveryArrived(widget.dataDelivery.customerNo.toString(), widget.dataDelivery.deliverySchedule.toString());
      setState(() {
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>DeliveryTicketScreen(dataDelivery: widget.dataDelivery,)));
      });
    } catch (e) {
      if (e is DioException){
        print(e.response);
      }
    }
  }
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
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                TopTittle(
                  tittle: AppLocalizations.of(context)!.translate('GENERAL_INFORMATION'),

                ),
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      ContainerStandart(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.translate('CUSTOMER'),
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    color: Colors.black,
                                    fontSize: FontSize.sm.value,
                                    fontWeight: FontWeight.w400),
                              ),
                              const Divider(
                                thickness: 0.5,
                              ),
                              const SizedBox(
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
                                        AppLocalizations.of(context)!.translate('CUSTOMER'),
                                        style: TextStyle(
                                            fontFamily: 'Lato',
                                            color: Colors.black,
                                            fontSize: FontSize.sm.value,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.3,
                                        child: Text(
                                          deliveryDetail.data?.first.customerName ?? '',
                                          style: TextStyle(
                                              fontFamily: 'Lato',
                                              color: Colors.black,
                                              fontSize: FontSize.sm.value,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!.translate('CUS_CON'),
                                        style: TextStyle(
                                            fontFamily: 'Lato',
                                            color: Colors.black,
                                            fontSize: FontSize.sm.value,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      InkWell(
                                        onTap: (){
                                        },
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: Colors.orangeAccent),
                                          child: const Center(
                                            child: Icon(
                                              Icons.call,
                                              color: Colors.white,
                                              size: 25,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
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
                                        AppLocalizations.of(context)!.translate('DEL_ADD'),
                                        style: TextStyle(
                                            fontFamily: 'Lato',
                                            color: Colors.black,
                                            fontSize: FontSize.sm.value,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.2,
                                        child: Text(
                                          deliveryDetail.data?.first.customerAddress ?? '',
                                          style: TextStyle(
                                              fontFamily: 'Lato',
                                              color: Colors.black,
                                              fontSize: FontSize.sm.value,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!.translate('STATUS'),
                                        style: TextStyle(
                                            fontFamily: 'Lato',
                                            color: Colors.black,
                                            fontSize: FontSize.sm.value,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        deliveryDetail.data?.first.orderStatus == 2 ? AppLocalizations.of(context)!.translate('ORDER_STATUS_2') :  AppLocalizations.of(context)!.translate('ORDER_STATUS_5'),
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
                              const SizedBox(
                                height: 25,
                              ),
                            ],
                          ),
                        ),
                      ),
                      ContainerStandart(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
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
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                   EditShipDetailScreen(assignmentOrderId: widget.dataDelivery.assignmentId,)));
                                    },
                                    child: Container(
                                      color: Colors.grey[300],
                                      padding: const EdgeInsets.all(1),
                                      child: const Icon(
                                        Icons.edit,
                                        color: Colors.black,
                                        size: 23,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const Divider(
                                thickness: 0.5,
                              ),
                              const SizedBox(
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
                                      SizedBox(
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
                                  const SizedBox(
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
                          padding: const EdgeInsets.all(10),
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
                              const Divider(
                                thickness: 0.5,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                AppLocalizations.of(context)!.translate('route'),
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    color: Colors.black,
                                    fontSize: FontSize.sm.value,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2.2,
                                child: Text(
                                  deliveryDetail.data?.first.route ?? '',
                                  style: TextStyle(
                                      fontFamily: 'Lato',
                                      color: Colors.black,
                                      fontSize: FontSize.sm.value,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                AppLocalizations.of(context)!.translate('DEL_ADD'),
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    color: Colors.black,
                                    fontSize: FontSize.sm.value,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2.2,
                                child: Text(
                                  deliveryDetail.data?.first.customerAddress ?? '',
                                  style: TextStyle(
                                      fontFamily: 'Lato',
                                      color: Colors.black,
                                      fontSize: FontSize.sm.value,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TroubleScreen()));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: 55,
                          color: Colors.red,
                          child: Center(
                            child: Text(
                              AppLocalizations.of(context)!.translate('TROUBLE'),
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
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.translate('CONF'),
                                      style: TextStyle(
                                          fontFamily: 'Lato',
                                          color: Colors.black,
                                          fontSize: FontSize.xl.value,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      AppLocalizations.of(context)!.translate('ARE_YOU_SURE_ALREADY_ARRIVED_AND_READY_TO_UNLOAD'),
                                      style: TextStyle(
                                          fontFamily: 'Lato',
                                          color: Colors.grey  ,
                                          fontSize: FontSize.sm.value,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          onTap: (){
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            AppLocalizations.of(context)!.translate('NO'),
                                            style: TextStyle(
                                                fontFamily: 'Lato',
                                                color: Colors.blue,
                                                fontSize: FontSize.sm.value,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        InkWell(
                                          onTap: (){
                                            Navigator.pop(context);
                                            ShowLoading(context);
                                            getDeliveryArrived();
                                          },
                                          child: Text(
                                            AppLocalizations.of(context)!.translate('YES'),
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
                              AppLocalizations.of(context)!.translate('SAMPAI'),
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
