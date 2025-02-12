import 'package:credby_mobile/assets/app_colors.dart';
import 'package:credby_mobile/assets/app_image.dart';
import 'package:credby_mobile/common/Body/BodyWidget.dart';
import 'package:credby_mobile/common/Body/Model/BodyConfig.dart';
import 'package:credby_mobile/common/Gap.dart';
import 'package:credby_mobile/common/Image/ImageView.dart';
import 'package:credby_mobile/common/Image/Model/ImageConfig.dart';
import 'package:credby_mobile/common/TextView/Models/TextViewConfig.dart';
import 'package:credby_mobile/common/TextView/TextView.dart';
import 'package:credby_mobile/core/helpers/model/send_fund_res_model/transaction.dart';
import 'package:credby_mobile/core/helpers/viewmodel/profile_viewmodel.dart';
import 'package:credby_mobile/core/maincore/app.locator.dart';
import 'package:credby_mobile/ui/send_money.dart';
import 'package:credby_mobile/ui/widget/action_button.dart';
import 'package:credby_mobile/ui/widget/historyHolder.dart';
import 'package:credby_mobile/ui/widget/trans_skeleton.dart';
import 'package:credby_mobile/ui/widget/virtualCard_holder.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewmodel>.reactive(
        viewModelBuilder: () => locator<ProfileViewmodel>(),
        onViewModelReady: (model) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            model.fetchExpense();
            model.fetchCards();
          });
        },
        disposeViewModel: false,
        builder: (_, model, __) {
          return BodyWidget(
            config: BodyConfig(
              backgroundColor: AppColors.white,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(
                          height: 36,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ImageView(
                                imageConfig: ImageConfig(
                              imageURL: AppImage.menu,
                              imageType: ImageType.svg,
                            )),
                            ImageView(
                                imageConfig: ImageConfig(
                              imageURL: AppImage.profile,
                              imageType: ImageType.asset,
                            ))
                          ],
                        ),
                        const Gap(
                          height: 32,
                        ),
                        TextView(
                          config: TextViewConfig(
                            text: "My Cards",
                            fontSize: 26,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Gap(
                          height: 16,
                        ),
                        if (model.isBusy)
                          TransactionSkeleton(count: 2)
                        else
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                ...?model.getCards?.data?.map(
                                  (e) => VirtualCard(
                                    name: '${e.name}',
                                    expDate: '${e.expiryDate}',
                                    cardNum: '${e.cardNumber}',
                                    cardType: '${e.cardType}',
                                    bankName: "${e.bankName}",
                                    color: e.cardType == 'Visa'
                                        ? LinearGradient(
                                            colors: [
                                              AppColors.pinkLight,
                                              AppColors.pinkDark
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          )
                                        : LinearGradient(
                                            colors: [
                                              AppColors.blueDark,
                                              AppColors.blueLight
                                            ],
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                          ),
                                  ),
                                ),
                                // VirtualCard(
                                //   name: 'Jackie Chan',
                                //   expDate: '01/2025',
                                //   cardNum: '2536 1457 1477 2364',
                                //   cardType: 'Credit Suisse',
                                // color: LinearGradient(
                                //   colors: [
                                //     AppColors.blueDark,
                                //     AppColors.blueLight
                                //   ],
                                //   begin: Alignment.centerLeft,
                                //   end: Alignment.centerRight,
                                // ),
                                // ),
                              ],
                            ),
                          ),
                        const Gap(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextView(
                              config: TextViewConfig(
                                text: "Transaction History",
                                fontSize: 16,
                                color: AppColors.primary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            ImageView(
                                imageConfig: ImageConfig(
                              imageURL: AppImage.filter,
                              imageType: ImageType.svg,
                            )),
                          ],
                        ),
                        Gap(
                          height: 16,
                        ),
                        if (model.isBusy)
                          TransactionSkeleton(
                            count: 2,
                          )
                        else
                          ...?model.getExpense?.data?.map((e) => HistoryHolder(
                              image: AppImage.uber,
                              month: e.month ?? "",
                              amount: e.amountSpent.toString())),
                        // HistoryHolder(
                        //   image: AppImage.uber,
                        //   month: "Uber Ride",
                        //   amount: '\$45.14',
                        // ),
                        // HistoryHolder(
                        //   image: AppImage.netflix,
                        //   month: "Netflix Account",
                        //   amount: '\$45.14',
                        // ),
                        // HistoryHolder(
                        //   image: AppImage.netflix,
                        //   month: "Netflix Account",
                        //   amount: '\$45.14',
                        // ),
                        // HistoryHolder(
                        //   image: AppImage.netflix,
                        //   month: "Netflix Account",
                        //   amount: '\$45.14',
                        // ),
                      ],
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ActionButton(
                            img: AppImage.chart,
                            caption: "Analytics",
                            color: AppColors.white,
                            textColor: AppColors.primary,
                            tap: () {},
                          ),
                          Gap(
                            width: 16,
                          ),
                          ActionButton(
                            img: AppImage.send,
                            caption: "Send Money",
                            color: AppColors.primary,
                            textColor: AppColors.white,
                            tap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SendMoneyView(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
