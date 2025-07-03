class Database {
  Database({this.title, this.category, this.checked = false,this.enable = false,this.hintKeyword});

  String? title;
  String? category;
  bool checked;
  bool enable;
  String? hintKeyword="โปรดระบุ";
}

class AllDatabase {
  AllDatabase({this.innerDbs, this.outerDbs});

  List<Database>? innerDbs;
  List<Database>? outerDbs;
}