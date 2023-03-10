import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_responsive/blocs/auth/auth_bloc.dart';
import 'package:flutter_responsive/blocs/contact/contact_bloc.dart';
import 'package:flutter_responsive/mytheme.dart';
import 'package:flutter_responsive/provider/auth.dart';
import 'package:flutter_responsive/provider/contact.dart';
import 'package:flutter_responsive/repository/auth.dart';
import 'package:flutter_responsive/repository/contact.dart';
import 'package:flutter_responsive/screens/edit_contact_screen.dart';
import 'package:flutter_responsive/screens/edit_profile_screen.dart';
import 'package:flutter_responsive/screens/extract_arguments_screen.dart';
import 'package:flutter_responsive/screens/login_screen.dart';
import 'package:flutter_responsive/screens/pass_arguments_screen.dart';
import 'package:flutter_responsive/screens/profile_screen.dart';
import 'package:flutter_responsive/screens/signup_screen.dart';
import 'package:flutter_responsive/screens/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(AuthRepository(AuthProvider()))),
        BlocProvider<ContactBloc>(
            create: (context) =>
                ContactBloc(ContactRepository(ContactProvider()))),
      ],
      child: MaterialApp(
        title: 'Find Seat',
        theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            prefixIconColor: MyTheme.splash,
            floatingLabelStyle: GoogleFonts.sono(
              textStyle: const TextStyle(
                color: MyTheme.splash,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          textTheme: TextTheme(
            headline1: GoogleFonts.dancingScript(
              textStyle: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.7),
                wordSpacing: 0,
              ),
            ),
            headline2: GoogleFonts.sono(
              textStyle: TextStyle(
                fontSize: 16,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
          ),
        ),
        initialRoute: "/",
        routes: {
          '/': (context) => const SplashScreen(),
          '/login': (context) => const LoginScreen(),
          '/signup': (context) => const SignUpScreen(),
          '/profile': (context) => const ProfileScreen(),
          '/extract_arguments': (context) => const ExtractArgumentsScreen(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == PassArgumentsScreen.routeName) {
            final args = settings.arguments as ScreenArguments;

            return MaterialPageRoute(
              builder: (context) {
                return PassArgumentsScreen(
                  title: args.title,
                  message: args.message,
                );
              },
            );
          } else if (settings.name == EditProfileScreen.routeName) {
            final args = settings.arguments as EditProfileScreen;

            return MaterialPageRoute(
              builder: (context) {
                return EditProfileScreen(
                  name: args.name,
                  email: args.email,
                  phoneNumber: args.phoneNumber,
                  address: args.address,
                );
              },
            );
          } else if (settings.name == EditContactScreen.routeName) {
            final args = settings.arguments as EditContactScreen;

            return MaterialPageRoute(
              builder: (context) {
                return EditContactScreen(
                  id: args.id,
                );
              },
            );
          }
          assert(false, 'Need to implement ${settings.name}');
          return null;
        },
      ),
    );
  }
}
