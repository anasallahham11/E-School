
import '../../../models/login_model.dart';

abstract class SchoolLoginStates {}

class SchoolLoginInitialState extends SchoolLoginStates{}

class SchoolLoginLoadingState extends SchoolLoginStates{}

class SchoolLoginSuccessState extends SchoolLoginStates{
  final LoginModel loginModel;
  SchoolLoginSuccessState(this.loginModel);
}

class SchoolLoginErrorState extends SchoolLoginStates{
  final String error;
  SchoolLoginErrorState(this.error);
}
class SchoolLoginChangePasswordVisibilityState extends SchoolLoginStates{}

