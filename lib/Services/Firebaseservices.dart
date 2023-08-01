import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wisata_ara/Models/Umkm.dart';
import 'package:wisata_ara/Models/budaya.dart';

import '../Models/PaketWisata.dart';
import '../Models/Wisata.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  static FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference collectionRef =
      FirebaseFirestore.instance.collection('Wisata');
  final picker = ImagePicker();

  Future<void> createDataWisata(
      {required String wisata,
      required String deskripsi,
      required List<XFile> gambar}) async {
    DocumentReference docRef = collectionRef.doc('WisataId');
    List<String> gambarbaru;

    gambarbaru = await uploadImagess(gambar);

    final Map<String, dynamic> newData = {
      'nama_wisata': wisata,
      'deskripsi': deskripsi,
      'gambar': gambarbaru
    };
    try {
      List<dynamic> data =
          await docRef.get().then((value) => value.get('data'));
      data.add(newData);
      await docRef.update({'data': data});
    } catch (e) {
      print('Error creating data: $e');
    }
  }

  Future<void> deleteData({
    required String documentid,
    required int index,
  }) async {
    DocumentReference docRef = collectionRef.doc(documentid);

    try {
      List<dynamic> data =
          await docRef.get().then((value) => value.get('data'));
      data.removeAt(index);
      await docRef.update({'data': data});
    } catch (e) {
      print('Error creating data: $e');
    }
  }

  Future<void> createDataBudaya(
      {required String budaya,
      required String deskripsi,
      required List<XFile> gambar}) async {
    DocumentReference docRef = collectionRef.doc('BudayaId');
    List<String> gambarbaru;

    gambarbaru = await uploadImagess(gambar);

    final Map<String, dynamic> newData = {
      'nama_budaya': budaya,
      'deskripsi': deskripsi,
      'gambar': gambarbaru
    };
    try {
      List<dynamic> data =
          await docRef.get().then((value) => value.get('data'));
      data.add(newData);
      await docRef.update({'data': data});
    } catch (e) {
      print('Error creating data: $e');
    }
  }

  Future<void> createDataUmkm(
      {required String umkm,
      required String deskripsi,
      required String telepon,
      required String lat,
      required String long,
      required List<XFile> gambar}) async {
    DocumentReference docRef = collectionRef.doc('UmkmId');
    List<String> gambarbaru;

    gambarbaru = await uploadImagess(gambar);

    final Map<String, dynamic> newData = {
      'nama_umkm': umkm,
      'deskripsi': deskripsi,
      'lat': lat,
      'long': long,
      'telepon': telepon,
      'gambar': gambarbaru
    };
    try {
      List<dynamic> data =
          await docRef.get().then((value) => value.get('data'));
      data.add(newData);
      await docRef.update({'data': data});
    } catch (e) {
      print('Error creating data: $e');
    }
  }

  Future<void> createDataPaketWisata(
      {required String paket_wisata,
      required String spot_wisata,
      required String villa,
      required String telepon,
      required String harga,
      required String fasilitas,
      required List<XFile> gambar}) async {
    DocumentReference docRef = collectionRef.doc('paket_wisata');
    List<String> gambarbaru;

    gambarbaru = await uploadImagess(gambar);

    final Map<String, dynamic> newData = {
      'nama_paket_wisata': paket_wisata,
      'spot_wisata': spot_wisata,
      'villa': villa,
      'telepon': telepon,
      'harga': harga,
      'fasilitas': fasilitas,
      'gambar': gambarbaru
    };
    try {
      List<dynamic> data =
          await docRef.get().then((value) => value.get('data'));
      data.add(newData);
      await docRef.update({'data': data});
    } catch (e) {
      print('Error creating data: $e');
    }
  }

  Future<XFile> pickImage() async {
    XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    return pickedFile!;
  }

  Future<List<XFile>> pickImages() async {
    List<XFile> pickedFile = await picker.pickMultiImage(imageQuality: 50);
    return pickedFile;
  }

  Future<User?> Signinanonymus() async {
    UserCredential result = await _auth.signInAnonymously();
    User firebaseuser = result.user!;
    return firebaseuser;
  }

  Future<User?> SigninEmail(String email, String pass) async {
    UserCredential result =
        await _auth.signInWithEmailAndPassword(email: email, password: pass);
    User firebaseuser = result.user!;
    return firebaseuser;
  }

  Future<void> Logoutanonymus() async {
    _auth.signOut();
  }

  Future<List<String>> uploadImages(List<XFile> gambar) async {
    List<String> downloadUrls = [];
    try {
      for (var file in gambar) {
        Reference storageRef = _storage.ref().child('Wisata/${file.name}');

        String downloadUrl = await storageRef.getDownloadURL();
        downloadUrls.add(downloadUrl);
      }
    } catch (e) {
      print('Error creating data: $e');
    }
    return downloadUrls;
  }

  Future<List<String>> uploadImagess(List<XFile> images) async {
    List<String> _downloadUrls = [];

    await Future.forEach(images, (image) async {
      Reference ref =
          FirebaseStorage.instance.ref().child('Wisata/${image.name}');

      final UploadTask uploadTask = ref.putFile(File(image.path));
      final TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
      final url = await taskSnapshot.ref.getDownloadURL();
      _downloadUrls.add(url);
    });

    return _downloadUrls;
  }

  Future<String> uploadImage(XFile gambar) async {
    String? downloadUrls;
    try {
      final Reference storageRef = _storage.ref().child('Wisata/');
      final UploadTask uploadTask = storageRef.putFile(File(gambar.path));
      final String downloadUrl = await storageRef.getDownloadURL();
      downloadUrls = downloadUrl;
    } catch (e) {
      print('Error creating data: $e');
    }
    return downloadUrls!;
  }

  Future<List<Budayaa>?> getdatabudaya() async {
    final DocumentReference docRef = collectionRef.doc('BudayaId');

    Iterable data = await docRef.get().then((value) => value.get('data'));

    List<Budayaa> alluser = data.map((e) => Budayaa.fromJson(e)).toList();
    return alluser;
  }

  Future<List<Umkm>?> getdataumkm() async {
    final DocumentReference docRef = collectionRef.doc('UmkmId');

    Iterable data = await docRef.get().then((value) => value.get('data'));

    List<Umkm> alluser = data.map((e) => Umkm.fromJson(e)).toList();
    return alluser;
  }

  Future<List<Wisata>?> getdatawisata() async {
    final DocumentReference docRef = collectionRef.doc('WisataId');

    Iterable data = await docRef.get().then((value) => value.get('data'));

    List<Wisata> alluser = data.map((e) => Wisata.fromJson(e)).toList();
    return alluser;
  }

  Future<List<PaketWisata>?> getdatapaketwisata() async {
    final DocumentReference docRef = collectionRef.doc('paket_wisata');

    Iterable data = await docRef.get().then((value) => value.get('data'));

    List<PaketWisata> alluser =
        data.map((e) => PaketWisata.fromJson(e)).toList();
    return alluser;
  }

  static Stream<User?> get firebaseuserstream => _auth.authStateChanges();
}
