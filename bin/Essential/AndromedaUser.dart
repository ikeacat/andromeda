import '../SpecialComputers/AndromedaVM.dart';

class AndromedaUser {
  String username;
  String password;
  AndromedaVM pc;

  void toTerminal() {
    pc.userTerminal(this);
  }
}
