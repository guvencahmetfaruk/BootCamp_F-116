import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';

void main() {
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
              // home: const ProfileView(),
              onGenerateRoute: NavigationRoute.instance.generateRoute,
            ));
      },
    );
  }
}
