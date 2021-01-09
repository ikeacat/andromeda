import 'AndromedaFile.dart';
import 'AndromedaUser.dart';

class Computer {
  String shortName;
  String fullName;
  String location; // ex. Memphis, TN, USA or Berlin, Germany
  List<AndromedaFile> filesystem;
  List<Computer> connections;

  void connect(AndromedaUser userProfile) {
    print('Please implement a login screen at the computer subclass!');
    print('Thank you!');
    userTerminal(userProfile);
  }

  void userTerminal(AndromedaUser userProfile) {
    print('Please implement a terminal at the computer subclass!');
    print('Thank you.');
  }

  Computer({String shortName, String fullName, String location});
}

class CPLogin {
  String username;
  String password;
}

enum SecurityClearance {
  owner,
  admin,
}
