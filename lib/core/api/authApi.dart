import 'package:credby_mobile/core/Network/Network_Service.dart';
import 'package:credby_mobile/core/Network/UrlPath.dart';
import 'package:credby_mobile/core/helpers/model/get_all_beneficiary_res_model/get_all_beneficiary_res_model.dart';
import 'package:credby_mobile/core/helpers/model/get_balance_res_model/get_balance_res_model.dart';
import 'package:credby_mobile/core/helpers/model/get_cards_res_model/get_cards_res_model.dart';
import 'package:credby_mobile/core/helpers/model/get_expense_res_model/get_expense_res_model.dart';
import 'package:credby_mobile/core/helpers/model/send_fund_model_entity/send_fund_model_entity.dart';
import 'package:credby_mobile/core/helpers/model/send_fund_res_model/send_fund_res_model.dart';
import 'package:credby_mobile/core/maincore/app.locator.dart';
import 'package:credby_mobile/core/maincore/app.logger.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class TestApi {
  final logger = getLogger('TestApi');
  final _service = locator<NetworkService>();

  Future<SendFundResModel> sendCash(SendFundModelEntity sendFund) async {
    try {
      final response = await _service.call(
          UrlConfig.transferFunds, RequestMethod.post,
          data: sendFund.toJson());
      return SendFundResModel.fromJson(response.data);
    } catch (e) {
      logger.d("This is an error $e");
      rethrow;
    }
  }

  Future<GetAllBeneficiaryResModel> benefit() async {
    try {
      final response = await _service.call(
        UrlConfig.getbeneficiaries,
        RequestMethod.get,
      );
      return GetAllBeneficiaryResModel.fromJson(response.data);
    } catch (e) {
      logger.d("This is an error $e");
      rethrow;
    }
  }

  Future<GetCardsResModel> cards() async {
    try {
      final response = await _service.call(
        UrlConfig.getCards,
        RequestMethod.get,
      );
      return GetCardsResModel.fromJson(response.data);
    } catch (e) {
      logger.d("This is an error $e");
      rethrow;
    }
  }

  Future<GetBalanceResModel> balance() async {
    try {
      final response = await _service.call(
        UrlConfig.getbalance,
        RequestMethod.get,
      );
      return GetBalanceResModel.fromJson(response.data);
    } catch (e) {
      logger.d("This is an error $e");
      rethrow;
    }
  }

  Future<GetExpenseResModel> expense() async {
    try {
      final response = await _service.call(
        UrlConfig.getmyexpenses,
        RequestMethod.get,
      );
      return GetExpenseResModel.fromJson(response.data);
    } catch (e) {
      logger.d("This is an error $e");
      rethrow;
    }
  }
}
