import 'dart:convert';
import 'package:a_dokter_register/app/data/componen/data_regist_model.dart';
import 'package:a_dokter_register/app/data/componen/publics.dart';
import 'package:a_dokter_register/app/data/model/login_and_regist/akses_px.dart';
import 'package:a_dokter_register/app/data/model/login_and_regist/local_storage.dart';
import 'package:a_dokter_register/app/data/model/login_and_regist/token.dart';
import 'package:a_dokter_register/app/data/model/profile_pasien/data_pasien.dart';
import 'package:a_dokter_register/app/routes/app_pages.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:crypto/crypto.dart';

class API {
  static const _url = 'https://rsgading.sirs.co.id/';
  static const _baseUrl = '${_url}api/v1';
  static const _kodeKlinik = 'C00004';
  static const _getToken = '$_baseUrl/get-token.php';
  static const _getAksesPx = '$_baseUrl/px-akses.php';
  static const _postDaftarPxBaruDokter =
      '$_baseUrl/post-daftar-px-baru-dokter.php';
  static const _postDaftarPxBaruDosen =
      '$_baseUrl/post-daftar-px-baru-sosen.php';
  static const _postDaftarPxBaruMahasiswa =
      '$_baseUrl/post-daftar-px-baru-masiswa.php';

  static Future<Token> getToken() async {
    var response = await Dio().post(_getToken, data: {
      "KodeApi": "MUSA",
      "KeyApi": "@@TTWYYW",
      "KeyCode":
          "602f07f23fc390cfd4461b268f95eddfbd4fc87d9b313b64a943801b5e4c5b12"
    });
    final data = jsonDecode(response.data);
    final obj = Token.fromJson(data);
    await LocalStorages.setToken(obj);
    return obj;
  }

  static Future<AksesPX> getAksesPx(
      {required String user, required String pass}) async {
    var token = await getToken();
    String generateMd5(String input) {
      return md5.convert(utf8.encode(input)).toString();
    }

    final data = {"User": user, "Pass": generateMd5(pass)};
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
    final obj = AksesPX.fromJson(datas);
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
          fotoPasien: obj.res!.fotoPasien,
          noKtp: obj.res!.noKtp,
          namaPasien: obj.res!.namaPasien,
        ));
      }
    }
    return obj;
  }

  static Future<dynamic> postDaftarPxBaruDokter(
      {required String namaPasien,
      required String email,
      required String noKtp,
      required String jenisKelamin,
      required String tanggalLahir,
      required String noHp,
      required String alamat,
      required String alergi,
      required String golonganDarah,
      required String password}) async {
    var token = await getToken();
    final data = {
      "nama_pasien": namaPasien,
      "email": email,
      "no_ktp": noKtp,
      "jenis_kelamin": jenisKelamin,
      "tanggal_lahir": tanggalLahir,
      "no_hp": noHp,
      "alamat": alamat,
      "alergi": alergi,
      "golongan_darah": golonganDarah,
      "password": password
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
    final obj = jsonDecode(response.data);
    if (obj['msg'] == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj['code'].toString(),
        obj['msg'].toString(),
      );
    } else {
      if (obj['code'] != 200) {
        Get.snackbar(
          obj['code'].toString(),
          obj['msg'].toString(),
        );
      } else {
        await LocalStorages.setDataRegist(DataRegist(
          alamat: alamat,
          alergi: alergi,
          email: email,
          golonganDarah: golonganDarah,
          jenisKelamin: jenisKelamin,
          namaPasien: namaPasien,
          noHp: noHp,
          noKtp: noKtp,
          password: password,
          tanggalLahir: tanggalLahir,
        ));
      }
    }
    return obj;
  }

  static Future<dynamic> postDaftarPxBaruDosen(
      {required String namaPasien,
      required String email,
      required String noKtp,
      required String jenisKelamin,
      required String tanggalLahir,
      required String noHp,
      required String alamat,
      required String alergi,
      required String golonganDarah,
      required String password}) async {
    var token = await getToken();
    final data = {
      "nama_pasien": namaPasien,
      "email": email,
      "no_ktp": noKtp,
      "jenis_kelamin": jenisKelamin,
      "tanggal_lahir": tanggalLahir,
      "no_hp": noHp,
      "alamat": alamat,
      "alergi": alergi,
      "golongan_darah": golonganDarah,
      "password": password
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
    final obj = jsonDecode(response.data);
    if (obj['msg'] == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj['code'].toString(),
        obj['msg'].toString(),
      );
    } else {
      if (obj['code'] != 200) {
        Get.snackbar(
          obj['code'].toString(),
          obj['msg'].toString(),
        );
      } else {
        await LocalStorages.setDataRegist(DataRegist(
          alamat: alamat,
          alergi: alergi,
          email: email,
          golonganDarah: golonganDarah,
          jenisKelamin: jenisKelamin,
          namaPasien: namaPasien,
          noHp: noHp,
          noKtp: noKtp,
          password: password,
          tanggalLahir: tanggalLahir,
        ));
      }
    }
    return obj;
  }

  static Future<dynamic> postDaftarPxBaruMahasiswa(
      {required String namaPasien,
      required String email,
      required String noKtp,
      required String jenisKelamin,
      required String tanggalLahir,
      required String noHp,
      required String alamat,
      required String alergi,
      required String golonganDarah,
      required String password}) async {
    var token = await getToken();
    final data = {
      "nama_pasien": namaPasien,
      "email": email,
      "no_ktp": noKtp,
      "jenis_kelamin": jenisKelamin,
      "tanggal_lahir": tanggalLahir,
      "no_hp": noHp,
      "alamat": alamat,
      "alergi": alergi,
      "golongan_darah": golonganDarah,
      "password": password
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
    final obj = jsonDecode(response.data);
    if (obj['msg'] == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj['code'].toString(),
        obj['msg'].toString(),
      );
    } else {
      if (obj['code'] != 200) {
        Get.snackbar(
          obj['code'].toString(),
          obj['msg'].toString(),
        );
      } else {
        await LocalStorages.setDataRegist(DataRegist(
          alamat: alamat,
          alergi: alergi,
          email: email,
          golonganDarah: golonganDarah,
          jenisKelamin: jenisKelamin,
          namaPasien: namaPasien,
          noHp: noHp,
          noKtp: noKtp,
          password: password,
          tanggalLahir: tanggalLahir,
        ));
      }
    }
    return obj;
  }
}
