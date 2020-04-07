import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class LoginProvider {
  facebookLogin() async {
    final facebookLogin = FacebookLogin();
    final result = await facebookLogin.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        print(result.accessToken.token);
        break;
      case FacebookLoginStatus.cancelledByUser:
        print('Cancelled');
        break;
      case FacebookLoginStatus.error:
        print('Error');
        break;
    }
  }
}
