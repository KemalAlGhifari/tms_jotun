import 'package:flutter/material.dart';
import 'package:tms_jotun/src/utils/colorManager.utils.dart';
import 'package:tms_jotun/src/widgets/emptyWidget.dart';

class AppBarTypeHome extends StatelessWidget implements PreferredSizeWidget {
  final Widget? backScreen;
  final Function()? onBack;
  final Function()? onPressed;
  final List<Widget>? actions;

  final String title;

  const AppBarTypeHome({
    this.backScreen,
    this.onPressed,
    this.onBack,
    required this.title,
    this.actions,
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
          Text(
            '33 sep 2024',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      leading: IconButton(
        icon: Icon(Icons.menu, color: Colors.white), 
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      actions: actions
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight); // Menggunakan kToolbarHeight untuk tinggi default AppBar
}


