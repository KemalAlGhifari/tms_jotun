import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:tms_jotun/src/pages/home/home.view.dart';
import 'package:tms_jotun/src/setting/setting_controller.dart';
import 'package:tms_jotun/src/utils/appLocalizations.utils.dart';
import 'package:tms_jotun/src/utils/fontManager.utils.dart';
import 'package:tms_jotun/src/utils/helpers.utils.dart';
import 'package:tms_jotun/src/widgets/appbar/appbarDetail.widget.dart';
import 'package:tms_jotun/src/widgets/input/radioGroupField.input.dart';
import 'package:tms_jotun/src/widgets/input/radioGroupFieldLanguage.input.dart';
import 'package:tms_jotun/src/widgets/pageLayout.widget.dart';

class LanguageSelectionScreen extends StatefulWidget {
  @override
  State<LanguageSelectionScreen> createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    final settingsController = Provider.of<SettingsController>(context, listen: false);
    final _formKey = GlobalKey<FormBuilderState>();
    return Scaffold(
      backgroundColor: Color(0xfff8f8f8),
      appBar: AppBarTypeDetail(title: AppLocalizations.of(context)!.translate('SETTINGS'), onBack: (){Navigator.pop(context);},),
      body: PageLayout(
        padding: 0,
        child: Expanded(
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Features',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      color: Colors.black,
                      fontSize: FontSize.normal.value,
                      fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(
                        Icons.language,
                        color: Colors.grey,
                        size: 25,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        AppLocalizations.of(context)!.translate('language'),
                        style: TextStyle(
                          fontFamily: 'Lato',
                          color: Colors.grey,
                          fontSize: FontSize.sm.value,
                          fontWeight: FontWeight.w400),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: (){
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
                                    AppLocalizations.of(context)!.translate('language'),
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      color: Colors.black,
                                      fontSize: FontSize.xl.value,
                                      fontWeight: FontWeight.w500),
                                  ),
                                  Divider(
                                    thickness: .5,
                                  ),
                                  FormBuilder(
                                    key: _formKey,
                                    onChanged: () {
                                      _formKey.currentState!.save();
                                      
                                    },
                                    child: InputRadioGroupFieldLanguageCol(
                                      value: '',
                                      name: "bahasa",
                                      label: "",
                                      required: true,
                                      options: const [
                                        {"label": "english", "value": "en_US"},
                                        {"label": "Malaysia", "value": "my_MY"}
                                      ],
                                      color: Colors.blue,
                                    ),
                                  ),
                                  Divider(
                                    thickness: .5,
                                  ),
                                  SizedBox(
                                    height: 5,
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
                                        String? bahasa = _formKey.currentState?.fields['bahasa']?.value;
                                        if(bahasa != null){
                                          final parts = bahasa!.split('_');
                                          final language = parts[0]; // 'en'
                                          final region = parts[1];   // 'US'
                                          settingsController.updateLocale(Locale(language, region));
                                          Navigator.pop(context);
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
                        },
                        child: Row(
                          children: [
                            Text(
                              'English',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                color: Colors.grey,
                                fontSize: FontSize.sm.value,
                                fontWeight: FontWeight.w400),
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              size: 20,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
