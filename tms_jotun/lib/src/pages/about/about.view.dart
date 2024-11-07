import 'package:flutter/material.dart';
import 'package:tms_jotun/src/utils/appLocalizations.utils.dart';
import 'package:tms_jotun/src/utils/fontManager.utils.dart';
import 'package:tms_jotun/src/widgets/appbar/appbarDetail.widget.dart';
import 'package:tms_jotun/src/widgets/pageLayout.widget.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTypeDetail(title: 'About',onBack: (){},),
      body: PageLayout(
        padding: 0,
        child: Expanded(
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  color: Colors.grey[100],
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Jotun TMS',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    color: Colors.black,
                    fontSize: FontSize.xl2.value,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Version 1.4.5',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    color: Colors.blue,
                    fontSize: FontSize.normal.value,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Divider(
                  thickness: 0.2,
                ),
                SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start, 
                          children: [
                            Text(
                              AppLocalizations.of(context)!.translate('INSTITUTION'),
                              style: TextStyle(
                                fontFamily: 'Lato',
                                color: Colors.black,
                                fontSize: FontSize.normal.value,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Jotun Paints Malaysia Sdn. Bhd.',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                color: Colors.grey,
                                fontSize: FontSize.normal.value,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Adress',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                color: Colors.black,
                                fontSize: FontSize.normal.value,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.1,
                              child: Text(
                                'Lot 7, Persiaran Perusahaan, Seksyen 23, 43700, Shah Alam, Selangor, Malaysia',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  color: Colors.grey,
                                  fontSize: FontSize.normal.value,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              AppLocalizations.of(context)!.translate('WEBSITE'),
                              style: TextStyle(
                                fontFamily: 'Lato',
                                color: Colors.black,
                                fontSize: FontSize.normal.value,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.1,
                              child: Text(
                                'www.jotun.com.my',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  color: Colors.grey,
                                  fontSize: FontSize.normal.value,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Email',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                color: Colors.black,
                                fontSize: FontSize.normal.value,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.1,
                              child: Text(
                                'info@jotun.com.my',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  color: Colors.grey,
                                  fontSize: FontSize.normal.value,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Copyright',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                color: Colors.black,
                                fontSize: FontSize.normal.value,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.1,
                              child: Text(
                                '@2023 Jotun TMS',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  color: Colors.grey,
                                  fontSize: FontSize.normal.value,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.1,
                              child: Text(
                                'Last Update 10 February 2023',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  color: Colors.blue,
                                  fontSize: FontSize.normal.value,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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