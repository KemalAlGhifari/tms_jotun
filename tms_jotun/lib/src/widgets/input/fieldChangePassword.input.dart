import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:tms_jotun/src/utils/colorManager.utils.dart';
import 'package:tms_jotun/src/utils/fontManager.utils.dart';
import 'package:tms_jotun/src/widgets/emptyWidget.dart';

class ChangePasswordInputField extends StatefulWidget {
  final String name;
  final String placeholder;
  final String? label;
  final void Function(String?)? onChanged;

  const ChangePasswordInputField({
    super.key,
    required this.name,
    required this.placeholder,
    this.label = "",
    this.onChanged
  });

  @override
  State<ChangePasswordInputField> createState() => _ChangePasswordInputFieldState();
}

class _ChangePasswordInputFieldState extends State<ChangePasswordInputField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                          fontFamily: "Lato",
                          fontSize: FontSize.lg.value,
                          color: ColorManager.white,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                  ],
                )
              : const EmptyWidget(),
          Container(
            height: 50,
            child: FormBuilderTextField(
              name: widget.name,
              maxLines: 1,
              onChanged: widget.onChanged,
              cursorColor: Colors.black,
              style: TextStyle(
                fontFamily: "Lato",
                fontSize: FontSize.normal.value,
                color: ColorManager.textBlack,
              ),
              obscureText: _obscureText,
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  child: Icon(
                    size: 15,
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Colors.black,
                  ),
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: ColorManager.borderLightGrey, width: 1),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: ColorManager.borderLightGrey, width: 1),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.red, width: 1),
                ),
                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.red, width: 1),
                ),
                filled: true,
                errorStyle: TextStyle(
                    fontFamily: "Lato",
                    color: Colors.red,
                    fontSize: FontSize.sm.value),
                labelText: widget.placeholder,
                labelStyle: TextStyle(
                    fontFamily: "Lato",
                    color: ColorManager.borderLightGrey,
                    fontSize: FontSize.normal.value),
                fillColor: ColorManager.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
              validator: FormBuilderValidators.compose(
                [
                  FormBuilderValidators.required(
                      errorText:
                          '${widget.label} harus di isi'),
                ],
              ),
              textInputAction: TextInputAction.next,
            ),
          ),
        ],
      ),
    );
  }
}
