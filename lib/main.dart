import 'package:flutter/material.dart';
import 'package:ventas_pinar/ventas_pinar/config/theme.dart';

import 'ventas_pinar/config/go_router.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: route,
      theme: AppTheme().appTheme(), 
    );
  }
}