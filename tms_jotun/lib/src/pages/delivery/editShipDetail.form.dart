import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:tms_jotun/src/api/apiClientToken.dart';
import 'package:tms_jotun/src/api/shipService.dart';
import 'package:tms_jotun/src/models/request/ship.request.dart';
import 'package:tms_jotun/src/utils/appLocalizations.utils.dart';
import 'package:tms_jotun/src/utils/colorManager.utils.dart';
import 'package:tms_jotun/src/utils/fontManager.utils.dart';
import 'package:tms_jotun/src/utils/helpers.utils.dart';
import 'package:tms_jotun/src/widgets/appbar/appbarDetail.widget.dart';
import 'package:tms_jotun/src/widgets/box/box.widget.dart';
import 'package:tms_jotun/src/widgets/button/button.widget.dart';
import 'package:tms_jotun/src/widgets/input/textField.input.dart';

class EditShipDetailScreen extends StatefulWidget {
  String? assignmentOrderId;
  EditShipDetailScreen({required this.assignmentOrderId, super.key});

  @override
  State<EditShipDetailScreen> createState() => EditShipDetailScreenState();
}

class EditShipDetailScreenState extends State<EditShipDetailScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  late ShipService _shipService;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initApitoken();
  }

  Future<void>initApitoken()async{
    ApiClientToken apiClientToken = await ApiClientToken.create();
    _shipService = ShipService(apiClientToken.dio);
    
  }

  Future<void> postShip()async{
      String? kode = _formKey.currentState?.fields['kode']?.value;
      String? name = _formKey.currentState?.fields['name']?.value;
      print('$name  $kode');
      MmsiRequest _assingment = MmsiRequest(mmsiCode: kode.toString(), mmsiName: name.toString(), transit: 1, assignmentOrderId: widget.assignmentOrderId.toString());
      if(kode != null && name != null ){
        final response = await _shipService.postShip(_assingment);

      }else{
        ShowError(context, 'Error', "code and name cannot be empty");
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTypeDetail(
        title: "General Information",
        onBack: (){
          Navigator.pop(context);
        },
        ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), 
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 2), 
                    ),
                  ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                    AppLocalizations.of(context)!.translate('GENERAL_INFORMATION'),
                    style: TextStyle(
                      fontFamily: 'Lato',
                      color: Colors.black,
                      fontSize: FontSize.normal.value,
                      fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Container(
                      width: 100,
                      height: 3,
                      color: ColorManager.primary,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ContainerStandart(
                margin: EdgeInsets.symmetric(
                  horizontal: 15
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
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
                        Text(
                        'Ship Details',
                        style: TextStyle(
                            fontFamily: 'Lato',
                            color: Colors.black,
                            fontSize: FontSize.sm.value,
                            fontWeight: FontWeight.w600
                            ),
                        ),
                        Divider(
                          thickness: 0.5,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                        'Kode Kapal',
                        style: TextStyle(
                            fontFamily: 'Lato',
                            color: Colors.black,
                            fontSize: FontSize.sm.value,
                            fontWeight: FontWeight.w400
                            ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ContainerStandart(
                          minHeight: 20,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: FormBuilderTextField(
                              name: 'kode',
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green), // Garis bawah saat tidak fokus
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue, width: 2), // Garis bawah saat fokus
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                        'Nama Kapal',
                        style: TextStyle(
                            fontFamily: 'Lato',
                            color: Colors.black,
                            fontSize: FontSize.sm.value,
                            fontWeight: FontWeight.w400
                            ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ContainerStandart(
                          minHeight: 2, 
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: FormBuilderTextField(
                              name: 'name',
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 0),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                  
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue, width: 2), // Garis bawah saat fokus
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: (){
                            postShip();
                          },
                          child: Container(
                            width: 70,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.blue
                            ),
                            child: Center(
                              child: Text(
                              'SAVE',
                              style: TextStyle(
                                  fontFamily: 'Lato',
                                  color:Colors.white,
                                  fontSize: FontSize.sm.value,
                                  fontWeight: FontWeight.w500
                                  ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}