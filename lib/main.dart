// ignore_for_file: prefer_const_constructors, unused_element

import 'package:dossier/routes/Participations/indexParticipations.dart';
import 'package:dossier/services/utilController.dart';
import 'package:get/get.dart';
import 'package:dossier/routes/accueil.dart';
import 'package:dossier/services/authController.dart';
import 'package:dossier/services/contratController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:window_manager/window_manager.dart';

const String supabaseUrl = 'https://iauzdwzywquyfissqgpc.supabase.co';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Window.initialize();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = WindowOptions(
      // size: Get.size,
      center: true,
      // backgroundColor: Colors.transparent,
      skipTaskbar: false,
      windowButtonVisibility: false,
      titleBarStyle: TitleBarStyle.normal,
      title: 'Dossier');

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: dotenv.env['SUPABASE_KEY'] ?? "",
  );
  await Window.setEffect(
    effect: WindowEffect.mica,
    color: Color(0xCC222222),
  );
  Get.put(AuthController());
  Get.put(ContratController());
  Get.put(UtilController());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WindowListener {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dossier',
      initialRoute: '/', debugShowCheckedModeBanner: false,
      routes: {
        '/': (ctx) => Accueil(),
        '/participations': (ctx) => IndexParticipation(),
      },
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromARGB(255, 247, 232, 229)),
          textTheme: GoogleFonts.k2dTextTheme(),
          useMaterial3: false,
          tabBarTheme: TabBarTheme(labelColor: Colors.black),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  minimumSize:
                      MaterialStateProperty.all<Size>(Size(100, 40))))),
      // home: const Home(title: 'Dossier'),
    );
  }

  @override
  void onWindowResize() {
    print('Resize finish....');
  }

  @override
  void onWindowMove() {
    // do something
  }

  @override
  void onWindowEnterFullScreen() {
    // do something
  }
  @override
  void onWindowClose() {
    // do something
  }

  @override
  void onWindowFocus() {
    // do something
  }

  @override
  void onWindowBlur() {
    // do something
  }
}
