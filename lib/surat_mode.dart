// To parse this JSON data, do
//
//     final suratModel = suratModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SuratModel suratModelFromJson(String str) => SuratModel.fromJson(json.decode(str));

String suratModelToJson(SuratModel data) => json.encode(data.toJson());

class SuratModel {
    final int nomor;
    final String nama;
    final String namaLatin;
    final int jumlahAyat;
    final String tempatTurun;
    final String arti;
    final String deskripsi;
    final Map<String, String> audioFull;

    SuratModel({
        required this.nomor,
        required this.nama,
        required this.namaLatin,
        required this.jumlahAyat,
        required this.tempatTurun,
        required this.arti,
        required this.deskripsi,
        required this.audioFull,
    });

    factory SuratModel.fromJson(Map<String, dynamic> json) => SuratModel(
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["namaLatin"],
        jumlahAyat: json["jumlahAyat"],
        tempatTurun: json["tempatTurun"],
        arti: json["arti"],
        deskripsi: json["deskripsi"],
        audioFull: Map.from(json["audioFull"]).map((k, v) => MapEntry<String, String>(k, v)),
    );

    Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "nama": nama,
        "namaLatin": namaLatin,
        "jumlahAyat": jumlahAyat,
        "tempatTurun": tempatTurun,
        "arti": arti,
        "deskripsi": deskripsi,
        "audioFull": Map.from(audioFull).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}
