class GetPasienBy {
  int? code;
  String? msg;
  List<Pasien>? pasien;

  GetPasienBy({this.code, this.msg, this.pasien});

  GetPasienBy.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    if (json['pasien'] != null) {
      pasien = <Pasien>[];
      json['pasien'].forEach((v) {
        pasien!.add(Pasien.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    if (pasien != null) {
      data['pasien'] = pasien!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pasien {
  String? namaPasien;
  String? tglLhr;
  String? noHp;
  String? noMr;
  int? no;

  Pasien({this.namaPasien, this.tglLhr, this.noHp, this.noMr, this.no});

  Pasien.fromJson(Map<String, dynamic> json) {
    namaPasien = json['nama_pasien'];
    tglLhr = json['tgl_lhr'];
    noHp = json['no_hp'];
    noMr = json['no_mr'];
    no = json['no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama_pasien'] = namaPasien;
    data['tgl_lhr'] = tglLhr;
    data['no_hp'] = noHp;
    data['no_mr'] = noMr;
    data['no'] = no;
    return data;
  }
}
