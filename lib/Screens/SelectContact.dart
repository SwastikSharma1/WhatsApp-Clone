import 'package:chat_application/CustomUI/ButtonCard.dart';
import 'package:chat_application/CustomUI/ContactCard.dart';

import 'package:chat_application/Model/ChatModel.dart';
import 'package:chat_application/Screens/CreateGroup.dart';
import 'package:flutter/material.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({super.key});

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    List<ChatModel> contacts = [
      ChatModel(
        name: 'Swastik',
        status: "A full Stack developer",
        isGroup: false,
      ),
      ChatModel(
        name: 'Aryan',
        status: "developer",
        isGroup: false,
      ),
      ChatModel(
        name: 'Sahil',
        status: "A full Stack developer",
        isGroup: false,
      ),
      ChatModel(
        name: 'Yash',
        status: "A full Stack developer",
        isGroup: false,
      )
    ];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 8, 71, 64),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select Contact",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "256 Contacts",
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.search,
                  size: 26,
                ),
                onPressed: () {}),
            PopupMenuButton<String>(onSelected: (value) {
              print(value);
            }, itemBuilder: (BuildContext contesxt) {
              return [
                const PopupMenuItem(
                  child: Text('Invite a friend'),
                  value: 'Invite a friend',
                ),
                const PopupMenuItem(
                  child: Text('Contacts'),
                  value: 'Contacts',
                ),
                const PopupMenuItem(
                  child: Text('Refresh'),
                  value: 'Refresh',
                ),
                const PopupMenuItem(
                  child: Text('Help'),
                  value: 'Help',
                ),
              ];
            })
          ],
        ),
        body: ListView.builder(
            itemCount: contacts.length + 2,
            itemBuilder: (context, index) {
              if (index == 0) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => CreateGroup()));
                  },
                  child: ButtonCard(
                    icon: Icons.group,
                    name: "New group",
                  ),
                );
              } else if (index == 1) {
                return ButtonCard(
                  icon: Icons.person_add,
                  name: "New Contact",
                );
              }
              return ContactCard(contact: contacts[index - 2]);
            }));
  }
}
