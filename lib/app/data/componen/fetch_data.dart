import 'dart:convert';
import 'package:a_dokter_register/app/data/componen/data_regist_model.dart';
import 'package:a_dokter_register/app/data/model/login_and_regist/akses_px.dart';
import 'package:a_dokter_register/app/data/model/login_and_regist/local_storage.dart';
import 'package:a_dokter_register/app/data/model/login_and_regist/token.dart';
import 'package:a_dokter_register/app/routes/app_pages.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../model/login_and_regist/daftar_px_dokter.dart';
import '../model/login_and_regist/daftar_px_dosen.dart';
import '../model/login_and_regist/daftar_px_mahasiswa.dart';
import '../model/login_and_regist/poli.dart';

class API {
  static const _url = 'https://a-dokter.id/';
  static const _baseUrl = '${_url}api/v1';
  static const _getToken = '$_baseUrl/get-token.php';
  static const _getAksesPx = '$_baseUrl/px-akses.php';
  static const _postDaftarPxBaruDokter =
      '$_baseUrl/post-daftar-px-baru-dokter.php';
  static const _getPoli = '$_baseUrl/get-poli.php';
  static const _getSpesialisasi = '$_baseUrl/get-spesialisasi.php';
  static const _postDaftarPxBaruDosen =
      '$_baseUrl/post-daftar-px-baru-dosen.php';
  static const _postDaftarPxBaruMahasiswa =
      '$_baseUrl/post-daftar-px-baru-mahasiswa.php';
  // baru di tambah kan
  static const _getAntrianPasien = '$_baseUrl/get-antrian-pasien.php';
  static const _getDokterDetail = '$_baseUrl/get-dokter-detail.php';
  static const _getJadwalDokter = '$_baseUrl/get-jadwal-dokter.php';
  static const _getRiwayatPraktek = '$_baseUrl/get-riwayat-praktek.php';
  static const _getDataKota = '$_baseUrl/get-data-kota.php';
  static const _getID = '$_baseUrl/delete-jadwal-dokter.php';
  static const _getEditDokter = '$_baseUrl/edit-dokter.php';
  static const _getNamaPenyakit = '$_baseUrl/get-nama-penyakit.php';
  static const _getHISS = '$_baseUrl/get-soap-hiss.php';
  // static const _getTindakan = '$_baseUrl/get-tindakan-px.php';
  static const _getVitalSign = '$_baseUrl/get-vital-sign-px.php';
  // penambahan lagi
  static const _getDaftarPrivy = '$_baseUrl/daftar_privyid_dr.php';
  static const _getAddJadwalDokter = '$_baseUrl/add-jadwal-dokter.php';
  static const _postPasienBaru = '$_baseUrl/post-pasien-baru.php';
  static const _postUbahPassword = '$_baseUrl/post-ubah-password.php';
  static const _getAntrianDokter = '$_baseUrl/get-antrian-dokter.php';
  static const _getListMR = '$_baseUrl/get-list-mr.php';
  static const _cekJenisKelamin = '$_baseUrl/cek-jenis-kelamin.php';
  static const _getDataPasien = '$_baseUrl/get-data-pasien.php';
  static const _cetakResep = '$_baseUrl/cetak-resep.php';
  static const _cetakDaftarPasien = '$_baseUrl/cek-daftar-pasien.php';
  static const _getEditVitalSign = '$_baseUrl/edit-vital-sign.php';
  static const _getResep = '$_baseUrl/get-resep.php';
  static const _getObatTindakan = '$_baseUrl/get-obat-tindakan.php';
  static const _getTindakan = '$_baseUrl/get-tindakan.php';
  static const _postSoap = '$_baseUrl/post-soap.php';

  static Future<Token> getToken() async {
    var response = await Dio().post(
      _getToken,
      data: {
        "KeyCode":
            "d40f936a3c8b8d077aae49fe8046c647822f4d692891de690ea4cfb24fa27d97",
      },
    );
    final data = jsonDecode(response.data);
    final obj = Token.fromJson(data);
    await LocalStorages.setToken(obj);
    return obj;
  }

