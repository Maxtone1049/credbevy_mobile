import 'package:credby_mobile/assets/app_colors.dart';
import 'package:credby_mobile/common/Gap.dart';
import 'package:credby_mobile/common/Image/ImageView.dart';
import 'package:credby_mobile/common/Image/Model/ImageConfig.dart';
import 'package:credby_mobile/common/TextView/Models/TextViewConfig.dart';
import 'package:credby_mobile/common/TextView/TextView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class HistoryHolder extends StatelessWidget {
  const HistoryHolder({
    super.key,
    required this.image,
    required this.month,
    required this.amount,
  });
  final String image, month, amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.symmetric(
        vertical: 28.5,
        horizontal: 20.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(
          24.r,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 4), // changes position of shadow to bottom
          ),
        ],
      ),
      child: Row(
        children: [
          ImageView(
              imageConfig: ImageConfig(
            imageURL: image,
            imageType: ImageType.svg,
          )),
          Gap(
            width: 24,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  config: TextViewConfig(
                    text: month,
                    fontSize: 16,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextView(
                  config: TextViewConfig(
                    text: "Jun 10 - 12:00pm",
                    fontSize: 12,
                    color: Color(0xff454545),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          TextView(
            config: TextViewConfig(
              text: amount,
              fontSize: 16,
              color: AppColors.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
