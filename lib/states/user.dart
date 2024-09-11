import 'package:june/june.dart';

class User {
  String firstName = 'Max';
  String lastName = 'Mustermann';
}

class UserState extends JuneState {
  User? user;
}
