import 'AndromedaFile.dart';
import 'AndromedaUser.dart';

class Computer {
  String shortName; // like lax
  String fullName; // Like Los Angeles Airport
  String location; // ex. Memphis, TN, USA or Berlin, Germany
  List<AndromedaFile> filesystem;
  List<Computer>
      knownConnections; // Computers you can connect to. Not always two-way.
  ComputerStatus status;
  AuthStyle authenticationStyle;
  List<String>
      blacklistWhitelist; // Acts as a whitelist or a blacklist. Filled with usernames;
  List<CPLogin> accounts;
  CPLogin adminAccount;

  void connect(AndromedaUser userProfile) {
    print('Please implement a login screen at the computer subclass!');
    print('Thank you!');
    userTerminal(userProfile);
  }

  void userTerminal(AndromedaUser userProfile) {
    print('Please implement a terminal at the computer subclass!');
    print('Thank you.');
  }

  Computer(
      {String shortName,
      String fullName,
      String location,
      List<Computer> knownConnections}) {
    this.shortName = shortName;
    this.fullName = fullName;
    this.location = location;
    this.knownConnections = knownConnections;
  }
}

class CPLogin {
  String username;
  String password;
}

class Masquerade {
  // When logging in as someone else.
  String username;
  String password;
  AndromedaUser represents;

  Masquerade(AndromedaUser represents, [String username, String password]);
}

enum SecurityClearance {
  owner,
  admin,
}

enum ComputerStatus { online, offline, starting, destroyed }

enum AuthStyle {
  login,
  public,
  whitelist,
  publicblacklist,
}
