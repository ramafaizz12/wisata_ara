import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:wisata_ara/UI/pages/pages.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? firebaseuser = Provider.of<User?>(context);
    return (firebaseuser == null) ? LoginPage() : InputPage();
  }
}
