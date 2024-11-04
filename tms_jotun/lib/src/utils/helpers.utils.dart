  import 'package:flutter/material.dart';
import 'package:tms_jotun/src/utils/fontManager.utils.dart';

Future<void>showModal(BuildContext context,double width,bool back, Widget child )async {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            InkWell(
              onTap: (){
                if(back){
                  Navigator.pop(context);
                }
              },
              child: Container(
                color: Colors.transparent,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: double.infinity
                ),
                
                width: width,
                color: Colors.white,
                child: child
              ),
            ),
          ],
        ),
      );
    },
  );
}


Future<void>ShowLoading(BuildContext context) async{
  showModal(context,
    MediaQuery.of(context).size.width / 2.5, 
    false,
      Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25,
                  width: 25,
                  child: CircularProgressIndicator(
                    strokeWidth: 1.0, // Mengatur ketebalan lebih tipis
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue), // Mengatur warna menjadi biru
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                'Please wait',
                style: TextStyle(
                  fontFamily: 'Lato',
                  color: Colors.grey,
                  fontSize: FontSize.sm.value,
                  fontWeight: FontWeight.w500
                  ),
                ),
              ],
            )
          ],
        ),
      )
    );
}