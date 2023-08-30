import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome Aneeta!',
          style: TextStyle(
            color: Colors.black
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.logout)
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return ChatBubble(
                    message: 'First message',
                    alignment: index % 2 == 0 ? Alignment.centerLeft : Alignment.centerRight
                );
              }
            ),
          ),
          Container(
            height: 50,
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))
            ),
            child: Row (
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){}, icon: const Icon(Icons.add, color: Colors.white,)),
                IconButton(onPressed: (){}, icon: const Icon(Icons.send, color: Colors.white,)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
