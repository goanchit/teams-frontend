import 'package:go_router/go_router.dart';
import 'package:shopper/layout/wrapper.dart';
import 'package:shopper/screens/homepage.dart';
import 'package:shopper/screens/profile.dart';

final defaultRouter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(path: "/", name: "home", builder: (context, state) => const CommonLayout(child: Homepage()),),
    GoRoute(path: "/profile", name: "profile", builder: (context, state) => const CommonLayout(child: const Profile()),),
  ]
);