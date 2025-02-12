import 'package:credby_mobile/assets/app_colors.dart';
import 'package:credby_mobile/assets/app_image.dart';
import 'package:credby_mobile/common/Body/BodyWidget.dart';
import 'package:credby_mobile/common/Body/Model/BodyConfig.dart';
import 'package:credby_mobile/common/Button/ButtonWidget.dart';
import 'package:credby_mobile/common/Button/Model/ButtonConfig.dart';
import 'package:credby_mobile/common/Gap.dart';
import 'package:credby_mobile/common/Image/ImageView.dart';
import 'package:credby_mobile/common/Image/Model/ImageConfig.dart';
import 'package:credby_mobile/common/TextView/Models/TextViewConfig.dart';
import 'package:credby_mobile/common/TextView/TextView.dart';
import 'package:credby_mobile/ui/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key, required this.name, required this.amount});
  final String name, amount;

  @override
  Widget build(BuildContext context) {
    return BodyWidget(
      config: BodyConfig(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Gap(
                height: 60,
              ),
              ImageView(
                  imageConfig: ImageConfig(
                imageURL: AppImage.tick,
                imageType: ImageType.svg,
              )),
              TextView(
                config: TextViewConfig(
                  text: "\$$amount",
                  fontSize: 36,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gap(
                height: 16,
              ),
              TextView(
                config: TextViewConfig(
                  text: "Transfer successfully sent to $name.",
                  fontSize: 14,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Gap(
                height: 5,
              ),
              TextView(
                config: TextViewConfig(
                  text: "Ref: The latest batch 99.5% pure.",
                  fontSize: 14,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Gap(
                height: 130,
              ),
              ButtonWidget(
                  config: ButtonConfig(
                text: "Back",
                radius: 16.r,
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => DashboardView()));
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
