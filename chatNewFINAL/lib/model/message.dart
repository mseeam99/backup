import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderId;
  final String senderEmail;
  final String receiverId;
  final String? message;
  final Timestamp timestamp;
  final String? selectedDate;
  final String? selectedTime;
  final String? activity;

  Message({
    required this.senderId,
    required this.senderEmail,
    required this.receiverId,
    required this.message,
    required this.timestamp,
    required this.selectedDate,
    required this.selectedTime,
    required this.activity,
  });

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'senderEmail': senderEmail,
      'receiverId': receiverId,
      'message': message,
      'timestamp': timestamp,
      'selectedDate': selectedDate,
      'selectedTime': selectedTime,
      'activity': activity,
    };
  }
}
