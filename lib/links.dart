class ApiLinks {
  //===================Server==============
  static const String server =
      'https://waheedoofordersnow.000webhostapp.com/will_come';

  //===================Process Times==============
  static const String home = '$server/home.php';
  static const String getTimeUsers = '$server/getTimeUsers.php';

  //===================Auth=================
  static const String register = '$server/auth/signup.php';
  static const String login = '$server/auth/login.php';
  static const String verfiyCodeSignUp = '$server/auth/verfiycode.php';

  //===================Forget Password=================
  static const String checkEmail = '$server/forgetpassword/checkemail.php';
  static const String verifyCodeForgetPassword =
      '$server/forgetpassword/verifycode.php';
  static const String resetPassword =
      '$server/forgetpassword/resetpassword.php';

  //===================Process Users==============
  static const String getUsers = '$server/auth/getusers.php';

  //===================Process Times==============
  static const String addTimes = '$server/time/addtime.php';
  static const String willcome = '$server/time/willcome.php';
  static const String delete = '$server/time/delete.php';
}
