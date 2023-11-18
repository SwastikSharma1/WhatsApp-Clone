import 'package:chat_application/CustomUI/AvatarCard.dart';
import 'package:chat_application/CustomUI/ContactCard.dart';
import 'package:chat_application/Model/ChatModel.dart';
import 'package:flutter/material.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
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
    ),
    ChatModel(
      name: 'Swastik',
      status: "A full Stack developer",
      isGroup: false,
    ),
  ];

  List<ChatModel> group = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 8, 71, 64),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "New Group",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Add participant",
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
          ],
        ),
        body: Stack(
          children: [
            ListView.builder(
                itemCount: contacts.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Container(
                      height: group.length > 0 ? 90 : 10,
                    );
                  }
                  return InkWell(
                      onTap: () {
                        if (contacts[index - 1].select == false) {
                          setState(() {
                            contacts[index - 1].select = true;
                            group.add(contacts[index - 1]);
                          });
                        } else {
                          setState(() {
                            contacts[index - 1].select = false;
                            group.remove(contacts[index - 1]);
                          });
                        }
                      },
                      child: ContactCard(contact: contacts[index - 1]));
                }),
            group.length > 0
                ? Column(
                    children: [
                      Container(
                          height: 65,
                          color: Colors.white,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: contacts.length,
                              itemBuilder: (context, index) {
                                if (contacts[index].select == true) {
                                  return InkWell(
                                      onTap: () {
                                        setState(() {
                                          contacts[index].select = false;
                                          group.remove(contacts[index]);
                                        });
                                      },
                                      child:
                                          AvatarCard(contact: contacts[index]));
                                } else {
                                  return Container();
                                }
                              })),
                      Divider(
                        thickness: 1,
                      )
                    ],
                  )
                : Container(),
          ],
        ));
  }
}
