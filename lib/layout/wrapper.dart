import 'package:flutter/material.dart';
import 'package:shopper/widget/header.dart';

class CommonLayout extends StatelessWidget {
  final Widget child;
  const CommonLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 80, 10, 0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Header(),
              const SizedBox(height: 20,),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
