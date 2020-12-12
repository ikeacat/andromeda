import 'dart:io';
import 'dart:convert';
import 'package:dart_console/dart_console.dart';

const version = '1.0-pr';

class Profile {
  String name;
  String password;
  bool
      canLoginTo; // Can the user login to this? Will be ignored if it is a UserProfile.

  Profile();

  Profile.quickSetup(this.name, this.password, this.canLoginTo) {
    name = name;
    canLoginTo = canLoginTo;
    password = password;
  }
}

enum ProfileSaveReturn { success, error }

class UserProfile extends Profile {
  String playerFirstName;
  bool internetStatus = false;
  List<GenericComputer> connections;
  String realPath;

  ProfileSaveReturn saveSelf() {}

  ProfileSaveReturn loadSave() {}

  UserProfile();

  UserProfile.newUser(name, password, canLoginTo, this.playerFirstName) {
    super.name = name;
    super.password = password;
    super.canLoginTo = canLoginTo;
    playerFirstName = playerFirstName;
  }

  void morningMeeting() {
    // This is where the user goes for the console.
    print('Good Morning, $playerFirstName!');
    print("Type 'help' for a list of commands.");
    while (true) {
      var consoleInput = userInput('\n$name@AndromedaVM# ');
      var consoleInSplit = consoleInput.split(' ');
      if (consoleInSplit[0].startsWith('help')) {
        doSleepSync(1);
        slowPrintOut([
          "AndromedaOS's List of Commands",
          '----------------------------',
          'help: View this list of commands.',
          'about: Get system version & check component statuses.',
          'shutdown: Shutdown the VM.',
          'connections: Get a list of connections & useful info for each.',
          'ssh [shortname]: Connect to an external computer.',
          'clear: Clear the screen.'
        ], optionalTime: 280);
      } else if (consoleInSplit[0].startsWith('about')) {
        doSleepSync(1);
        slowPrintOut([
          'AndromedaOS $version',
          '(C) 2020 Andromeda Corp.',
          'All Rights Reserved.',
          'Getting Device statuses...'
        ], optionalTime: 280);
        doSleepSync(3);
        String intString;
        if (internetStatus == true) {
          intString = 'Ok';
        } else {
          intString = 'OFFLINE';
        }
        slowPrintOut(['KEYBOARD: Ok', 'INTERNET: $intString'],
            optionalTime: 280);
      } else if (consoleInSplit[0].startsWith('clear')) {
        doSleepSync(500, unit: 'ms');
        _Console.cs();
      } else if (consoleInSplit[0].startsWith('shutdown')) {
        doSleepSync(500, unit: 'ms');
        print('Shutting Down...');
        print('Thank you for your service.');
        doSleepSync(2);
        exit(0);
      } else {
        illegalCommand();
      }
    }
  }
}

void illegalCommand() {
  doSleepSync(1);
  print('Illegal command.');
}

class GenericComputer {
  // The base for a computer.
  String id; // Short name.
  String longName;
  List<File> filesystem;
  bool computerIsPublic;
  UserAccessLevel uac; // Is disregarded if computerIsPublic is true.

}

enum UserAccessLevel { noaccess, readonly, readwrite, admin }

class File {
  String name;
  FileContentMode fcm;
  List<String> contents; // Each string should be a line.
  ProgramEquivalent programEquiv;
}

enum FileContentMode { realContents, binary, encrypted }
enum ProgramEquivalent { helloworld }

class _Console {
  static final realConsole = Console();

  static void cs() {
    realConsole.clearScreen();
  }
}

void main(List<String> arguments) {
  print('Andromeda');
  print('<3 ikeacat');
  doSleepSync(2);
  var userProfile = profileCreator();
  _Console.cs();
  userProfile.morningMeeting();
}

UserProfile profileCreator() {
  UserProfile userProfile;
  _Console.cs();
  doSleepSync(2);
  print("Dialing to 'ANDROMEDA HACKING SERVER'.");
  doSleepSync(3);
  _Console.cs();
  doSleepSync(1);
  print("Welcome to Andromeda Research's hacking team!");
  doSleepSync(300, unit: 'ms');
  print('Once you make a profile, it cannot be undone!\n');
  doSleepSync(300, unit: 'ms');
  var un = userInput('Username: ');
  doSleepSync(2);
  var pw = userInput('Password: ');
  doSleepSync(2);
  var rn = userInput('First Name: ');
  print('Please wait while we make your profile :)');
  userProfile = UserProfile.newUser(un, pw, false, rn);
  doSleepSync(4);
  return userProfile;
}

String userInput([String preString]) {
  if (preString != null) {
    stdout.write(preString);
  }
  var readIn = stdin.readLineSync(encoding: Encoding.getByName('utf-8'));
  return readIn;
}

void doSleepSync(int time, {String unit = 'secs'}) {
  if (unit == 'secs') {
    sleep(Duration(seconds: time));
  } else if (unit == 'ms') {
    sleep(Duration(milliseconds: time));
  }
}

void slowPrintOut(List<String> strs,
    {int optionalTime = 500, String unit = 'ms'}) {
  for (var i = 0; i <= strs.length - 1; i++) {
    if (unit == 'ms') {
      doSleepSync(optionalTime, unit: unit);
    } else if (unit == 'secs') {
      doSleepSync(optionalTime); // Default is secs in doSleepSync.
    }
    print(strs[i]);
  }
}
