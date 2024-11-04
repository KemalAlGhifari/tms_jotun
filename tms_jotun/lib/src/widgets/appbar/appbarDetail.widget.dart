import 'package:flutter/material.dart';
import 'package:tms_jotun/src/utils/colorManager.utils.dart';
import 'package:tms_jotun/src/widgets/emptyWidget.dart';

class AppBarTypeDetail extends StatelessWidget implements PreferredSizeWidget {
  final Widget? backScreen;
  final Function()? onBack;
  final Function()? onPressed;
  final String title;

  const AppBarTypeDetail({
    this.backScreen,
    this.onPressed,
    this.onBack,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorManager.primary, // Warna background AppBar
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      leading:onBack != null ? IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white), 
        onPressed: onBack
      ) : EmptyWidget()
      
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight); // Menggunakan kToolbarHeight untuk tinggi default AppBar
}


