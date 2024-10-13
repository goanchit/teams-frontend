import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget userInformation() {
  return Container(
    padding: const EdgeInsets.all(16.0),
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Name", textAlign: TextAlign.start),
        SizedBox(height: 20),
        Text("Status"),
        SizedBox(height: 20),
      ],
    ),
  );
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Container(
              decoration:
                  const BoxDecoration(shape: BoxShape.circle, color: Colors.amber),
              height: 60,
              width: 60,
            )),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              thickness: 2,
              color: Colors.black38,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  userInformation(),
                  Center(
                    child: FloatingActionButton(
                      onPressed: () {},
                      child: const Text("Save"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
