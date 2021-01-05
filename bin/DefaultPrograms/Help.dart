class HelpProgram {
  String header = 'LIST OF COMMANDS';
  List<String> rows;
  int rowsPerPage;

  HelpProgram({String header, List<String> rows, int rowsPerPage});

  void outputdpPage(int page) {
    print(header);
    var i;
    var matcherDashes = '';
    for (i = 0; i <= header.length; i++) {
      matcherDashes += '-';
    }
    print(matcherDashes);
    var calculatePage = rowsPerPage * page;
    var calculatePageEnd = calculatePage + rowsPerPage - 1;
    if (calculatePageEnd > rows.length) {
      calculatePageEnd = rows.length;
    }
    var b;
    for (b = calculatePage; b <= calculatePageEnd; b++) {
      print(rows[b]);
    }
  }
}
