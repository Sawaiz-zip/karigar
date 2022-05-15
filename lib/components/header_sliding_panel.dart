import 'package:flutter/widgets.dart';
import 'package:karigar/themes/app_text_styles.dart';
import 'package:karigar/utils/assets.dart';

class HeaderSlidingPanel extends StatelessWidget {
  final String? title;
  final String backButtonPath;
  final VoidCallback onClicked;

  const HeaderSlidingPanel(
      {Key? key,
      required this.title,
      this.backButtonPath = Assets.icCloseBottomSheet,
      required this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onClicked,
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
                backButtonPath,
                height: 40,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                title!,
                style: AppTextStyle.textH2(),
              )),
        )
      ],
    );
  }
}
