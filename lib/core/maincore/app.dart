import 'package:credby_mobile/core/Network/Network_Service.dart';
import 'package:credby_mobile/core/api/authApi.dart';
import 'package:credby_mobile/core/helpers/contract/Contract_implementation.dart';
import 'package:credby_mobile/core/helpers/repository/respository_implementation.dart';
import 'package:credby_mobile/core/helpers/viewmodel/profile_viewmodel.dart';
import 'package:credby_mobile/core/maincore/Manager/shared_preferences.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    // MaterialRoute(page: DashboardView, initial: true),
    // MaterialRoute(page: Loginview),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: ProfileViewmodel),
    LazySingleton(classType: SharedPreferencesService),
    LazySingleton(classType: TestApi),
    LazySingleton(classType: NetworkService),
    LazySingleton(classType: AuthContractsImpl),
    LazySingleton(classType: AuthRepoImpl),
  ],
  logger: StackedLogger(),
)
class App {}
