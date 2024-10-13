import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shopper/constants/constants.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final currentPath = GoRouter.of(context).routeInformationProvider.value.uri;
    final bool isBaseRoute = currentPath.toString() == "/home";
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        isBaseRoute
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "Chat",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                  )
                ],
              )
            : Center(
                child: InkWell(
                  onTap: () {
                    context.pop();
                  },
                  child: SvgPicture.asset(
                    backIcon,
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                context.push("/profile");
              },
              child: SvgPicture.asset(
                addPeople,
                height: 30,
                width: 30,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                context.push("/profile");
              },
              child: SvgPicture.asset(
                profileIcon,
                height: 20,
                width: 20,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
                onTap: () async {
                  const FlutterSecureStorage storage = FlutterSecureStorage();
                  await storage.delete(key: accessToken);
                  if (context.mounted) {
                    context.go("/");
                  }
                },
                child: SvgPicture.asset(
                  logout,
                  height: 20,
                  width: 20,
                ))
          ],
        )
      ],
    );
  }
}
