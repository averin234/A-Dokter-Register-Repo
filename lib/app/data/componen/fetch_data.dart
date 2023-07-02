import 'dart:convert';
import 'package:a_dokter_register/app/data/componen/data_regist_model.dart';
import 'package:a_dokter_register/app/data/model/list_data.dart';
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
  static const _getTindakan = '$_baseUrl/get-tindakan-px.php';
  static const _getVitalSign = '$_baseUrl/get-vital-sign-px.php';

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
    }
    return obj;
  }

  static Future<ListData> getSpesialisasi({
    required String kode_bagian,
  }) async {
    var token = await getToken();
    final data = {};
    var response = await Dio().post(
      _getSpesialisasi,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = ListData.fromJson(datas);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
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
      required String kodeSpesialis,
      required String kodeBagian}) async {
    var token = await getToken();
    final data = {
      "nama": nama,
      "no_hp": noHp,
      "email": email,
      "sip": sip,
      "kode_bagian": kodeBagian,
      "kode_spesialis": kodeSpesialis
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
