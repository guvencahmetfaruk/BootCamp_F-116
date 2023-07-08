import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oua/view/authanticate/login/view/login_view.dart';

import 'core/init/navigation/navigation_service.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      // designSize: const Size(360, 690),
      builder: (context, child) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(
                systemNavigationBarColor: Colors.black,
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.dark),
            child: MaterialApp(
              theme: ThemeData(appBarTheme: const AppBarTheme(backgroundColor: Colors.white)),
              debugShowCheckedModeBanner: false,
              navigatorKey: NavigationService.instance.navigatorKey,
              home: const LoginView(),
              // onGenerateRoute: NavigationRoute.instance.generateRoute,
            ));
      },
    );
  }
}
