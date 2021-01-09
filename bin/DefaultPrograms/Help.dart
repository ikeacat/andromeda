class HelpProgram {
  String header;
  List<String> rows;
  int rowsPerPage;

  HelpProgram({String header, List<String> rows, int rowsPerPage}) {
    if (header == null) {
      this.header = 'LIST OF COMMANDS';
    } else {
      this.header = header;
    }
    this.rows = rows;
    this.rowsPerPage = rowsPerPage;
  }

  void outputdpPage(int page) {
    print(header);
    // Do the dashes under the header as a divider.
    var i;
    var matcherDashes = '';
    for (i = 0; i <= header.length; i++) {
      matcherDashes += '-';
    }
    print(matcherDashes);
    // Find the maximum possible amount of pages.
    var y = 0;
    //var actualPageMax = 0;
    while (y <= rows.length) {
      y += rowsPerPage;
      //actualPageMax += 1;
    }
    // Actually print depending on the page.
    var x;
    var indexFirst = 0;
    for (x = 0; x < page; x++) {
      indexFirst += rowsPerPage;
    }
    var indexLast = indexFirst + rowsPerPage;
    if (indexLast > rows.length - 1) {
      // For when the ceiling is hit.
      indexLast = rows.length;
    }
    //print('indexFirst ${indexFirst.toString()}');
    //print('indexLast: ${indexLast.toString()}');
    if (indexFirst > indexLast) {
      print('Page ${page + 1} does not exist.');
      return;
    }
    var z;
    for (z = indexFirst; z <= indexLast - 1; z++) {
      print(rows[z]);
    }
  }
}
