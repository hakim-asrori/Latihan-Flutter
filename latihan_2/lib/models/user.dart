class User {
  final String nama;
  final String telepon;

  User({
    required this.nama,
    required this.telepon,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["nama"] = this.nama;
    data["telepon"] = this.telepon;
    return data;
  }
}