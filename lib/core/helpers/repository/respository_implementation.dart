import 'package:credby_mobile/core/helpers/model/get_all_beneficiary_res_model/get_all_beneficiary_res_model.dart';
import 'package:credby_mobile/core/helpers/model/get_balance_res_model/get_balance_res_model.dart';
import 'package:credby_mobile/core/helpers/model/get_cards_res_model/get_cards_res_model.dart';
import 'package:credby_mobile/core/helpers/model/get_expense_res_model/get_expense_res_model.dart';
import 'package:credby_mobile/core/helpers/model/send_fund_model_entity/send_fund_model_entity.dart';
import 'package:credby_mobile/core/helpers/model/send_fund_res_model/send_fund_res_model.dart';
import 'package:credby_mobile/core/maincore/app.locator.dart';
import 'package:injectable/injectable.dart';

import '../contract/Contract_implementation.dart';
import 'Respository.dart';

@lazySingleton
class AuthRepoImpl implements AuthRepo {
  final _contract = locator<AuthContractsImpl>();

  @override
  Future<GetAllBeneficiaryResModel> beneficiary() async {
    final res = await _contract.beneficiary();
    return res;
  }

  @override
  Future<GetBalanceResModel> getBalance() async {
    final res = await _contract.getBalance();
    return res;
  }

  @override
  Future<GetCardsResModel> getCards() async {
    final res = await _contract.getCards();
    return res;
  }

  @override
  Future<GetExpenseResModel> getExpense() async {
    final res = await _contract.getExpense();
    return res;
  }

  @override
  Future<SendFundResModel> sendMoney(SendFundModelEntity send) async {
    final res = await _contract.sendMoney(send);
    return res;
  }
}
