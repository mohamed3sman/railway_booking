import 'package:chat_app/screens/chat_page.dart';
import 'package:chat_app/screens/home_page/home_page.dart';
import 'package:chat_app/screens/home_page/widgets/train_ticket.dart';
import 'package:chat_app/screens/login_page.dart';
import 'package:chat_app/screens/register_page.dart';
import 'package:chat_app/screens/search_page/homeScreen.dart';
import 'package:chat_app/screens/splash_page/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Provider/theme_changer.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => ThemeChangerProvider()),
            ],
            child: Builder(
              builder: (BuildContext context) {
                return MaterialApp(
                  theme: ThemeData(
                    brightness: Brightness.light,
                  ),
                  darkTheme: ThemeData(
                    brightness: Brightness.dark,
                  ),
                  themeMode: currentMode,
                  debugShowCheckedModeBanner: false,
                  routes: {
                    LoginPage.pageID: (context) => LoginPage(),
                    RegisterPage.pageID: (context) => RegisterPage(),
                    ChatPage.pageID: (context) => ChatPage(),
                    HomePage.pageID: (context) => HomePage(),
                    SearchPage.pageID: (context) => SearchPage(),
                    SplashScreen.pageID: (context) => SplashScreen(),
                    TrainTicketDetails.pageID: (context) =>
                        TrainTicketDetails(),
                  },
                  initialRoute: SplashScreen.pageID,
                );
              },
            ),
          );
        });
  }
}
