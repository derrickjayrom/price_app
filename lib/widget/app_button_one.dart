import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:price_app/utils/app_colors.dart';
import 'package:price_app/utils/extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:easy_localization/easy_localization.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.title = '',
    this.onTap,
    this.isNegative = false,
    this.isDisabled = false,
    this.isLoading = false,
    this.isGradient = false,
    this.isTextButton = false,
    this.height = 47,
    this.width,
    this.child,
    this.textStyle,
    this.padding,
    this.trArgs,
    this.translateText = false,
    this.borderColor,
    this.radius = 8,
    this.trailing,
    this.leading,
    this.bgColor,
  });

  final String title;
  final bool isNegative;
  final bool isDisabled;
  final bool isLoading;
  final bool isGradient;
  final bool isTextButton;
  final double height;
  final double? width;
  final Function()? onTap;
  final Widget? child;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final List<String>? trArgs;
  final bool translateText;
  final Color? borderColor;
  final double radius;
  final Widget? trailing;
  final Widget? leading;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 100),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(scale: animation, child: child);
      },
      child: Container(
        padding: padding,
        height: height,
        width: width == 0 ? null : width ?? MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: isLoading || isDisabled
              ? null
              : () {
                  Vibrate.feedback(FeedbackType.light);
                  onTap?.call();
                },
          style:
              ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(0.0),
                elevation: 0,
                foregroundColor: AppColors.transparent,
                backgroundColor: AppColors.transparent,
                splashFactory: NoSplash.splashFactory,
                side: isNegative
                    ? BorderSide(color: borderColor ?? context.scaffoldColor)
                    : null,
              ).copyWith(
                overlayColor: const WidgetStatePropertyAll(Colors.transparent),
                shadowColor: const WidgetStatePropertyAll(Colors.transparent),
                elevation: const WidgetStatePropertyAll(0),
              ),
          child: Ink(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                stops: [0.1, 0.9, 0.9],
                colors: bgColor != null
                    ? [bgColor!, bgColor!, bgColor!]
                    : isNegative
                    ? [
                        context.scaffoldColor,
                        context.scaffoldColor,
                        context.scaffoldColor,
                      ]
                    : isDisabled
                    ? [AppColors.grey, AppColors.grey, AppColors.grey]
                    : isGradient
                    ? [
                        AppColors.primary.withValues(alpha: .6),
                        AppColors.primary,
                        AppColors.primary,
                      ]
                    : isTextButton
                    ? [
                        AppColors.transparent,
                        AppColors.transparent,
                        AppColors.transparent,
                      ]
                    : [AppColors.primary, AppColors.primary, AppColors.primary],
              ),
              borderRadius: BorderRadius.circular(radius),
            ),
            child: Container(
              height: height,
              alignment: Alignment.center,
              child: isLoading
                  ? const SpinKitThreeInOut(color: AppColors.white, size: 20.0)
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        leading ?? const SizedBox.shrink(),
                        child ??
                            Text(
                              translateText ? title.tr(args: trArgs) : title,
                              style:
                                  textStyle ??
                                  context.textTheme.labelMedium?.copyWith(
                                    color: isNegative
                                        ? AppColors.primary
                                        : AppColors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                            ),
                        trailing ?? const SizedBox.shrink(),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
