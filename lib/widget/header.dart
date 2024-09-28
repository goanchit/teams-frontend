import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
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
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                context.go("/profile");
              },
              child: const Text("Person"),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(onTap: () {}, child: const Text("Filter")),
            const SizedBox(
              width: 10,
            ),
            InkWell(onTap: () {}, child: const Text("Actions"))
          ],
        )
      ],
    );
  }
}
