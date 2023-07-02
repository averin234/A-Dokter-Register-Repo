class DataRegist {
  String? email;
  String? password;
  String? kode;
  bool? ingatSaya;

  DataRegist({
    this.email,
    this.password,
    this.ingatSaya,
    this.kode,
  });

  DataRegist.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    kode = json['kode'];
    ingatSaya = json['ingatSaya'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['ingatSaya'] = ingatSaya;
    data['kode'] = kode;
    return data;
  }
}
