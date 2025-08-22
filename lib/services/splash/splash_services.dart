import 'dart:async';

import 'package:asiftaj_bloc_clean_code/config/routes/routes_name.dart';
import 'package:flutter/widgets.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(
          context, RoutesName.login, (route) => false);
    });
  }
}
