import 'package:flutter/material.dart';
import 'package:tms_jotun/src/utils/colorManager.utils.dart';
import 'package:tms_jotun/src/utils/fontManager.utils.dart';

class BottomButton extends StatelessWidget {
  final ValueNotifier<bool> redCondition;
  final ValueNotifier<bool> blueCondition;
  final String titleBlue;
  final String titleRed;
  final Function onTapRed;
  final Function onTapBlue;

  const BottomButton({
    Key? key,
    required this.redCondition,
    required this.blueCondition,
    required this.titleBlue,
    required this.titleRed,
    required this.onTapBlue,
    required this.onTapRed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      child: Row(
        children: [
          
          Expanded(
            child: ValueListenableBuilder<bool>(
              valueListenable: redCondition,
              builder: (context, isRedEnabled, child) {
                final Color cancelColor = isRedEnabled ? Colors.red : Colors.red.withOpacity(0.5);

                return GestureDetector(
                  onTap: isRedEnabled ? () => onTapRed() : null,
                  child: Container(
                    height: 55,
                    color: cancelColor,
                    child: Center(
                      child: Text(
                        titleRed,
                        style: TextStyle(
                          fontFamily: 'Lato',
                          color: Colors.white,
                          fontSize: FontSize.xs.value,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<bool>(
              valueListenable: blueCondition,
              builder: (context, isBlueEnabled, child) {
                final Color saveColor = isBlueEnabled ? ColorManager.primary : ColorManager.primary.withOpacity(0.5);

                return GestureDetector(
                  onTap: isBlueEnabled ? () => onTapBlue() : null,
                  child: Container(
                    height: 55,
                    color: saveColor,
                    child: Center(
                      child: Text(
                        titleBlue,
                        style: TextStyle(
                          fontFamily: 'Lato',
                          color: Colors.white,
                          fontSize: FontSize.xs.value,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
