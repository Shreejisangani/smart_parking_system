import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_parking/pages/homepage.dart';
import 'package:smart_parking/pages/loginpage.dart';
import 'package:smart_parking/utils/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Parking System',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 253, 220, 52),
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      // home: GoogleMapScreen(),
      initialRoute: MyRoutes.homepage, // home bydefault hase start ma
      routes: {
        //ghana page hoy ane mate and koi webiste mathi lava mate pn use thay
        "/": (context) => const HomePage(),
        MyRoutes.homepage: (context) => const HomePage(),
        MyRoutes.loginpage: (context) => const LoginPage(),
      },
    );
  }
}
