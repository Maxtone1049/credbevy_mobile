import 'package:credby_mobile/assets/app_colors.dart';
import 'package:credby_mobile/core/maincore/Manager/shared_preferences.dart';
import 'package:credby_mobile/core/maincore/app.locator.dart';
import 'package:credby_mobile/ui/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light));
  await setupLocator();
  await locator<SharedPreferencesService>().initilize();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: ScreenUtilInit(
        designSize: const Size(414, 781),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, __) {
          return KeyboardVisibilityProvider(
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Credbevy',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
                useMaterial3: true,
              ),
              home: const DashboardView(),
            ),
          );
        },
      ),
    );
  }
}
