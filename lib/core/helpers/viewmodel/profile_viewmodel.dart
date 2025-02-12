// ignore_for_file: overridden_fields

import 'package:credby_mobile/core/apputils/app_ui_components.dart';
import 'package:credby_mobile/core/helpers/model/get_all_beneficiary_res_model/get_all_beneficiary_res_model.dart';
import 'package:credby_mobile/core/helpers/model/get_balance_res_model/get_balance_res_model.dart';
import 'package:credby_mobile/core/helpers/model/get_cards_res_model/get_cards_res_model.dart';
import 'package:credby_mobile/core/helpers/model/get_expense_res_model/get_expense_res_model.dart';
import 'package:credby_mobile/core/helpers/model/send_fund_model_entity/send_fund_model_entity.dart';
import 'package:credby_mobile/core/helpers/model/send_fund_res_model/send_fund_res_model.dart';
import 'package:credby_mobile/core/helpers/repository/respository_implementation.dart';
import 'package:credby_mobile/core/maincore/app.logger.dart';
import 'package:credby_mobile/ui/success_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ProfileViewmodel extends IndexTrackingViewModel {
  ProfileViewmodel({this.context});
  final BuildContext? context;
  final logger = getLogger('ProfileViewmodel');
  GlobalKey<FormState> codeKey = GlobalKey<FormState>();

  final repositoryImply = AuthRepoImpl();

  bool? _isLoading;
  bool? get isLoading => _isLoading;
  GetAllBeneficiaryResModel? _getBenefit;
  GetAllBeneficiaryResModel? get getBenefit => _getBenefit;

  Future<void> fetchBeneficiary() async {
    try {
      _isLoading = true;
      _getBenefit = await runBusyFuture(repositoryImply.beneficiary(),
          throwException: true);
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUiComponents.triggerNotification(e.toString(), error: true);
    }
    notifyListeners();
  }

  GetBalanceResModel? _balance;
  GetBalanceResModel? get balance => _balance;
  Future<void> fetchBalance() async {
    try {
      _isLoading = true;
      _balance = await runBusyFuture(repositoryImply.getBalance(),
          throwException: true);
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUiComponents.triggerNotification(e.toString(), error: true);
    }
    notifyListeners();
  }

  GetCardsResModel? _getCards;
  GetCardsResModel? get getCards => _getCards;
  Future<void> fetchCards() async {
    try {
      _isLoading = true;
      _getCards =
          await runBusyFuture(repositoryImply.getCards(), throwException: true);
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUiComponents.triggerNotification(e.toString(), error: true);
    }
    notifyListeners();
  }

  GetExpenseResModel? _getExpense;
  GetExpenseResModel? get getExpense => _getExpense;
  Future<void> fetchExpense() async {
    try {
      _isLoading = true;
      _getExpense = await runBusyFuture(repositoryImply.getExpense(),
          throwException: true);
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUiComponents.triggerNotification(e.toString(), error: true);
    }
    notifyListeners();
  }

  // Functin to send Money
  SendFundResModel? _sendFunds;
  SendFundResModel? get sendFunds => _sendFunds;
  Future<void> sendMoney(
      SendFundModelEntity sendFund, contxt, String name, String amount) async {
    try {
      _isLoading = true;
      _sendFunds = await runBusyFuture(repositoryImply.sendMoney(sendFund),
          throwException: true);
      _isLoading = false;
      Navigator.push(
          contxt,
          MaterialPageRoute(
              builder: (context) => SuccessView(
                    name: name,
                    amount: amount,
                  )));
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUiComponents.triggerNotification(e.toString(), error: true);
    }
    notifyListeners();
  }
}
