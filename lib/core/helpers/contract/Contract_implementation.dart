import 'package:credby_mobile/core/api/authApi.dart';
import 'package:credby_mobile/core/helpers/model/get_all_beneficiary_res_model/get_all_beneficiary_res_model.dart';
import 'package:credby_mobile/core/helpers/model/get_balance_res_model/get_balance_res_model.dart';
import 'package:credby_mobile/core/helpers/model/get_cards_res_model/get_cards_res_model.dart';
import 'package:credby_mobile/core/helpers/model/get_expense_res_model/get_expense_res_model.dart';
import 'package:credby_mobile/core/helpers/model/send_fund_model_entity/send_fund_model_entity.dart';
import 'package:credby_mobile/core/helpers/model/send_fund_res_model/send_fund_res_model.dart';
import 'package:credby_mobile/core/maincore/app.locator.dart';
import 'package:injectable/injectable.dart';

import 'Contract.dart';

@lazySingleton
class AuthContractsImpl implements AuthContracts {
  final _api = locator<TestApi>();

  @override
  Future<GetAllBeneficiaryResModel> beneficiary() async {
    return await _api.benefit();
  }

  @override
  Future<GetBalanceResModel> getBalance() async {
    return await _api.balance();
  }

  @override
  Future<GetCardsResModel> getCards() async {
    return await _api.cards();
  }

  @override
  Future<GetExpenseResModel> getExpense() async {
    return await _api.expense();
  }

  @override
  Future<SendFundResModel> sendMoney(SendFundModelEntity send) async {
    return await _api.sendCash(send);
  }

 
}
