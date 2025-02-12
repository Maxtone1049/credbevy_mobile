import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../assets/app_colors.dart';
import '../../assets/app_image.dart';
import '../Image/ImageView.dart';
import '../Image/Model/ImageConfig.dart';
import '../TextView/Models/TextViewConfig.dart';
import '../TextView/TextView.dart';
import 'Model/BodyConfig.dart';

class BodyWidget extends StatelessWidget {
  final BodyConfig? config;

  const BodyWidget({required this.config, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: config?.backgroundColor,
              appBar: config!.showAppBar
                  ? AppBar(
                      centerTitle: config!.centerTitle,
                      automaticallyImplyLeading:
                          config!.automaticallyImplyLeading,
                      actions: config?.actions,
                      elevation: config?.elevation,
                      iconTheme: const IconThemeData(color: AppColors.grey900),
                      backgroundColor: config?.appbarBackgroundColor,
                      leading: config!.showLeadingWidget
                          ? config?.leadingWidget ??
                              CupertinoButton(
                                onPressed: config?.onPressed,
                                child: ImageView(
                                  imageConfig: ImageConfig(
                                    imageURL: config?.leadingIcon ??
                                        AppImage.closeOutlined,
                                    imageType: ImageType.asset,
                                    height: 40.h,
                                    width: 40.w,
                                  ),
                                ),
                              )
                          : null,
                      title: TextView(
                        config: TextViewConfig(
                            text: config?.appBarTitle ?? '',
                            textStyle: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(
                                    fontSize: 16.sp,
                                    color: config?.appbarTitleColor,
                                    fontWeight: FontWeight.w500)),
                      ),
                      bottom: config?.tabs != null
                          ? TabBar(tabs: config!.tabs!)
                          : null,
                    )
                  : null,
              body: SafeArea(
                minimum: config?.childPadding ??
                    EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: config?.child,
                ),
              ),
              bottomNavigationBar: config?.bottomNavigationBar,
              floatingActionButton: config!.floatingActionButton,
            ),
            Visibility(
                visible: config?.loading ?? false,
                child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.black.withOpacity(.2),
                    child: const Loader()))
          ],
        ),
        onWillPop: () async => config?.automaticallyImplyLeading ?? true);
  }
}

class Loader extends StatelessWidget {
  const Loader({super.key, this.size = 350});

  final int? size;

  // @override
  // Widget build(BuildContext context) {
  //   return Center(
  //     child: ImageView(
  //         imageConfig: ImageConfig(
  //             // imageURL: AppImage.app,
  //             imageURL: AppImage.billTopgif,
  //             boxFit: BoxFit.contain,
  //             height: size?.w,
  //             imageType: ImageType.asset)),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(radius: 30.r, color: AppColors.white),
    );
  }
}
