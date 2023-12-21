import 'package:connect_1000/UI/page_forgot.dart';
import 'package:connect_1000/UI/page_login.dart';
import 'package:connect_1000/UI/page_main.dart';
import 'package:connect_1000/UI/page_register.dart';
import 'package:connect_1000/models/profile.dart';
import 'package:connect_1000/providers/diachiviewmodel.dart';
import 'package:connect_1000/providers/forgotviewmodel.dart';
import 'package:connect_1000/providers/mainviewmodel.dart';
import 'package:connect_1000/providers/menubarviewmodel.dart';
import 'package:connect_1000/providers/profileviewmodel.dart';
import 'package:connect_1000/providers/registerviewmodel.dart';
import 'package:connect_1000/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:connect_1000/providers/loginviewmodel.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  ApiService api = ApiService();
  api.initialize();
  Profile profile = Profile();
  profile.initialize();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<LoginViewModel>(
      create: (context) => LoginViewModel(),
    ),
    ChangeNotifierProvider<RegisterViewModel>(
      create: (context) => RegisterViewModel(),
    ),
    ChangeNotifierProvider<ForgotViewmodel>(
      create: (context) => ForgotViewmodel(),
    ),
    ChangeNotifierProvider<MainViewModel>(
      create: (context) => MainViewModel(),
    ),
    ChangeNotifierProvider<MenuBarViewModel>(
      create: (context) => MenuBarViewModel(),
    ),
    ChangeNotifierProvider<ProfileViewModel>(
      create: (context) => ProfileViewModel(),
    ),
    ChangeNotifierProvider<DiachiModel>(
      create: (context) => DiachiModel(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/main': (context) => PageMain(),
        '/login': (context) => PageLogin(),
        '/register': (context) => PageRegister(),
        '/forgot': (context) => PageForgot(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(bodyMedium: TextStyle(fontSize: 16)),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: PageLogin(),
    );
  }
}
