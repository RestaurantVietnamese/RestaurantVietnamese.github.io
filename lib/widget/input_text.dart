import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puzzel/widget/app_colors.dart';

class InputText extends StatefulWidget {
  final TextEditingController? controller;
  final Widget? iconPrefix;
  final Widget? iconSufix;
  final Widget? label;
  final String hintText;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final EdgeInsets? padding;
  final bool isShowSuffix;
  final bool readOnly;
  final Color? fillColor;
  final FocusNode? focusNode;
  final double? fontSize;
  final TextCapitalization textCapitalization;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final TextStyle? errorStyle;
  final TextStyle? style;
  final TextStyle? styleHint;
  final OutlineInputBorder? enabledBorder;
  final OutlineInputBorder? focusErrorBorder;
  final OutlineInputBorder? errordBorder;
  final OutlineInputBorder? focusedBorder;
  final TextAlign? textAlign;
  final String? initialValue;
  final double? boderCi;
  final double? fontSizeHint;
  //
  final bool isWebType;
  const InputText(
      {Key? key,
      this.controller,
      this.iconPrefix,
      this.iconSufix,
      this.textInputType,
      this.onChanged,
      this.label,
      this.focusNode,
      this.inputFormatters,
      this.obscureText = false,
      required this.hintText,
      this.textInputAction = TextInputAction.next,
      this.padding,
      this.validator,
      this.enabledBorder,
      this.isShowSuffix = false,
      this.readOnly = false,
      this.fillColor,
      this.fontSize,
      this.textCapitalization = TextCapitalization.none,
      this.maxLength,
      this.maxLines,
      this.minLines,
      this.errorStyle,
      this.style,
      this.textAlign,
      this.initialValue,
      this.onTap,
      this.styleHint,
      this.boderCi,
      this.focusErrorBorder,
      this.errordBorder,
      this.focusedBorder,
      this.fontSizeHint,
      this.isWebType = false})
      : super(key: key);

  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      initialValue: widget.initialValue,
      controller: widget.controller,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      readOnly: widget.readOnly,
      textInputAction: widget.textInputAction,
      keyboardType: widget.textInputType,
      inputFormatters: widget.inputFormatters,
      style: widget.style ??
          GoogleFonts.openSans(
              // context: context,
              color: AppColors.black,
              fontWeight: FontWeight.w400,
              fontSize: widget.fontSize ?? 14),
      focusNode: widget.focusNode,
      obscureText: widget.isShowSuffix ? obscureText : widget.obscureText,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      textCapitalization: widget.textCapitalization,
      maxLength: widget.maxLength,
      textAlign: widget.textAlign ?? TextAlign.start,
      decoration: InputDecoration(
        constraints: (widget.maxLines == null || (widget.maxLines ?? 1) > 1)
            ? null // cho multiline thì không giới hạn chiều cao
            : const BoxConstraints(
                minHeight: 56,
                maxHeight: 56,
              ),
        isDense: false,
        hintText: widget.hintText,
        label: widget.label,
        fillColor: widget.fillColor ?? Colors.white,
        prefixIcon: widget.iconPrefix,
        prefixIconConstraints:
            const BoxConstraints(minWidth: 54, minHeight: 46),
        hintStyle: widget.styleHint ??
            GoogleFonts.openSans(
                // context: context,
                color: AppColors.c757575,
                fontWeight: FontWeight.w400,
                fontSize: widget.fontSizeHint ?? 14),
        suffixIcon: widget.isShowSuffix ? _buildSuffixIcon() : widget.iconSufix,
        contentPadding: widget.padding ??
            EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 18,
            ),
        filled: true,
        errorStyle: widget.errorStyle,
        enabledBorder: widget.enabledBorder ??
            OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.boderCi ?? 8),
                borderSide: BorderSide(color: AppColors.E0E0E0)),
        focusedErrorBorder: widget.focusErrorBorder ??
            OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.boderCi ?? 8),
                borderSide: const BorderSide(color: Colors.red, width: 2)),
        errorBorder: widget.errordBorder ??
            OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.boderCi ?? 8),
                borderSide: const BorderSide(color: Colors.red)),
        focusedBorder: widget.focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.boderCi ?? 8),
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
      ),
    );
  }

  Widget _buildSuffixIcon() {
    return InkWell(
      onTap: () {
        setState(() {
          obscureText = !obscureText;
        });
      },
      child: obscureText
          ? const Icon(Icons.visibility_off, color: AppColors.p4C28A5)
          : const Icon(Icons.visibility, color: AppColors.p4C28A5),
    );
  }
}
