import 'package:ally/components/chat_bubble.dart';
import 'package:ally/components/my_text_field.dart';
import 'package:ally/services/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/invitation_bubble.dart';
import '../components/my_activity.dart';

class ChatPage extends StatefulWidget {
  final String recieverUserEmail;
  final String recieverUserId;
  final String recieverUserName;
  final String recieverUserCollege;
  const ChatPage({
    super.key,
    required this.recieverUserEmail,
    required this.recieverUserId,
    required this.recieverUserName,
    required this.recieverUserCollege,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? activity;

  String? finalDate;
  String? finalTime;
  String? finalActivity;

  bool? invitation;

  void sendInvitation(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      final pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          selectedDate = pickedDate;
          selectedTime = pickedTime;
        });

        showDialog(
          context: context, // Use the provided context here
          builder: (BuildContext dialogContext) {
            return AlertDialog(
              title: const Text('Choose an Activity'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MyActivity(
                    onActivitySelected: (selectedActivity) {
                      setState(() {
                        activity = selectedActivity;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Store the selected values as strings
                      finalDate = selectedDate
                          .toString()
                          .substring(0, selectedDate.toString().length - 13);
                      finalTime = selectedTime.toString();
                      finalActivity = activity;

                      sendMessage();

                      Navigator.of(dialogContext).pop();
                    },
                    child: const Text('Send Invitation'),
                  ),
                ],
              ),
            );
          },
        );
      }
    }
  }

  void sendMessage() async {
    await _chatService.sendMessage(
      widget.recieverUserId,
      _messageController.text,
      finalDate,
      finalTime,
      finalActivity,
    );
    _messageController.clear();

    setState(() {
      finalDate = null;
      finalTime = null;
      finalActivity = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.recieverUserName} from ${widget.recieverUserCollege}",
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildMessageList(),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    return StreamBuilder(
      stream: _chatService.getMessages(
          widget.recieverUserId, _firebaseAuth.currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading');
        }

        return ListView(
          children: snapshot.data!.docs
              .map((document) => _buildMessageItem(
                    document,
                  ))
              .toList(),
        );
      },
    );
  }

  void _showInvitationDialog() {
    Future.delayed(Duration(seconds: 1), () {
      showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: const Text('Invitation'),
            content: const Text('Do you accept the invitation?'),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    invitation = true;
                  });
                  Navigator.of(dialogContext).pop();
                },
                child: const Text('Accept'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    invitation = false;
                  });
                  Navigator.of(dialogContext).pop();
                },
                child: const Text('Decline'),
              ),
            ],
          );
        },
      );
    });
  }

  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    var alignment = (data['senderId'] == _firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    final message = data['message'];
    final date = data['selectedDate'];
    final time = data['selectedTime'];
    final activity = data['activity'];

    return GestureDetector(
      onTap: () {
        if (date != null && time != null) {
          _showInvitationDialog();
        }
      },
      child: Container(
        alignment: alignment,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment:
              (data['senderId'] == _firebaseAuth.currentUser!.uid)
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
          children: [
            Text(data['senderEmail']),
            if (date != null && time != null)
              InvitationBubble(
                activity: activity,
                date: date,
                time: time,
                invitation: invitation,
              )
            else
              ChatBubble(message: message),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return SafeArea(
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              sendInvitation(context);
            },
            icon: const Icon(
              Icons.add,
              size: 50,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
          Expanded(
            child: MyTextField(
              controller: _messageController,
              hintText: "Enter message",
              obsecureText: false,
            ),
          ),
          //const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
          IconButton(
            onPressed: sendMessage,
            icon: const Icon(
              Icons.arrow_upward,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
