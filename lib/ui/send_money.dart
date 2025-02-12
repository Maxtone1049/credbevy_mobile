import 'package:credby_mobile/assets/app_colors.dart';
import 'package:credby_mobile/assets/app_image.dart';
import 'package:credby_mobile/common/Body/BodyWidget.dart';
import 'package:credby_mobile/common/Body/Model/BodyConfig.dart';
import 'package:credby_mobile/common/EditField/EditFieldView.dart';
import 'package:credby_mobile/common/EditField/Model/EditFieldConfig.dart';
import 'package:credby_mobile/common/Gap.dart';
import 'package:credby_mobile/common/Image/ImageView.dart';
import 'package:credby_mobile/common/Image/Model/ImageConfig.dart';
import 'package:credby_mobile/common/TextView/Models/TextViewConfig.dart';
import 'package:credby_mobile/common/TextView/TextView.dart';
import 'package:credby_mobile/core/apputils/Form_Validator.dart';
import 'package:credby_mobile/core/helpers/model/send_fund_model_entity/send_fund_model_entity.dart';
import 'package:credby_mobile/core/helpers/viewmodel/profile_viewmodel.dart';
import 'package:credby_mobile/core/maincore/app.locator.dart';
import 'package:credby_mobile/ui/send_money.form.dart';
import 'package:credby_mobile/ui/widget/action_button.dart';
import 'package:credby_mobile/ui/widget/trans_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@FormView(fields: [
  FormTextField(name: 'amount'),
  FormTextField(name: 'id'),
  FormTextField(name: 'reference'),
  FormTextField(name: 'name'),
])
class SendMoneyView extends StatefulWidget {
  const SendMoneyView({super.key});

  @override
  State<SendMoneyView> createState() => _SendMoneyViewState();
}

class _SendMoneyViewState extends State<SendMoneyView> with $SendMoneyView {
  String certKind = '';
  String amountFigure = '';
  void certChoose(String value) {
    setState(() {
      certKind = value;
    });
  }

  void amountChoose(String value) {
    setState(() {
      amountFigure = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewmodel>.reactive(
        disposeViewModel: false,
        onViewModelReady: (model) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            model.fetchBeneficiary();
            model.fetchBalance();
          });
        },
        onDispose: (model) => disposeForm(),
        viewModelBuilder: () => locator<ProfileViewmodel>(),
        builder: (_, model, __) {
          return BodyWidget(
              config: BodyConfig(
                  loading: model.isBusy,
                  backgroundColor: AppColors.white,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Form(
                      key: model.codeKey,
                      child: Column(
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
                                imageURL: AppImage.home,
                                imageType: ImageType.svg,
                                onTap: () => Navigator.pop(context),
                              )),
                              ImageView(
                                  imageConfig: ImageConfig(
                                imageURL: AppImage.profile,
                                imageType: ImageType.asset,
                              ))
                            ],
                          ),
                          Gap(height: 32),
                          TextView(
                            config: TextViewConfig(
                              text: "Current Balance",
                              fontSize: 15,
                              color: AppColors.primary,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          if (model.isBusy)
                            CircularProgressIndicator(
                              color: AppColors.primary,
                            )
                          else
                            TextView(
                              config: TextViewConfig(
                                text: "\$${model.balance?.data}",
                                fontSize: 26,
                                color: AppColors.primary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          Gap(
                            height: 40,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: SendHolder(
                                  img: AppImage.starfilled,
                                  caption: 'Favourites',
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: SendHolder(
                                  img: AppImage.starfilled,
                                  caption: 'All Friends',
                                ),
                              ),
                              Gap(
                                width: 15,
                              ),
                              Expanded(
                                flex: 0,
                                child: ImageView(
                                    imageConfig: ImageConfig(
                                  imageURL: AppImage.add,
                                  imageType: ImageType.svg,
                                )),
                              ),
                            ],
                          ),
                          Gap(
                            height: 32,
                          ),
                          if (model.isBusy)
                            TransactionSkeleton(count: 2)
                          else
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  ...?model.getBenefit?.data?.map(
                                    (e) => BeneficiaryHolder(
                                      color: certKind == e.fullname
                                          ? AppColors.primary
                                          : AppColors.white,
                                      iconColor: certKind == e.fullname
                                          ? AppColors.white
                                          : AppColors.primary,
                                      tap: () {
                                        certChoose('${e.fullname}');
                                        idController.text = e.id.toString();
                                        nameController.text =
                                            e.fullname.toString();
                                        print(idController.text);
                                        print(nameController.text);
                                      },
                                      caption: e.fullname.toString(),
                                      image: AppImage.walter,
                                      isSelected: certKind == '${e.fullname}',
                                      textColor: certKind == '${e.fullname}'
                                          ? AppColors.white
                                          : AppColors.primary,
                                    ),
                                  ),

                                  //
                                ],
                              ),
                            ),
                          Gap(
                            height: 24,
                          ),
                          EditFormField(
                              config: EditFieldConfig(
                            label: 'Walter white', title: 'Name',
                            controller: nameController,
                            // controller: nam
                          )),
                          Gap(
                            height: 16,
                          ),
                          EditFormField(
                              config: EditFieldConfig(
                                  label: 'How much do you want to send?',
                                  controller: amountController,
                                  validator: FieldValidator.validateString(),
                                  title: 'Amount \$')),
                          Gap(
                            height: 8,
                          ),
                          Row(
                            children: [
                              AmountInput(
                                input: '+10',
                                tap: () {
                                  amountChoose('10');
                                  amountController.text = amountFigure;
                                  print(amountController.text);
                                },
                                isSelected: amountFigure == '+10',
                              ),
                              AmountInput(
                                input: '+100',
                                tap: () {
                                  amountChoose('100');
                                  amountController.text = amountFigure;
                                  print(amountController.text);
                                },
                                isSelected: amountFigure == '+100',
                              ),
                              AmountInput(
                                input: '-10',
                                tap: () {
                                  amountChoose('10');
                                  amountController.text = amountFigure;
                                  print(amountController.text);
                                },
                                isSelected: amountFigure == '-10',
                              ),
                              AmountInput(
                                input: '-100',
                                tap: () {
                                  amountChoose('100');
                                  amountController.text = amountFigure;
                                  print(amountController.text);
                                },
                                isSelected: amountFigure == '-100',
                              ),
                            ],
                          ),
                          Gap(
                            height: 16,
                          ),
                          EditFormField(
                              config: EditFieldConfig(
                            label: 'What is this transfer for?',
                            title: 'Reference',
                          )),
                          Gap(
                            height: 16,
                          ),
                          CustomButton(
                            img: AppImage.send,
                            caption: "Send Money",
                            color: AppColors.primary,
                            textColor: AppColors.white,
                            tap: () {
                              if (model.codeKey.currentState!.validate()) {
                                model.sendMoney(
                                  SendFundModelEntity(
                                      amount:
                                          int.tryParse(amountController.text),
                                      receiverId: int.parse(idController.text)),
                                  context,
                                  nameController.text,
                                  amountController.text,
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  )));
        });
  }
}

