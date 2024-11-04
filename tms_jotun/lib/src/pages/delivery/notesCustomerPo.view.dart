import 'package:flutter/material.dart';
import 'package:tms_jotun/src/utils/colorManager.utils.dart';
import 'package:tms_jotun/src/utils/fontManager.utils.dart';
import 'package:tms_jotun/src/widgets/appbar/appbar.widget.dart';
import 'package:tms_jotun/src/widgets/button/bottomButton.widget.dart';
import 'package:tms_jotun/src/widgets/button/uploadButton.widget.dart';
import 'package:tms_jotun/src/widgets/input/textArea.input.dart';
import 'package:tms_jotun/src/widgets/pageLayout.widget.dart';

class NotesCustomerPoScreen extends StatefulWidget {
  const NotesCustomerPoScreen({super.key});

  @override
  State<NotesCustomerPoScreen> createState() => _NotesCustomerPoScreenState();
}

class _NotesCustomerPoScreenState extends State<NotesCustomerPoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: ColorManager.primary, // Warna background AppBar
      title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notes',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        actions: [
        IconButton(
          icon: Icon(Icons.call,color: Colors.white,),
          onPressed: (){},
          )
        ],
      ),
      body: PageLayout(
        padding: 0,
        child: Expanded(
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  color: Color(0xff00163f),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                      'Product Number',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        color: Colors.grey,
                        fontSize: FontSize.sm.value,
                        fontWeight: FontWeight.w400
                        ),
                      ),
                      Text(
                      '2GX001WVA',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        color: Colors.white,
                        fontSize: FontSize.sm.value,
                        fontWeight: FontWeight.w600
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                      'Product Name',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        color: Colors.grey,
                        fontSize: FontSize.sm.value,
                        fontWeight: FontWeight.w400
                        ),
                      ),
                      Text(
                      'JOTASHIELD AF COLOURS',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        color: Colors.white,
                        fontSize: FontSize.sm.value,
                        fontWeight: FontWeight.w600
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                      'Number of Product',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        color: Colors.grey,
                        fontSize: FontSize.sm.value,
                        fontWeight: FontWeight.w400
                        ),
                      ),
                      Text(
                      '30/30',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        color: Colors.white,
                        fontSize: FontSize.sm.value,
                        fontWeight: FontWeight.w600
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                      height: 14,
                    ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      InputTextArea(
                      label: 'Notes',
                      name: 'notes',
                      placeholder: 'Type Something...',
                      maxLines: 5,
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Uploadbutton()
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
        onTapBlue: (){},
        onTapRed: (){},
        ),
    );
  }
}