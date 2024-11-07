import 'package:flutter/material.dart';
import 'package:tms_jotun/src/pages/delivery/customerPo.view.dart';
import 'package:tms_jotun/src/pages/delivery/receivementProf.view.dart';
import 'package:tms_jotun/src/utils/appLocalizations.utils.dart';
import 'package:tms_jotun/src/utils/colorManager.utils.dart';
import 'package:tms_jotun/src/utils/fontManager.utils.dart';
import 'package:tms_jotun/src/widgets/appbar/appbarDetail.widget.dart';
import 'package:tms_jotun/src/widgets/pageLayout.widget.dart';

class DeliveryTotalScreen extends StatefulWidget {
  const DeliveryTotalScreen({super.key});

  @override
  State<DeliveryTotalScreen> createState() => _DeliveryTotalScreenState();
}

class _DeliveryTotalScreenState extends State<DeliveryTotalScreen> {
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
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                        '13499329 (2 product)',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontFamily: 'Lato',
                            color: Colors.black,
                            fontSize: FontSize.sm.value,
                            fontWeight: FontWeight.w400
                            ),
                        ),
                        Text(
                        'Status: Arrive',
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomerPoScreen()));
                      },
                      child: Icon(
                        Icons.edit,
                        size: 25,
                        color: ColorManager.primary,
                      ),
                    )
                  ],
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