import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth/auth_services.dart';
import 'chat_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void signOut() {
    final authService = Provider.of<AuthService>(context, listen: false);
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chats"),
        actions: [
          IconButton(onPressed: signOut, icon: const Icon(Icons.logout))
        ],
      ),
      body: _buildUserList(),
    );
  }
}

Widget _buildUserList() {
  final currentUserEmail = FirebaseAuth.instance.currentUser?.email;
  final currentUserCollege = currentUserEmail?.split('@').last;

  return StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance.collection('users').snapshots(),
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return const Text('Error');
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return const CircularProgressIndicator(); // Show a loading indicator
      }

      final users = snapshot.data?.docs;

      return ListView.builder(
        itemCount: users?.length ?? 0,
        itemBuilder: (context, index) {
          final userData = users?[index].data() as Map<String, dynamic>;
          final userEmail = userData['email'];
          final userName = userData['name'];
          final college = userData['college'];
          if (currentUserEmail != userEmail &&
              (currentUserCollege == null ||
                  userEmail.contains(currentUserCollege))) {
            return ListTile(
              title: Text(userEmail),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatPage(
                      recieverUserEmail: userEmail,
                      recieverUserId: userData['uid'],
                      recieverUserName: userName,
                      recieverUserCollege: college,
                    ),
                  ),
                );
              },
            );
          } else {
            return Container();
          }
        },
      );
    },
  );
}
