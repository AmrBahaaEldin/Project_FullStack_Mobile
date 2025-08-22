import 'package:chat_app/features/Chat/presentation/view/chat_view.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
   initialFireBase();
  runApp(const ChatApp());
}

Future<void> initialFireBase() async {
   await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
  );
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatView(),
    );
  }
}
