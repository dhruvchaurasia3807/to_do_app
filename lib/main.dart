import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_flutter_app/contants/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo_list_flutter_app/screens/auth_wrapper.dart';
import 'firebase_options.dart';
import 'package:todo_list_flutter_app/screens/home_screen.dart';
import 'package:todo_list_flutter_app/screens/login_screen.dart';
import 'providers/auth_provider.dart' as local_auth;
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         //Auth provider to handle Sign IN/Out logic
         ChangeNotifierProvider(create: (_) => local_auth.AuthProvider()),

         //Stream of User auth state changes
         StreamProvider<User?>(
          create: (context) => context.read<local_auth.AuthProvider>().user,
          initialData : null,
         ),

      ],
      child: MaterialApp(
        title: 'todo list',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: .fromSeed(
            seedColor: AppColors.primary,
            primary: AppColors.primary,
            secondary: AppColors.secondary,
            background: AppColors.background,
            surface: AppColors.surface,
            error: AppColors.error,
          ),
          scaffoldBackgroundColor: AppColors.background,
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.surface,
            foregroundColor: AppColors.textPrimary,
            elevation: 0,
            centerTitle: true,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
          inputDecorationTheme: InputDecorationThemeData(
            filled: true,
            fillColor: AppColors.surface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
          ),
        ),
        home: const AuthWrapper(),
      ),
    );
  }
}
