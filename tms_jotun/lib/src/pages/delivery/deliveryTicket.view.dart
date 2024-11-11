import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tms_jotun/src/api/apiClientToken.dart';
import 'package:tms_jotun/src/api/deliveryService.dart';
import 'package:tms_jotun/src/models/response/deliveryList.response.dart';
import 'package:tms_jotun/src/models/response/ticket.response.dart';
import 'package:tms_jotun/src/pages/delivery/orderUnload.dart';
import 'package:tms_jotun/src/pages/delivery/receivementProf.view.dart';
import 'package:tms_jotun/src/utils/appLocalizations.utils.dart';
import 'package:tms_jotun/src/utils/colorManager.utils.dart';
import 'package:tms_jotun/src/utils/fontManager.utils.dart';
import 'package:tms_jotun/src/utils/helpers.utils.dart';
import 'package:tms_jotun/src/widgets/appbar/appbarDetail.widget.dart';
import 'package:tms_jotun/src/widgets/pageLayout.widget.dart';

class DeliveryTicketScreen extends StatefulWidget {
  final DataDelivery dataDelivery;
  const DeliveryTicketScreen({required this.dataDelivery,super.key});

  @override
  State<DeliveryTicketScreen> createState() => _DeliveryTicketScreenState();
}

class _DeliveryTicketScreenState extends State<DeliveryTicketScreen> {
  late DeliveryService _deliveryService;
  TicketResponse ticketResponse = TicketResponse();
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
      final response = await _deliveryService.getDetailTicket(widget.dataDelivery.customerNo.toString(), widget.dataDelivery.deliverySchedule.toString());
      setState(() {
        print(response.data);
        ticketResponse = TicketResponse.fromJson(response.data);
        Navigator.pop(context);
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
        title: 'Dt',
        onBack: (){
          Navigator.pop(context);
        },
        ),
      body: PageLayout(
        child: Expanded(
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                'Order Total: 1',
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontFamily: 'Lato',
                    color: Colors.black,
                    fontSize: FontSize.sm.value,
                    fontWeight: FontWeight.w500
                    ),
                ),
                SizedBox(
                  height: 20,
                ), 
                Column(
                  children: ticketResponse.data?.map((item){
                    return Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                            '${item.shipmentId} (${item.totalProduk} product)',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontFamily: 'Lato',
                                color: Colors.black,
                                fontSize: FontSize.sm.value,
                                fontWeight: FontWeight.w400
                                ),
                            ),
                            Text(
                            'Status: ${AppLocalizations.of(context)!.translate('ORDER_STATUS_${item.orderStatus}')}',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontFamily: 'Lato',
                                color: Colors.grey,
                                fontSize: FontSize.sm.value,
                                fontWeight: FontWeight.w400
                                ),
                            ),
                          ],
                        ),
                        Spacer(),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderUnloadScreen(dataDelivery: widget.dataDelivery,shipmentId: item.shipmentId ?? '',)));
                          },
                          child: Icon(
                            Icons.edit,
                            size: 25,
                            color: ColorManager.primary,
                          ),
                        )
                      ],
                    );
                  }).toList() ?? []
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ReceivementProfScreen()));
        },
        child: Container(
          width: double.infinity,
          height: 55,
          color: ColorManager.primary,
          child: Center(
            child: Text(
              AppLocalizations.of(context)!.translate('next'),
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