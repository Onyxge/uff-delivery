/*
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<types.Message> _messages = [];
  final _user = const types.User(id: '82c10d2a-ba5d-471e-95ee-6fbd9739ed9a');

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: message.text,
    );

    _addMessage(textMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Support Chat'),
      ),
      body: Chat(
        messages: _messages,
        user: _user,
        onSendPressed: _handleSendPressed,
        showUserAvatars: true,
        showUserNames: true,
        inputOptions: const InputOptions(
          inputDecoration: InputDecoration(
            hintText: 'Type a message',
            border: OutlineInputBorder(),
          ),
          sendButtonIcon: Icon(Icons.send),
        ),
        theme: const ChatTheme(
          primaryColor: Colors.deepOrange,
          secondaryColor: Colors.grey,
          backgroundColor: Colors.white,
          inputBackgroundColor: Colors.white,
        ),
      )
    );
  }
}


*/