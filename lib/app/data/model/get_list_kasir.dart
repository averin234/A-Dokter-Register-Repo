class GetListKasir {
  int? code;
  String? msg;
  List<Kasir>? kasir;

  GetListKasir({this.code, this.msg, this.kasir});

  GetListKasir.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    if (json['kasir'] != null) {
      kasir = <Kasir>[];
      json['kasir'].forEach((v) {
        kasir!.add(Kasir.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    if (kasir != null) {
      data['kasir'] = kasir!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Kasir {
  int? no;
  String? noRegistrasi;
  String? namaPasien;
  String? namaKelompok;
  String? jamMasuk;
  String? jamKeluar;
  String? namaBagian;
  String? billing;
  String? JenisKlamin;
  String? NoMr;
  String? Telp;
  String? Alamat;
  String? Tmptgllhr;
  List<Harga>? harga;

  Kasir(
      {this.no,
      this.noRegistrasi,
      this.namaPasien,
      this.namaKelompok,
      this.jamMasuk,
      this.jamKeluar,
      this.namaBagian,
        this.JenisKlamin,
        this.NoMr,
      this.Telp,
        this.Alamat,
        this.Tmptgllhr,
  this.harga,
      this.billing});

  Kasir.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    noRegistrasi = json['no_registrasi'];
    namaPasien = json['nama_pasien'];
    namaKelompok = json['nama_kelompok'];
    jamMasuk = json['jam_masuk'];
    jamKeluar = json['jam_keluar'];
    namaBagian = json['nama_bagian'];
    billing = json['billing'];
    Tmptgllhr = json['tmptgllhr'];
    Telp = json['telp'];
    Alamat = json['alamat'];
    NoMr = json ['nomr'];
    JenisKlamin = json['jenisklamin'];
    if (json['harga'] != null) {
      harga = <Harga>[];
      json['harga'].forEach((v) {
        harga!.add(Harga.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['no'] = no;
    data['no_registrasi'] = noRegistrasi;
    data['nama_pasien'] = namaPasien;
    data['nama_kelompok'] = namaKelompok;
    data['jam_masuk'] = jamMasuk;
    data['jam_keluar'] = jamKeluar;
    data['nama_bagian'] = namaBagian;
    data['billing'] = billing;
    data['tmptgllhr'] = Tmptgllhr;
    data['telp'] = Telp;
    data['alamat'] = Alamat;
    data['nomr'] = NoMr;
    data['jenisklamin'] = JenisKlamin;
    if (harga != null) {
      data['harga'] = harga!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Harga {
  String? kodeBagian;
  String? namaBagian;
  String? statusSelesai;
  String? billRs;
  String? billDr1;
  String? billDr2;
  String? billDr3;
  String? billRsAskes;
  String? billDr1Askes;
  String? billDr2Askes;
  String? lainLain;

  Harga(
      {this.kodeBagian,
        this.namaBagian,
        this.statusSelesai,
        this.billRs,
        this.billDr1,
        this.billDr2,
        this.billDr3,
        this.billRsAskes,
        this.billDr1Askes,
        this.billDr2Askes,
        this.lainLain});

  Harga.fromJson(Map<String, dynamic> json) {
    kodeBagian = json['kode_bagian'];
    namaBagian = json['nama_bagian'];
    statusSelesai = json['status_selesai'];
    billRs = json['bill_rs'];
    billDr1 = json['bill_dr1'];
    billDr2 = json['bill_dr2'];
    billDr3 = json['bill_dr3'];
    billRsAskes = json['bill_rs_askes'];
    billDr1Askes = json['bill_dr1_askes'];
    billDr2Askes = json['bill_dr2_askes'];
    lainLain = json['lain_lain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kode_bagian'] = this.kodeBagian;
    data['nama_bagian'] = this.namaBagian;
    data['status_selesai'] = this.statusSelesai;
    data['bill_rs'] = this.billRs;
    data['bill_dr1'] = this.billDr1;
    data['bill_dr2'] = this.billDr2;
    data['bill_dr3'] = this.billDr3;
    data['bill_rs_askes'] = this.billRsAskes;
    data['bill_dr1_askes'] = this.billDr1Askes;
    data['bill_dr2_askes'] = this.billDr2Askes;
    data['lain_lain'] = this.lainLain;
    return data;
  }
}