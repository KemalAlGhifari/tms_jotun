import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:tms_jotun/src/pages/delivery/notesCustomerPo.view.dart';
import 'package:tms_jotun/src/utils/colorManager.utils.dart';
import 'package:tms_jotun/src/utils/fontManager.utils.dart';
import 'package:tms_jotun/src/widgets/appbar/appbarDetail.widget.dart';
import 'package:tms_jotun/src/widgets/button/bottomButton.widget.dart';
import 'package:tms_jotun/src/widgets/button/uploadButton.widget.dart';
import 'package:tms_jotun/src/widgets/pageLayout.widget.dart';

class CustomerPoScreen extends StatefulWidget {
  const CustomerPoScreen({super.key});

  @override
  State<CustomerPoScreen> createState() => CustomerPoScreenState();
}

class CustomerPoScreenState extends State<CustomerPoScreen> {
  final ValueNotifier<bool> isEnabledNotifier = ValueNotifier<bool>(false);
 @override
  void dispose() {
    isEnabledNotifier.dispose();
    super.dispose();
  }

  void someExternalTrigger() {
   
    isEnabledNotifier.value = true; // Atau `false` untuk menonaktifkan
  }
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTypeDetail(title: 'Order Unload: 1323323'),
      body: PageLayout(
        padding: 0,
        child: Expanded(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: 20
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), 
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 2), 
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.assignment_outlined,
                        size: 60,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      RichText(
                          text: const TextSpan(
                          style: TextStyle(
                              fontFamily: 'Lato',
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600
                              ),
                          children: [
                              TextSpan(text: 'Customer PO Number'),
                              TextSpan(
                              text: ': TBA',
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
                      SizedBox(
                        height: 15,
                      ),
                      RichText(
                          text: const TextSpan(
                          style: TextStyle(
                              fontFamily: 'Lato',
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600
                              ),
                          children: [
                              TextSpan(text: 'Oder Number'),
                              TextSpan(
                              text: ': 192323',
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
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), 
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1), 
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 1.8,
                            child: Text(
                              'Product Name',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600
                                ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Total',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600
                                ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Notes',
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
                      CardPo(),
                      CardPo(),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Spacer(),
                          Text(
                            'Goods Total: 8/8',
                            style: TextStyle(
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
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        thickness: 0.5,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Uploadbutton(allowFile: false,),
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
        titleBlue: 'SAVE',
        titleRed: "CANCEL",
        onTapBlue: (){
          Navigator.pop(context);
        },
        onTapRed: (){},
        ),
    );
  }
}


class CardPo extends StatelessWidget {
  const CardPo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '0Z8CPBEQA',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600
                      ),
                  ),
                  Text(
                    'MARATHON 1000 GF,COMP B 4.5l',
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
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: 50, 
                    height: 25,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1), 
                    ),
                    child: FormBuilderTextField(
                      name: 'name',
                      keyboardType: TextInputType.number, 
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      textAlign: TextAlign.center, 
                      style: TextStyle(
                        fontFamily: 'Lato',
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400
                        ),
                      cursorHeight: 15, 
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                        isDense: true, 
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '/ 5',
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
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>NotesCustomerPoScreen()));
                  },
                  child: Icon(
                    Icons.edit,
                    size: 25,
                    color: ColorManager.primary,
                    ),
                ),
              )
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          thickness: 0.5,
        )
      ],
    );
  }
}