import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:shopper/constants/constants.dart';
import 'package:shopper/layout/wrapper.dart';
import 'package:shopper/screens/auth.dart';
import 'package:shopper/screens/homepage.dart';
import 'package:shopper/screens/profile.dart';

final GoRouter defaultRouter = GoRouter(
  initialLocation: "/",
  redirect: (context, state) async {
    const FlutterSecureStorage storage = FlutterSecureStorage();
    final token = await storage.read(key: accessToken);
    if (token == null) {
      return "/";
    }
    return null;
  },
  routes: [
    GoRoute(path: "/", name: "login", builder: (context, state) => AuthScreen()),
    GoRoute(path: "/home", name: "home", builder: (context, state) => const CommonLayout(child: Homepage()),),
    GoRoute(path: "/profile", name: "profile", builder: (context, state) => const CommonLayout(child: Profile()),),
  ],
);