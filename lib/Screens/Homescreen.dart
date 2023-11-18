import 'package:chat_application/Pages/CameraPage.dart';
import 'package:chat_application/Pages/ChatPage.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override

  void initState(){
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 8, 71, 64),
      
      title: const Text("WhatsApp Clone"),
      
      actions: [
        IconButton(icon: const Icon(Icons.search),onPressed: (){},),
      PopupMenuButton<String>(
      onSelected:(value){
print(value);
      } ,
      itemBuilder: (BuildContext contesxt){
        return[
          const PopupMenuItem(child: Text('New group'), value:'New group' ,),
            const  PopupMenuItem(child: Text('New broadcast'), value:'New broadcast',),
               const  PopupMenuItem(child: Text('Whatsapp Web'), value:'Whatsapp Web' ,),
                  const  PopupMenuItem(child: Text('Starred message'), value:'Starred message' ,),
                    const   PopupMenuItem(child: Text('Setting'), value:'Setting' ,),
        ]; 
      })
      ],
      bottom:  TabBar(
       controller: _controller,
       indicatorColor: Colors.white,
       tabs: [
        Tab(
          icon: Icon(Icons.camera_alt),
        ),

        Tab(
          text: 'CHATS',
        ),

        Tab(
          text: 'STATUS',
        ),
        Tab(
          text: 'CALLS',
        )
       ],
      ),
    ),
    body:  TabBarView(
      controller: _controller,
      children: [
        CameraPage(),
        
ChatPage(),

        Text('Status'),
        Text('Calls'),
      ],

   
    )
    );
  }
}
