import 'package:cryptox/features/auth/login/ui/login_page.dart';
import 'package:cryptox/features/auth/registration/ui/registration_page.dart';
import 'package:cryptox/features/auth/verification/ui/verification_page.dart';
import 'package:cryptox/routes/routes.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class LoginRoutes {
  static const String loginRoot = 'login/';
  static const String registration = 'login/registration';
  static const String verification = 'login/verification';
}

class LoginNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var canPop = navigatorKey.currentState!.canPop();
        if (canPop) {
          navigatorKey.currentState!.pop();
        }
        return !canPop;
      },
      child: Navigator(
        key: navigatorKey,
        initialRoute: LoginRoutes.loginRoot,
        onGenerateRoute: (RouteSettings settings) {
          late WidgetBuilder builder;
          switch (settings.name) {
            case LoginRoutes.loginRoot:
              builder = (BuildContext _) => LoginPage();
              break;
            case LoginRoutes.registration:
              String? phoneNumber = settings.arguments as String?;
              builder = (BuildContext _) => RegistrationPage(phoneNumber);
              break;
            case LoginRoutes.verification:
              builder = (BuildContext _) => VerificationPage(() {
                    Navigator.pushReplacementNamed(
                        context, PageRoutes.appNavigation);
                  });
              break;
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        },
        onPopPage: (Route<dynamic> route, dynamic result) {
          return route.didPop(result);
        },
      ),
    );
  }
}
