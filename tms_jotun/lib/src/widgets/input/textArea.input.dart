
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:tms_jotun/src/utils/colorManager.utils.dart';
import 'package:tms_jotun/src/utils/fontManager.utils.dart';
import 'package:tms_jotun/src/widgets/emptyWidget.dart';

class InputTextArea extends StatelessWidget {
  final String name;
  final String? label;
  final String? placeholder;
  final int? maxLines;
  final bool? required;

  const InputTextArea(
      {super.key,
      required this.name,
      this.label = "",
      this.placeholder = "",
      this.maxLines,
      this.required});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          label != ""
              ? Column(
                  children: [
                    Text(
                      label ?? "",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: "CustomOutfit",
                          fontSize: FontSize.sm.value,
                          color: ColorManager.textBlack,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                )
              : const EmptyWidget(),
          FormBuilderTextField(
            name: name,
            maxLines: maxLines ?? 1,
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.top,
            style: TextStyle(
              fontFamily: "CustomOutfit",
              fontSize: FontSize.normal.value,
              color: ColorManager.textBlack,
            ),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: ColorManager.borderLightGrey, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorManager.textBlack, width: 1),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorManager.textBlack, width: 1),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorManager.textBlack, width: 1),
              ),
              filled: true,
              errorStyle: TextStyle(
                  fontFamily: "CustomOutfit",
                  color: ColorManager.borderLightGrey,
                  fontSize: FontSize.sm.value),
              labelText: placeholder,
              labelStyle: TextStyle(
                  fontFamily: "CustomOutfit",
                  color: ColorManager.borderLightGrey,
                  fontSize: FontSize.normal.value),
              fillColor: ColorManager.white,
              alignLabelWithHint: false,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
          ),
        ],
      ),
    );
  }
}
