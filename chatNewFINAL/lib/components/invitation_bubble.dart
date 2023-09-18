import 'package:flutter/material.dart';

class InvitationBubble extends StatelessWidget {
  final String? date;
  final String? time;
  final String? activity;
  final bool? invitation;

  const InvitationBubble({
    Key? key,
    required this.date,
    required this.time,
    required this.activity,
    required this.invitation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color bubbleColor = invitation != null
        ? invitation == true
            ? Colors.green
            : Colors.red
        : Colors.blue;

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: bubbleColor,
      ),
      child: Column(
        children: [
          Text(
            'Activity: $activity',
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 15)),
          Text(
            'Date: $date',
            style: const TextStyle(fontSize: 15, color: Colors.white),
          ),
          Text(
            'Time: $time',
            style: const TextStyle(fontSize: 15, color: Colors.white),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 15)),
          const Text(
            'Tap the invitation for 1 seconds to accept or decline',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
