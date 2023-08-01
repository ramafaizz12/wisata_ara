import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:wisata_ara/shared/style.dart';
import 'package:shimmer/shimmer.dart';
import '../../Services/Firebaseservices.dart';
import '../../bloc/MultiLanguage/translate_bloc.dart';
import '../../bloc/budaya/budaya_bloc.dart';
import '../../bloc/wisata/wisata_bloc.dart';
import '../pages/pages.dart';

part 'ContainerSplash.dart';
part 'ContainerPencarian.dart';
part 'ContainerInput.dart';
part 'DashboardHome.dart';
part 'ContainerSosialMedia.dart';
part 'ContainerDashboard.dart';
part 'ContainerARHome.dart';
part 'ContainerHomeWisata.dart';
part 'ContainerHomeUMKM.dart';
part 'ContainerWisata.dart';
part 'ContainerUMKM.dart';
part 'ContainerLoading.dart';
part 'ContainerBudaya.dart';
part 'ContainerHomeBudaya.dart';
part 'ContainerPaketWisata.dart';
part 'FormInput.dart';
part 'Imagedialog.dart';
part 'ContainerHomeLokasi.dart';
