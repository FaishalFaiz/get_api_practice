import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_api_practice/surat_mode.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});
  List<SuratModel> allSurah = [];

  // get API
  Future getDataUser() async {
    final response =
        await http.get(Uri.parse("https://equran.id/api/v2/surat"));
    // json to flutter object
    final data = (jsonDecode(response.body) as Map<String, dynamic>);
    // data looping to "allSurah"
    data.forEach((element) {
      allSurah.add(SuratModel.fromJson(element));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: FutureBuilder(
          future: getDataUser(),
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: allSurah.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(allSurah[index].namaLatin),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
