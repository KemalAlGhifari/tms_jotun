import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:tms_jotun/src/pages/delivery/notesCustomerPo.view.dart';
import 'package:tms_jotun/src/utils/appLocalizations.utils.dart';
import 'package:tms_jotun/src/utils/colorManager.utils.dart';
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
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTypeDetail(title: '${AppLocalizations.of(context)!.translate('UNL_PES')} : 1323323'),
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
                              const TextSpan(
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
                              const TextSpan(
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
                      const CardPo(),
                      const CardPo(),
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
                      const Uploadbutton(allowFile: false,),
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
        const SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: const Column(
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
            const SizedBox(
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
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const NotesCustomerPoScreen()));
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