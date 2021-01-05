class AndromedaFile {
  String name; // Ex. example.txt
  List<String> contents;
  FileRepresentation representation;

  int get amountOfLines {
    var returns;
    if (representation == FileRepresentation.plaintext) {
      returns = contents.length;
    } else if (representation == FileRepresentation.program) {
      returns = 1;
    }
    return returns;
  }

  AndromedaFile();
  AndromedaFile.createFile(String name,
      {List<String> contents,
      FileRepresentation represents = FileRepresentation.plaintext});

  AndromedaFile.createPlaintext(String name, List<String> contents) {
    this.name = name;
    this.contents = contents;
    representation = FileRepresentation.plaintext;
  }
}

enum FileRepresentation { plaintext, program }
