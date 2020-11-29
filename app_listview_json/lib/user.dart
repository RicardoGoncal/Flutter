class User {
  int id;
  String corredor;

  User({this.id, this.corredor});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    corredor = json['corredor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['corredor'] = this.corredor;
    return data;
  }
}
