import 'package:credby_mobile/core/helpers/model/get_all_beneficiary_res_model/get_all_beneficiary_res_model.dart';
import 'package:credby_mobile/core/helpers/model/get_balance_res_model/get_balance_res_model.dart';
import 'package:credby_mobile/core/helpers/model/get_cards_res_model/get_cards_res_model.dart';
import 'package:credby_mobile/core/helpers/model/get_expense_res_model/get_expense_res_model.dart';
import 'package:credby_mobile/core/helpers/model/send_fund_model_entity/send_fund_model_entity.dart';
import 'package:credby_mobile/core/helpers/model/send_fund_res_model/send_fund_res_model.dart';

abstract class AuthContracts {

Future<SendFundResModel> sendMoney(SendFundModelEntity send);
Future<GetAllBeneficiaryResModel> beneficiary();
Future<GetCardsResModel>getCards();
Future<GetBalanceResModel>getBalance();
Future<GetExpenseResModel>getExpense();

}
