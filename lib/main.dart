import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'app_colors.dart';
import 'providers/app_provider.dart';
import 'screens/login_screen.dart';
import 'screens/main_shell.dart';

void main() async {
  // 1. Required before native code initialization (Firebase and SharedPreferences)
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Initialize Firebase across all platforms
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // 3. Initialize your AppProvider (loads persisted login, checked majors, etc.)
  final provider = AppProvider();
  await provider.init();

  // 4. Run your app with the provider wrapping it
  runApp(
    ChangeNotifierProvider.value(value: provider, child: const JuniorHubApp()),
  );
}

class JuniorHubApp extends StatelessWidget {
  const JuniorHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JuniorHub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: kNavy,
          primary: kNavy,
          secondary: kGold,
          surface: kSurface,
        ),
        scaffoldBackgroundColor: kBackground,
        textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
      ),
      home: const _RootRouter(),
    );
  }
}

/// Sends the user to Login or MainShell depending on auth state.
class _RootRouter extends StatelessWidget {
  const _RootRouter();

  @override
  Widget build(BuildContext context) {
    final isAuthenticated = context.watch<AppProvider>().isAuthenticated;
    return isAuthenticated ? const MainShell() : const LoginScreen();
  }
}
