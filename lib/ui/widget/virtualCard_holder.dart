import 'package:credby_mobile/assets/app_colors.dart';
import 'package:credby_mobile/assets/app_image.dart';
import 'package:credby_mobile/common/Gap.dart';
import 'package:credby_mobile/common/Image/ImageView.dart';
import 'package:credby_mobile/common/Image/Model/ImageConfig.dart';
import 'package:credby_mobile/common/TextView/Models/TextViewConfig.dart';
import 'package:credby_mobile/common/TextView/TextView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VirtualCard extends StatelessWidget {
  const VirtualCard({
    super.key,
    required this.name,
    required this.expDate,
    required this.cardNum,
    required this.cardType,
    required this.color, required this.bankName,
  });
  final String name, expDate, cardNum, cardType,bankName;
  final LinearGradient color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16.w),
      width: 288.w,
      padding: EdgeInsets.only(
        top: 32.h,
        bottom: 17.h,
        left: 15.w,
        right: 15.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          23.r,
        ),
        gradient: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextView(
                config: TextViewConfig(
                  text: cardType,
                  fontSize: 14,
                  color: AppColors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              ImageView(
                  imageConfig: ImageConfig(
                imageURL: AppImage.master,
                imageType: ImageType.svg,
              ))
            ],
          ),
          TextView(
            config: TextViewConfig(
              text: bankName,
              fontSize: 20,
              color: AppColors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
          Gap(
            height: 30,
          ),
          TextView(
            config: TextViewConfig(
              text: cardNum,
              fontSize: 20,
              color: AppColors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
          Gap(
            height: 33,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    config: TextViewConfig(
                      text: "NAME",
                      fontSize: 10,
                      color: AppColors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextView(
                    config: TextViewConfig(
                      text: name,
                      fontSize: 14,
                      color: AppColors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    config: TextViewConfig(
                      text: "EXPIRY",
                      fontSize: 10,
                      color: AppColors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextView(
                    config: TextViewConfig(
                      text: expDate,
                      fontSize: 14,
                      color: AppColors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
