import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userapp/Routes/set_routes.dart';

import 'package:userapp/Utils/constants.dart';

class ChatAvailbilityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: overallcolor,
          title: const Text('Chat'),
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                child: Text('Admin', style: TextStyle(color: Colors.white)),
              ),
              Tab(
                child:
                    Text('Gate Keeper', style: TextStyle(color: Colors.white)),
              ),
              Tab(
                child:
                    Text('Neighbours', style: TextStyle(color: Colors.white)),
              ),
            ],
            labelColor: Colors.white,
          ),
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 10),
                child: InkWell(child: Icon(Icons.search), onTap: () {})),
          ],
        ),
        body: TabBarView(
          children: [
            ChatsTab(),
            ChatsTab(),
            ChatsTab(),
          ],
        ),
      ),
    );
  }
}

class ChatsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: const [
            SingleChatWidget(
                chatTitle: "Bae",
                chatMessage: 'Ok good night',
                seenStatusColor: Colors.blue,
                imageUrl:
                    'https://static-koimoi.akamaized.net/wp-content/new-galleries/2020/09/maisie-williams-aka-arya-stark-of-game-of-thrones-someone-told-me-in-season-three-that-i-was-going-to-kill-the-night-king001.jpg'),
            SingleChatWidget(
                chatTitle: "Mohsin Cacha uni",
                chatMessage: 'Apply kar',
                seenStatusColor: Colors.grey,
                imageUrl:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDXCC-UB67rk0HtbmrDvVsIGvnPfTAMc_tSg&usqp=CAU'),
            SingleChatWidget(
                chatTitle: "Fwb's",
                chatMessage: 'G',
                seenStatusColor: Colors.blue,
                imageUrl:
                    'https://static3.srcdn.com/wordpress/wp-content/uploads/2017/06/Jaqen-Hghar-Game-of-Thrones.jpg'),
            SingleChatWidget(
                chatTitle: "Hamza Frnd",
                chatMessage: 'hello',
                seenStatusColor: Colors.blue,
                imageUrl:
                    'https://i.insider.com/5ce420e193a15232821d3084?width=700'),
            SingleChatWidget(
                chatTitle: "Saeed Frnd",
                chatMessage: 'Sunao kia hal ha g',
                seenStatusColor: Colors.blue,
                imageUrl:
                    'https://i.insider.com/5cb3c8e96afbee373d4f2b62?width=700'),
            SingleChatWidget(
                chatTitle: "+92 3125416407",
                chatMessage: 'Sir is product k baray ma bta dain price....',
                seenStatusColor: Colors.grey,
                imageUrl:
                    'https://static-koimoi.akamaized.net/wp-content/new-galleries/2020/09/maisie-williams-aka-arya-stark-of-game-of-thrones-someone-told-me-in-season-three-that-i-was-going-to-kill-the-night-king001.jpg'),
            SingleChatWidget(
                chatTitle: "Udemy Free & Paid Courses",
                chatMessage:
                    '+91 79809 22234748 joined using this group/s\' invite link',
                seenStatusColor: Colors.blue,
                imageUrl:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDXCC-UB67rk0HtbmrDvVsIGvnPfTAMc_tSg&usqp=CAU'),
            SingleChatWidget(
                chatTitle: "Hassan Ikram Uni...",
                chatMessage: 'Hahaahah han ye b ha',
                seenStatusColor: Colors.blue,
                imageUrl:
                    'https://i.insider.com/5cb3c8e96afbee373d4f2b62?width=700'),
          ],
        ),
      ),
    );
  }
}

class SingleChatWidget extends StatelessWidget {
  final String? chatMessage;
  final String? chatTitle;
  final Color? seenStatusColor;
  final String? imageUrl;

  const SingleChatWidget({
    
    this.chatMessage,
    this.chatTitle,
    this.seenStatusColor,
    this.imageUrl,
  }) ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

        Get.toNamed(chatscreen,arguments:chatTitle );
      },
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(imageUrl!),
          ),
          Expanded(
            child: ListTile(
              title: Text('$chatTitle',
                  style: const TextStyle(fontWeight: FontWeight.w600)),
              subtitle: Row(children: [
                Icon(
                  seenStatusColor == Colors.blue ? Icons.done_all : Icons.done,
                  size: 15,
                  color: seenStatusColor,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6.0),
                    child: Text(
                      '$chatMessage',
                      style: const TextStyle(overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ),
              ]),
            
            ),
          ),
        ],
      ),
    );
  }
}
