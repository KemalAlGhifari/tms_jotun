import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:tms_jotun/src/utils/colorManager.utils.dart';
import 'package:tms_jotun/src/utils/fontManager.utils.dart';
import 'package:tms_jotun/src/widgets/emptyWidget.dart';

class InputRadioGroupFieldCol extends StatefulWidget {
  final String name;
  final String label;
  final List<Map<String, String>> options;
  final bool? required;
  final bool? disable;
  final String? value;
  final Color color;

  const InputRadioGroupFieldCol(
      {super.key,
      required this.name,
      required this.label,
      required this.options,
      required this.color,
      this.required,
      this.disable,
      this.value = ""});

  @override
  State<InputRadioGroupFieldCol> createState() =>
      _InputRadioGroupFieldColState();
}

class _InputRadioGroupFieldColState extends State<InputRadioGroupFieldCol> {
  String? selectedValue = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        selectedValue = widget.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.label != ""
              ? Column(
                  children: [
                    Text(
                      widget.label ?? "",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: "CustomOutfit",
                          fontSize: FontSize.lg.value,
                          color: ColorManager.textBlack,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                )
              : const EmptyWidget(),
          FormBuilderField<String>(
            name: widget.name,
            builder: (FormFieldState<String?> field) {
              return InputDecorator(

                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: 0,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (var i = 0; i < widget.options.length; i++) ...[
                        Expanded(
                          child: CustomRadioTile(
                            color: widget.color,
                            label: widget.options[i]['label'] ?? "",
                            value: widget.options[i]['value'] ?? "",
                            groupValue: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value;
                                field.didChange(value);
                              });
                            },
                          ),
                        ),
                         // Adjust the width as needed
                      ]
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CustomRadioTile extends StatelessWidget {
  final String label;
  final String value;
  final String? groupValue;
  final ValueChanged<String?> onChanged;
  final Color color;

  const CustomRadioTile({
    super.key,
    required this.color,
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (groupValue != value) {
          
          onChanged(value);
        }
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: groupValue == value
              ? Colors.grey.withOpacity(0.1)
              : Colors.transparent,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
              child: Text(
                label,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: "CustomOutfit",
                    fontSize: 16,
                    color: groupValue == value
                        ? color
                        : ColorManager.textBlack,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Spacer(),
            Radio<String>(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
              fillColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected)) {
                    return color;
                  }
                  return ColorManager
                      .borderGrey; 
                },
              ),
              activeColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
