import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:wisata_ara/shared/style.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'UI/pages/pages.dart';
import 'bloc/MultiLanguage/translate_bloc.dart';
import 'bloc/budaya/budaya_bloc.dart';
import 'bloc/paketwisata_bloc.dart';
import 'bloc/translatorbloc/translator_bloc.dart';
import 'bloc/umkm/umkm_bloc.dart';

import 'bloc/wisata/wisata_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BudayaBloc>(
          create: (context) => BudayaBloc(),
        ),
        BlocProvider<UmkmBloc>(
          create: (context) => UmkmBloc(),
        ),
        BlocProvider<WisataBloc>(
          create: (context) => WisataBloc(),
        ),
        BlocProvider<PaketwisataBloc>(
          create: (context) => PaketwisataBloc(),
        ),
        BlocProvider<TranslateBloc>(
          create: (context) => TranslateBloc(),
        ),
        BlocProvider<TranslatorBloc>(
          create: (context) => TranslatorBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: textpoppin.fontFamily),
        home: const SplashScreen(),
      ),
    );
  }
}
