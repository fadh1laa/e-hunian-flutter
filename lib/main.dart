import 'package:flutter/material.dart';

import 'app/routes/app_routes.dart';
import 'app/theme/app_theme.dart';

void main() {
  runApp(const EHunianApp());
}

class EHunianApp extends StatelessWidget {
  const EHunianApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'e-Hunian',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      routerConfig: AppRoutes.router,
    );
  }
}