  // Tambahan Baru
  static Future<dynamic> getDaftarPrivy({
    required String kode_dokter,
  }) async {
    var token = await getToken();
    final data = {
      "kode_dokter": kode_dokter,
    };
    var response = await Dio().post(
      _getDaftarPrivy,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = AksesPx.fromJson(datas);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    } else {
      Get.back();
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }

  static Future<dynamic> getAddJadwalDokter({
    required String id_jadwal_dokter,
    required String kode_dokter,
    required String senin,
    required String selasa,
    required String rabu,
    required String kamis,
    required String jumat,
    required String sabtu,
    required String minggu,
    required String jam_awal,
    required String jam_akhir,
    required String waktu_periksa,
  }) async {
    var token = await getToken();
    final data = {
      "id_jadwal_dokter": id_jadwal_dokter,
      "kode_dokter": kode_dokter,
      "senin": senin,
      "selasa": selasa,
      "rabu": rabu,
      "kamis": kamis,
      "jumat": jumat,
      "sabtu": sabtu,
      "minggu": minggu,
      "jam_awal": jam_awal,
      "jam_akhir": jam_akhir,
      "waktu_periksa": waktu_periksa,
    };
    var response = await Dio().post(
      _getAddJadwalDokter,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = AksesPx.fromJson(datas);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    } else {
      Get.back();
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }

  static Future<dynamic> postPasienBaru({
    required String kode_dokter,
    required String nama_pasien,
    required String nasabah,
    required String id_agama,
    required String nama_keluarga,
    required String no_hp,
    required String no_ktp,
    required String id_kerja,
    required String tempat_lahir,
    required String email,
    required String tgl_lahir,
    required String jenis_kelamin,
    required String alamat,
    required String id_kawin,
    required String id_prov,
    required String id_goldar,
    required String id_kota,
    required String id_kecamatan,
    required String alergi,
    required String kode_pos,
    required String id_kelurahan,
    required String foto_pasien,
    required String no_bpjs,
    required String no_polis,
    required String id_yankes,
  }) async {
    var token = await getToken();
    final data = {
      "kode_dokter": kode_dokter,
      "nama_pasien": nama_pasien,
      "nasabah": nasabah,
      "id_agama": id_agama,
      "nama_keluarga": nama_keluarga,
      "no_hp": no_hp,
      "no_ktp": no_ktp,
      "id_kerja": id_kerja,
      "tempat_lahir": tempat_lahir,
      "email": email,
      "tgl_lahir": tgl_lahir,
      "jenis_kelamin": jenis_kelamin,
      "alamat": alamat,
      "id_kawin": id_kawin,
      "id_prov": id_prov,
      "id_goldar": id_goldar,
      "id_kota": id_kota,
      "id_kecamatan": id_kecamatan,
      "alergi": alergi,
      "kode_pos": kode_pos,
      "id_kelurahan": id_kelurahan,
      "foto_pasien": foto_pasien,
      "no_bpjs": no_bpjs,
      "no_polis": no_polis,
      "id_yankes": id_yankes,
    };
    var response = await Dio().post(
      _postPasienBaru,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = AksesPx.fromJson(datas);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    } else {
      Get.back();
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }

  static Future<dynamic> postUbahPassword({
    required String email,
    required String pw_baru,
    required String pw_lama,
  }) async {
    var token = await getToken();
    final data = {
      "email": email,
      "pw_baru": pw_baru,
      "pw_lama": pw_lama,
    };
    var response = await Dio().post(
      _postUbahPassword,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = AksesPx.fromJson(datas);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    } else {
      Get.back();
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }

  static Future<dynamic> getAntrianDokter({
    required String kode_dokter,
    required String tgl_daftar,
  }) async {
    var token = await getToken();
    final data = {
      "kode_dokter": kode_dokter,
      "tgl_daftar": tgl_daftar,
    };
    var response = await Dio().post(
      _getAntrianDokter,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = AksesPx.fromJson(datas);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    } else {
      Get.back();
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }

  static Future<dynamic> getListMR({
    required String kode_dokter,
    required String no_mr,
  }) async {
    var token = await getToken();
    final data = {
      "kode_dokter": kode_dokter,
      "no_mr": no_mr,
    };
    var response = await Dio().post(
      _getListMR,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = AksesPx.fromJson(datas);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    } else {
      Get.back();
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }

  static Future<dynamic> cekJenisKelamin({
    required String jenis_kelamin,
  }) async {
    var token = await getToken();
    final data = {
      "jenis_kelamin": jenis_kelamin,
    };
    var response = await Dio().post(
      _cekJenisKelamin,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = AksesPx.fromJson(datas);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    } else {
      Get.back();
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }

  static Future<dynamic> getDataPasien({
    required String no_mr,
    required String url,
  }) async {
    var token = await getToken();
    final data = {
      "no_mr": no_mr,
      "url": url,
    };
    var response = await Dio().post(
      _getDataPasien,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = AksesPx.fromJson(datas);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    } else {
      Get.back();
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }

  static Future<dynamic> cetakResep({
    required String no_registrasi,
  }) async {
    var token = await getToken();
    final data = {
      "no_registrasi": no_registrasi,
    };
    var response = await Dio().post(
      _cetakResep,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = AksesPx.fromJson(datas);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    } else {
      Get.back();
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }

  static Future<dynamic> cetakDaftarPasien({
    required String no_registrasi,
  }) async {
    var token = await getToken();
    final data = {
      "no_registrasi": no_registrasi,
    };
    var response = await Dio().post(
      _cetakDaftarPasien,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = AksesPx.fromJson(datas);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    } else {
      Get.back();
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }

  static Future<dynamic> getEditVitalSign({
    required String no_registrasi,
    required String keadaan_umum,
    required String kesadaran_pasien,
    required String tekanan_darah,
    required String nadi,
    required String suhu,
    required String pernapasan,
    required String tinggi_badan,
    required String berat_badan,
  }) async {
    var token = await getToken();
    final data = {
      "no_registrasi": no_registrasi,
      "keadaan_umum": keadaan_umum,
      "kesadaran_pasien": kesadaran_pasien,
      "tekanan_darah": tekanan_darah,
      "nadi": nadi,
      "suhu": suhu,
      "tinggi_badan": tinggi_badan,
      "berat_badan": berat_badan,
    };
    var response = await Dio().post(
      _getEditVitalSign,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = AksesPx.fromJson(datas);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    } else {
      Get.back();
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }

  static Future<dynamic> getResep({
    required String act,
    required String src_obat,
    required String src_racikan,
    required String id_kesediaan_obat,
  }) async {
    var token = await getToken();
    final data = {
      "act": act,
      "src_obat": src_obat,
      "src_racikan": src_racikan,
      "id_kesadiaan_obat": id_kesediaan_obat,
    };
    var response = await Dio().post(
      _getResep,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = AksesPx.fromJson(datas);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    } else {
      Get.back();
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }

  static Future<dynamic> getObatTindakan({
    required String kode_bagian,
  }) async {
    var token = await getToken();
    final data = {
      "kode_bagian": kode_bagian,
    };
    var response = await Dio().post(
      _getObatTindakan,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = AksesPx.fromJson(datas);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    } else {
      Get.back();
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }

  static Future<dynamic> postSoap({
    required String no_registrasi,
    required String objective,
    required String subjective,
    required String analyst,
  }) async {
    var token = await getToken();
    final data = {
      "no_registrasi": no_registrasi,
      "objective": objective,
      "subjective": subjective,
      "analyst": analyst,
    };
    var response = await Dio().post(
      _getTindakan,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = AksesPx.fromJson(datas);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    } else {
      Get.back();
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }

  // Batas Tambahan Baru
  static Future<dynamic> getVitalSign({
    required String no_mr,
    required String no_registrasi,
    required String no_kunjungan,
  }) async {
    var token = await getToken();
    final data = {
      "no_mr": no_mr,
      "no_registrasi": no_registrasi,
      "no_kunjungan": no_kunjungan,
    };
    var response = await Dio().post(
      _getVitalSign,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = AksesPx.fromJson(datas);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    } else {
      Get.back();
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }

  static Future<dynamic> getTindakan({
    required String kode_bagian,
  }) async {
    var token = await getToken();
    final data = {"kode_bagian": kode_bagian};
    var response = await Dio().post(
      _getTindakan,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = AksesPx.fromJson(datas);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    } else {
      Get.back();
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }

  static Future<dynamic> getHISS({
    required String ID,
  }) async {
    var token = await getToken();
    final data = {"ID": ID};
    var response = await Dio().post(
      _getHISS,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = AksesPx.fromJson(datas);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    } else {
      Get.back();
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }

  static Future<dynamic> getNamaPenyakit({
    required String src_penyakit,
  }) async {
    var token = await getToken();
    final data = {"src_penyakit": src_penyakit};
    var response = await Dio().post(
      _getNamaPenyakit,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = AksesPx.fromJson(datas);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    } else {
      Get.back();
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }

  static Future<dynamic> getEditDokter({
    required String kode_dokter,
    required String nama,
    required String nik,
    required String tgl_lhr,
    required String id_spesialisasi,
    required String id_status_dokter,
    required String kode_bagian,
    required String sip,
    required String provinsi,
    required String kota,
    required String telp,
    required String email,
    required String alamat,
    required String foto_ktp,
    required String foto_dokter,
  }) async {
    var token = await getToken();
    final data = {
      "kode_dokter": kode_dokter,
      "nama": nama,
      "nik": nik,
      "tgl_lhr": tgl_lhr,
      "id_spesialisasi": id_spesialisasi,
      "id_status_dokter": id_status_dokter,
      "kode_bagian": kode_bagian,
      "sip": sip,
      "provinsi": provinsi,
      "kota": kota,
      "telp": telp,
      "email": email,
      "alamat": alamat,
      "foto_ktp": foto_ktp,
      "foto_dokter": foto_dokter,
    };
    var response = await Dio().post(
      _getEditDokter,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = AksesPx.fromJson(datas);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    } else {
      Get.back();
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }

  static Future<dynamic> getID({
    required String id,
  }) async {
    var token = await getToken();
    final data = {"id": id};
    var response = await Dio().post(
      _getID,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = AksesPx.fromJson(datas);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    } else {
      Get.back();
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }

  static Future<dynamic> getDataKota({
    required String id,
  }) async {
    var token = await getToken();
    final data = {"id": id};
    var response = await Dio().post(
      _getDataKota,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = AksesPx.fromJson(datas);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    } else {
      Get.back();
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }

  static Future<dynamic> getRiwayatPraktek({
    required String kode_dokter,
  }) async {
    var token = await getToken();
    final data = {"kode_dokter": kode_dokter};
    var response = await Dio().post(
      _getRiwayatPraktek,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = AksesPx.fromJson(datas);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    } else {
      Get.back();
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }

  static Future<dynamic> getJadwalDokter({
    required String kode_dokter,
  }) async {
    var token = await getToken();
    final data = {"kode_dokter": kode_dokter};
    var response = await Dio().post(
      _getJadwalDokter,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = AksesPx.fromJson(datas);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    } else {
      Get.back();
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }

  static Future<dynamic> getDokterDetail({
    required String kode_dokter,
  }) async {
    var token = await getToken();
    final data = {"kode_dokter": kode_dokter};
    var response = await Dio().post(
      _getDokterDetail,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = AksesPx.fromJson(datas);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    } else {
      Get.back();
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }

  static Future<dynamic> getAntrianPasien(
      {required String tanggal,
      required String kode_dokter,
      required String jenis_layanan}) async {
    var token = await getToken();
    final data = {
      "tanggal": tanggal,
      "jenis_layanan": jenis_layanan,
      "kode_dokter": kode_dokter
    };
    var response = await Dio().post(
      _getAntrianPasien,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = AksesPx.fromJson(datas);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    } else {
      Get.back();
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }

  static Future<AksesPx> getAksesPx(
      {required String user, required String pass}) async {
    var token = await getToken();
    final data = {"User": user, "Pass": pass};
    var response = await Dio().post(
      _getAksesPx,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = AksesPx.fromJson(datas);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    } else {
      if (obj.code != 200) {
        Get.back();
        Get.snackbar(
          obj.code.toString(),
          obj.msg.toString(),
        );
      } else {
        await LocalStorages.setDataRegist(DataRegist(
          email: user,
          password: pass,
        ));
      }
    }
    return obj;
  }

  static Future<DaftarPxDokter> postDaftarPxBaruDokter(
      {required String nama,
      required String email,
      required String noHp,
      required String sip,
      required String kodeBagian}) async {
    var token = await getToken();
    final data = {
      "nama": nama,
      "no_hp": noHp,
      "email": email,
      "sip": sip,
      "kode_bagian": kodeBagian
    };
    var response = await Dio().post(
      _postDaftarPxBaruDokter,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final json = jsonDecode(response.data);
    final obj = DaftarPxDokter.fromJson(json);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    } else {
      if (obj.code != 200) {
        Get.snackbar(
          obj.code.toString(),
          obj.msg.toString(),
        );
      } else {
        await LocalStorages.setDataRegist(DataRegist(
          email: email,
          namaPasien: nama,
          noHp: noHp,
        ));
      }
    }
    return obj;
  }

  static Future<DaftarPxDosen> postDaftarPxBaruDosen(
      {required String nama,
      required String email,
      required String noHp,
      required String universitas,
      required String fakultas,
      required String noInduk}) async {
    var token = await getToken();
    final data = {
      "nama_pasien": nama,
      "email": email,
      "no_hp": noHp,
      "universitas": universitas,
      "fakultas": fakultas,
      "no_induk": noInduk,
    };
    var response = await Dio().post(
      _postDaftarPxBaruDosen,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final json = jsonDecode(response.data);
    final obj = DaftarPxDosen.fromJson(json);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    } else {
      if (obj.code != 200) {
        Get.snackbar(
          obj.code.toString(),
          obj.msg.toString(),
        );
      } else {
        await LocalStorages.setDataRegist(DataRegist(
          email: email,
          namaPasien: nama,
          noHp: noHp,
        ));
      }
    }
    return obj;
  }

  static Future<DaftarPxMahasiswa> postDaftarPxBaruMahasiswa(
      {required String nama,
      required String email,
      required String noHp,
      required String universitas,
      required String noInduk,
      required String jenjang,
      required String tahunMasuk,
      required String semester,
      required String fakultas}) async {
    var token = await getToken();
    final data = {
      "nama": nama,
      "email": email,
      "no_hp": noHp,
      "universitas": universitas,
      "no_induk_mahasiswa": noInduk,
      "jenjang_pendidikan": jenjang,
      "fakultas": fakultas,
      "tahun_masuk": tahunMasuk,
      "semester": semester
    };
    var response = await Dio().post(
      _postDaftarPxBaruMahasiswa,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final json = jsonDecode(response.data);
    final obj = DaftarPxMahasiswa.fromJson(json);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    } else {
      if (obj.code != 200) {
        Get.snackbar(
          obj.code.toString(),
          obj.msg.toString(),
        );
      } else {
        await LocalStorages.setDataRegist(DataRegist(
          email: email,
          namaPasien: nama,
          noHp: noHp,
        ));
      }
    }
    return obj;
  }

  static Future<Poli> getPoli() async {
    var token = await getToken();
    var data = {};
    var response = await Dio().post(
      _getPoli,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token ?? '',
        },
      ),
      data: data,
    );
    final obj = Poli.fromJson(jsonDecode(response.data));
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(obj.code.toString(), obj.msg.toString());
    }
    return obj;
  }
}
