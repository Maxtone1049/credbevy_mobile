import 'package:credby_mobile/common/Gap.dart';
import 'package:credby_mobile/common/Image/ImageView.dart';
import 'package:credby_mobile/common/Image/Model/ImageConfig.dart';
import 'package:credby_mobile/common/TextView/Models/TextViewConfig.dart';
import 'package:credby_mobile/common/TextView/TextView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.color,
    required this.textColor,
    required this.caption,
    required this.img,
    required this.tap,
  });
  final Color color, textColor;
  final String caption, img;
  final Function() tap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: tap,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            vertical: 16.h,
          ),
          decoration: BoxDecoration(
            color: color,
            border: Border.all(width: 0.5, color: Color(0xff444449)),
            borderRadius: BorderRadius.circular(
              16.r,
            ),
          ),
          child: Wrap(
            children: [
              ImageView(
                  imageConfig: ImageConfig(
                imageURL: img,
                imageType: ImageType.svg,
              )),
              Gap(
                width: 8,
              ),
              TextView(
                config: TextViewConfig(
                  text: caption,
                  fontSize: 16,
                  color: textColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.color,
    required this.textColor,
    required this.caption,
    required this.img,
    required this.tap,
  });
  final Color color, textColor;
  final String caption, img;
  final Function() tap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          vertical: 16.h,
        ),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(width: 0.5, color: Color(0xff444449)),
          borderRadius: BorderRadius.circular(
            16.r,
          ),
        ),
        child: Wrap(
          children: [
            ImageView(
                imageConfig: ImageConfig(
              imageURL: img,
              imageType: ImageType.svg,
            )),
            Gap(
              width: 8,
            ),
            TextView(
              config: TextViewConfig(
                text: caption,
                fontSize: 16,
                color: textColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
