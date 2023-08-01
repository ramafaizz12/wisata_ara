import 'dart:convert';

import 'package:wisata_ara/Models/Meta.dart';
import 'package:wisata_ara/Models/PaketWisata.dart';
import 'package:wisata_ara/Models/budaya.dart';

import 'package:http/http.dart' as http;

import '../Models/Umkm.dart';
import '../Models/Wisata.dart';

class Services {
  Future<List<Budayaa>?> getdatabudaya() async {
    var user = await http.get(
      Uri.parse('https://wisata-ara.taekwondosulsel.info/api/v1/get-budaya'),
    );

    Iterable data = (jsonDecode(user.body) as Map<String, dynamic>)['Data'];

    List<Budayaa> alluser = data.map((e) => Budayaa.fromJson(e)).toList();

    return alluser;
  }

  Future<List<Wisata>?> getdatawisata() async {
    var user = await http.get(
      Uri.parse(
          'https://wisata-ara.taekwondosulsel.info/api/v1/get-spot-wisata'),
    );

    Iterable data = (jsonDecode(user.body) as Map<String, dynamic>)['Data'];

    List<Wisata> alluser = data.map((e) => Wisata.fromJson(e)).toList();

    return alluser;
  }

  Future<List<Umkm>?> getdataumkm() async {
    var user = await http.get(
      Uri.parse('https://wisata-ara.taekwondosulsel.info/api/v1/get-umkm'),
    );

    Iterable data = (jsonDecode(user.body) as Map<String, dynamic>)['Data'];

    List<Umkm> alluser = data.map((e) => Umkm.fromJson(e)).toList();

    return alluser;
  }

  Future<List<PaketWisata>?> getpaketwisata() async {
    var user = await http.get(
      Uri.parse(
          'https://wisata-ara.taekwondosulsel.info/api/v1/get-paket-wisata'),
    );

    Iterable data = (jsonDecode(user.body) as Map<String, dynamic>)['Data'];

    List<PaketWisata> alluser =
        data.map((e) => PaketWisata.fromJson(e)).toList();

    return alluser;
  }
}
