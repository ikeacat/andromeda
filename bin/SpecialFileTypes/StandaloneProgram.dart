import '../DefaultPrograms/TransferableProgram.dart';
import '../Essential/AndromedaFile.dart';

class StandaloneProgram extends AndromedaFile {
  TransferableProgram program;

  StandaloneProgram(String name, TransferableProgram program)
      : super.createFile(name, represents: FileRepresentation.program) {
    this.program = program;
  }
}
