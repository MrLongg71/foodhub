import 'package:flutter/material.dart';
import 'package:foodhub/src/util/themes.dart';

import 'src/util/route_generator.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: "/",
        debugShowCheckedModeBanner: false,
        theme: Themes.kDarkTheme,
        onGenerateRoute: RouteGenerator.routeAll,
        builder: (BuildContext? ctx, Widget? child) {
          return _builder(ctx!, child!);
        }
        // home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        //   builder: (BuildContext context, AuthenticationState state) {
        //     print(state);
        //     if (state is Uninitialized) {
        //       return IntroductionPage();
        //       Navigator.of(context, rootNavigator: true).pushNamed('/');
        //
        //     }
        //     if (state is Unauthenticated) {
        //       return WelcomeScreen();
        //       Navigator.of(context, rootNavigator: true).pushNamed('/');
        //     }
        //     if (state is Authenticated) {
        //       return DashboardPage();
        //       Navigator.of(context, rootNavigator: true).pushNamed('/intro');
        //     }
        //     return Container();
        //   },
        // ),
        );
  }

  Widget _builder(BuildContext context, Widget child) {
    final MediaQueryData data = MediaQuery.of(context);
    return MediaQuery(data: data.copyWith(textScaleFactor: 1), child: child);
  }
}
