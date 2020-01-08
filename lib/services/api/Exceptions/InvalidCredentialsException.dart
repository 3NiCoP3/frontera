import 'ApiException.dart';

class InvalidCredentialsException extends ApiException{
  String errMsg() => 'Login ou mot de passe incorrect';
}