class AmountInput extends StatelessWidget {
  const AmountInput({
    super.key,
    required this.input,
    required this.tap,
    required this.isSelected,
  });
  final String input;
  final Function() tap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        margin: EdgeInsets.only(right: 16.w),
        padding: EdgeInsets.symmetric(
          vertical: 8.h,
          horizontal: 16.w,
        ),
        decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: AppColors.black),
            borderRadius: BorderRadius.circular(24.r)),
        child: TextView(
          config: TextViewConfig(
            text: input,
            fontSize: 16,
            color: AppColors.primary,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class BeneficiaryHolder extends StatefulWidget {
  const BeneficiaryHolder({
    super.key,
    required this.color,
    required this.iconColor,
    required this.tap,
    required this.caption,
    required this.image,
    required this.isSelected,
    required this.textColor,
  });
  final Color color, iconColor, textColor;
  final Function() tap;
  final String caption, image;
  final bool isSelected;

  @override
  State<BeneficiaryHolder> createState() => _BeneficiaryHolderState();
}

class _BeneficiaryHolderState extends State<BeneficiaryHolder> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.tap,
      child: Container(
        margin: EdgeInsets.only(
          right: 24,
        ),
        padding: EdgeInsets.symmetric(
          vertical: 22.h,
          horizontal: 22.w,
        ),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 4), // changes position of shadow to bottom
          ),
        ], color: widget.color, borderRadius: BorderRadius.circular(16.r)),
        child: Column(
          children: [
            ImageView(
                imageConfig: ImageConfig(
              imageURL: widget.image,
              imageType: ImageType.asset,
            )),
            Gap(
              height: 8,
            ),
            TextView(
              config: TextViewConfig(
                text: widget.caption,
                fontSize: 16,
                color: widget.textColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            Gap(
              height: 12,
            ),
            ImageView(
                imageConfig: ImageConfig(
              imageURL: AppImage.starfilled,
              color: widget.iconColor,
              imageType: ImageType.svg,
            )),
          ],
        ),
      ),
    );
  }
}

class SendHolder extends StatelessWidget {
  const SendHolder({
    super.key,
    required this.img,
    required this.caption,
  });
  final String img, caption;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16.w),
      padding: EdgeInsets.symmetric(
        vertical: 8.h,
        horizontal: 16.w,
      ),
      decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: AppColors.black),
          borderRadius: BorderRadius.circular(24.r)),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
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
              color: AppColors.primary,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
