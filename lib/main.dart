import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:willcome_getx/core/services/services.dart';
import 'package:willcome_getx/initialbinding.dart';
import 'package:willcome_getx/routes.dart';
import 'package:willcome_getx/view/screens/auth_screens/register.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Project',
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyText2: TextStyle(fontWeight: FontWeight.normal,fontSize: 28)
        ),
        fontFamily: 'Cairo',
        primarySwatch: Colors.blue,
      ),
      initialBinding: InitialBinding(),
      getPages: routes,
    );
  }
}
