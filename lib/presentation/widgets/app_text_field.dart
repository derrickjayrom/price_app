import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:price_app/utils/extention.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.obscuringCharacter = '•',
    this.initialValue,
    this.hintText = '',
    this.label,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.prefixWidget,
    this.controller,
    this.radius = 8,
    this.borderColor,
    this.bgColor,
    this.textColor,
    this.textInputAction,
    this.onSubmitted,
    this.prefixIconColor,
    this.labelStyle,
    this.labelSpace = 8,
    this.disabled = false,
    this.onPrefixTap,
    this.suffixWidget,
    this.maxLines = 1,
    this.minLines = 1,
    this.contentPadding,
    this.focusNode,
    this.onTap,
    this.showFocusBorder = true,
    this.canFocus = true,
    this.hintTextStyle,
  });
  final String? initialValue;

  final String hintText;
  final bool obscureText;
  final String obscuringCharacter;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;

  final TextEditingController? controller;
  final double radius;
  final Color? borderColor;
  final Color? bgColor;
  final Color? textColor;
  final Color? prefixIconColor;
  final TextInputAction? textInputAction;

  final String? label;
  final TextStyle? labelStyle;
  final double labelSpace;
  final bool disabled;
  final Function()? onPrefixTap;
  final Function()? onTap;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final int maxLines;
  final int minLines;
  final EdgeInsets? contentPadding;
  final FocusNode? focusNode;
  final bool showFocusBorder;
  final bool canFocus;
  final TextStyle? hintTextStyle;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late TextEditingController localController = TextEditingController();
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      localController.text = widget.initialValue ?? '';
      widget.controller?.text = widget.initialValue ?? '';
      if (widget.initialValue != null) {
        widget.onChanged?.call(widget.initialValue ?? '');
      }
    });
  }

  late OutlineInputBorder basedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(widget.radius),
    borderSide: BorderSide(
      color: widget.borderColor ?? context.colors.secondary,
      width: 1,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label ?? '',
            style:
                widget.labelStyle ??
                context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
          ),
          SizedBox(height: widget.labelSpace),
        ],
        TextFormField(
          focusNode: widget.focusNode,
          enabled: !widget.disabled,
          controller: widget.controller ?? localController,
          obscureText: widget.obscureText,
          obscuringCharacter: widget.obscuringCharacter,
          textInputAction: widget.textInputAction,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          canRequestFocus: widget.canFocus,
          style: context.textTheme.headlineMedium?.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: widget.textColor,
          ),
          onFieldSubmitted: widget.onSubmitted,
          onChanged: widget.onChanged,
          keyboardType: widget.keyboardType,
          onTap: widget.onTap,
          decoration: InputDecoration(
            prefixIcon: widget.prefixWidget,
            suffixIcon: widget.suffixWidget,
            border: basedBorder,
            focusedBorder: widget.showFocusBorder
                ? basedBorder.copyWith(
                    borderSide: BorderSide(
                      color: widget.borderColor ?? context.colors.primary,
                      width: 2,
                    ),
                  )
                : basedBorder,
            enabledBorder: basedBorder,
            errorBorder: basedBorder,
            focusedErrorBorder: basedBorder,
            fillColor: widget.bgColor ?? context.colors.secondary,
            filled: true,
            contentPadding:
                widget.contentPadding ??
                const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            hintText: widget.hintText,
            hintStyle: widget.hintTextStyle ?? context.textTheme.labelMedium,
          ),
          validator: widget.validator,
        ),
      ],
    );
  }
}
