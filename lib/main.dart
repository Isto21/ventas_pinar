import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventas_pinar/ventas_pinar/config/theme.dart';
import 'package:ventas_pinar/ventas_pinar/infra/models/theme_model.dart';

import 'ventas_pinar/config/go_router.dart';

void main() => runApp(ChangeNotifierProvider(
    create:(context) => ThemeModel(), child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeModel>(context);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: route,
      theme: AppTheme().appTheme(color: themeData.color,brightness: themeData.currentTheme()),
    );
  }
}
