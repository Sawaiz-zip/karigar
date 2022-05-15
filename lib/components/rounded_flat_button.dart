import 'package:flutter/material.dart';
import 'package:karigar/components/locale_compatible_arrow.dart';
import 'package:karigar/themes/app_text_styles.dart';
import 'package:karigar/utils/assets.dart';

//ignore: must_be_immutable
class RoundedFlatButton extends StatefulWidget {
  final String? title;
  final String? secondTitle;
  Color? titleColor = Colors.yellow;
  Color? backgroundColor = Colors.grey[300];
  Color titleColorDisabled = Colors.white;
  Color backgroundColorDisabled = Colors.grey;
  bool isEnabled = true;
  double borderRadius;
  double buttonHeight;
  double iconBoxWidth;
  double iconPadding;

  final VoidCallback? onClicked;
  final double? width;
  final double fontSize;
  String? imagePath = '';

  RoundedFlatButton({
    Key? key,
    required this.title,
    required this.onClicked,
    this.borderRadius = 8,
    this.buttonHeight = 55,
    this.secondTitle,
    this.backgroundColor,
    this.titleColor,
    this.backgroundColorDisabled = Colors.grey,
    this.titleColorDisabled = Colors.white,
    this.isEnabled = true,
    this.width,
    this.fontSize = 16.0,
    this.imagePath,
    this.iconBoxWidth = 8,
    this.iconPadding = 8,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RoundedFlatButtonState();
}

class _RoundedFlatButtonState extends State<RoundedFlatButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.isEnabled) {
          widget.onClicked!();
        }
      },
      child: Container(
        width: widget.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          color: (widget.isEnabled
              ? widget.backgroundColor
              : widget.backgroundColorDisabled),
        ),
        height: widget.buttonHeight,
        // alignment: Alignment.center,
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: widget.secondTitle != null
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.center,
                children: [
                  widget.imagePath != null && widget.imagePath!.isNotEmpty
                      ? Padding(
                          padding: EdgeInsets.all(widget.iconPadding),
                          child: Image.asset(
                            widget.imagePath!,
                            height: 30,
                            width: 30,
                          ),
                        )
                      : Container(),
                  SizedBox(
                    width: widget.secondTitle != null ? 12 : 4,
                  ),
                  Text(
                    widget.title!,
                    style: AppTextStyle.textH3(
                        fontSize: widget.fontSize,
                        textColor: (widget.isEnabled
                            ? widget.titleColor
                            : widget.titleColorDisabled)),
                  ),
                  widget.secondTitle == null ? Container() : Spacer(),
                  widget.secondTitle == null
                      ? Container()
                      : Row(
                          children: [
                            Text(
                              widget.secondTitle!,
                              style: AppTextStyle.textH3(
                                  textColor: widget.titleColor),
                            ),
                            SizedBox(
                              width: widget.iconBoxWidth,
                            ),
                            LocaleCompatibleArrow(
                              // arrowDirection: ArrowDirection.forward,
                              // isLongArrow: true,
                              imagePath: Assets.icForwardArrowBlack,
                            )
                          ],
                        ),
                  SizedBox(
                    width: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
