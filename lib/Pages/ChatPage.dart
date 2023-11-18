import 'package:chat_application/CustomUI/CustomCard.dart';
import 'package:chat_application/Model/ChatModel.dart';
import 'package:chat_application/Screens/SelectContact.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
      name: 'Swastik',
      isGroup: false,
      currentMessage: 'Hi',
      time: '4:00',
      icon: 'person.svg',
    ),
    ChatModel(
      name: 'Aryan',
      isGroup: false,
      currentMessage: 'Hi Aryan',
      time: '10:00',
      icon: 'person.svg',
    ),
    ChatModel(
      name: 'Sahil',
      isGroup: false,
      currentMessage: 'Hi Sahil',
      time: '7:00',
      icon: 'person.svg',
    ),
    ChatModel(
      name: 'Group',
      isGroup: true,
      currentMessage: 'Hi Everyone on this group',
      time: '7:00',
      icon: 'group.svg',
    ),
    ChatModel(
      name: 'Group B',
      isGroup: true,
      currentMessage: 'Hi Everyone on this group',
      time: '7:00',
      icon: 'group.svg',
    ),
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (builder) => SelectContact()));
          },
          child: Icon(Icons.chat),
        ),
        body: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (contex, index) => CustomCard(
            chatModel: chats[index],
          ),
        ));
  }
}
