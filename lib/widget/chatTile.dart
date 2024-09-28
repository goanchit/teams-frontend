import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  final int tileIdx;
  const ChatTile({super.key, required this.tileIdx});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.blue), height: 50, width: 50, child: const SizedBox(),),
              const SizedBox(width: 20,),
              Text("Text Message highlight: $tileIdx")
            ],
          ),
          const Text("current time stamp"),
        ],
      ),
    );
  }
}