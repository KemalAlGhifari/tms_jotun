import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:tms_jotun/src/api/apiClient.dart';
import 'package:tms_jotun/src/api/apiClientToken.dart';
import 'package:tms_jotun/src/api/deliveryService.dart';
import 'package:tms_jotun/src/api/otherService.dart';
import 'package:tms_jotun/src/api/versionService.dart';
import 'package:tms_jotun/src/blocs/bloc/user_bloc.dart';
import 'package:tms_jotun/src/models/response/deliveryList.response.dart';
import 'package:tms_jotun/src/models/response/error.response.dart';
import 'package:tms_jotun/src/models/response/login.response.dart';
import 'package:tms_jotun/src/pages/delivery/deliveryDetail.view.dart';
import 'package:tms_jotun/src/pages/login/login.view.dart';
import 'package:tms_jotun/src/utils/appLocalizations.utils.dart';
import 'package:tms_jotun/src/utils/colorManager.utils.dart';
import 'package:tms_jotun/src/utils/fontManager.utils.dart';
import 'package:tms_jotun/src/utils/helpers.utils.dart';
import 'package:tms_jotun/src/widgets/appbar/appbar.widget.dart';
import 'package:tms_jotun/src/widgets/box/box.widget.dart';
import 'package:tms_jotun/src/widgets/drawer/drawer.widget.dart';
import 'package:tms_jotun/src/widgets/input/inputBasic.dart';
import 'package:tms_jotun/src/widgets/pageLayout.widget.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  bool isFirstView;
  HomeScreen({this.isFirstView = false, super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  late VersionService _versionService;
  late DeliveryService _deliveryService;
  late OtherService _otherService;
  final _formKey = GlobalKey<FormBuilderState>();

  late DeliveryList deliveryList = DeliveryList();
  String phoneNumber = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ShowLoading(context);
  });
    initUser();
  }

  Future<void> initUser() async {
  
  deliveryList = DeliveryList();
  if (widget.isFirstView) {
    await loadUserFromPreferences(context);
    widget.isFirstView = false;
  }
  Future.delayed(Duration(milliseconds: 1),()async{
    final apiClient = await ApiClientToken.create();
    _versionService = VersionService(apiClient.dio);
    _deliveryService = DeliveryService(apiClient.dio);
    _otherService = OtherService(apiClient.dio);

    try {
      final responseVersion = await _versionService.getVersion();
      final responseDelivery = await _deliveryService.getList(responseVersion.data['data']);
      final responsePhoneNumber = await _otherService.getPhoneNumber();
      setState(() {
        phoneNumber = responsePhoneNumber.data['data'];
        deliveryList = DeliveryList.fromJson(responseDelivery.data);
        Navigator.pop(context);
      });
    } catch (e) {
      if (e is DioException) {
        print(e.response);
        if(e.response!.statusCode == 401){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
        }
          // ErrorLog error = ErrorLog.fromJson(e.response!.data);
          // ShowError(context, 'Login Failed', error.message.toString());
        } else {

        }
    }
  });
}



  Future<void>checkDataUser(BuildContext context)async{
  final userBloc = BlocProvider.of<UserBloc>(context);
      final currentState = userBloc.state;
      final Login user =
          (currentState is DataUser) ? currentState.loginModel : Login();
      print(user.data?.name);
  }

  Future<void>checkPasscode()async{
    try { 
      Navigator.pop(context);
      ShowLoading(context);
      String? passcode = _formKey.currentState?.fields['passcode']?.value;
      final response = await _otherService.getCheckPasscode(passcode ?? '');
      initUser();
    } catch (e) {
      
    }
  }

  void _launchCaller() async {
  final url = 'tel:$phoneNumber';
  if (await canLaunch(url)) {
  await launch(url);
  } else {
  throw 'Could not launch $url';
  }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTypeHome(
        title: AppLocalizations.of(context)!.translate('DELIVERY'),
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
                      AppLocalizations.of(context)!.translate('CHECK_PASSCODE'),
                      style: TextStyle(
                        fontFamily: 'Lato',
                        color: Colors.black,
                        fontSize: FontSize.xl.value,
                        fontWeight: FontWeight.w500
                        ),
                      ),
                      Text(
                      AppLocalizations.of(context)!.translate('SECURITY_CHECKS_AFTER_CHECKING'),
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
                      FormBuilder(
                        key: _formKey,
                        onChanged: () {
                          _formKey.currentState!.save();
                          debugPrint(
                              _formKey.currentState!.value.toString());
                        },
                        child: InputTextBasic(
                          name: "passcode",
                          placeholder: 'Passcode'),
                      ),
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
                            AppLocalizations.of(context)!.translate('CANCEL'),
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
                          InkWell(
                            onTap: (){
                              String? passcode = _formKey.currentState?.fields['passcode']?.value;
                              if(passcode != null){
                                checkPasscode();  
                              }
                            },
                            child: Text(
                            AppLocalizations.of(context)!.translate('OK'),
                            style: TextStyle(
                              fontFamily: 'Lato',
                              color: Colors.blue,
                              fontSize: FontSize.sm.value,
                              fontWeight: FontWeight.w500
                              ),
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
              _launchCaller();
            },
          ),
        ],
        ),
      drawer: DrawerWidget(),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Expanded(
          child: Container(
            width: double.infinity,
            child: RefreshIndicator(
              onRefresh: ()async{
                initUser();
                ShowLoading(context);
              },
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: deliveryList.total ?? 0,
                itemBuilder: (context,index) {
                  final item = deliveryList.data![index];
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DeliveryDetailScreen(dataDelivery: item,)));
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
                                      deliveryList.data?[index].customerName.toString() ?? '',
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
                                      item.orderStatus == 2 ? Icons.access_time_outlined : Icons.location_on,
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
                                    '${AppLocalizations.of(context)!.translate('STATUS')} :',
                                    style: TextStyle(
                                        fontFamily: 'Lato',
                                        color: Colors.black,
                                        fontSize: FontSize.sm.value,
                                        fontWeight: FontWeight.w400
                                        ),
                                    ),
                                    Spacer(),
                                    Text(
                                    deliveryList.data![index].orderStatusName.toString(),
                                    style: TextStyle(
                                        fontFamily: 'Lato',
                                        color:item.orderStatus == 2 ? Colors.blue :Colors.yellow,
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
                  );
                }
              ),
            ),
            ) 
          ),
      ),
    );
  }
}