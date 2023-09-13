import 'package:flutter/material.dart';

class ChatInput extends StatelessWidget {
  ChatInput({super.key});

  final chatMessageController = TextEditingController();

  void sendMessage() {
    print('Message: ${chatMessageController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))
      ),
      child: Row (
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.add, color: Colors.white,)),
           Expanded(child: TextField(
            controller: chatMessageController,
            keyboardType: TextInputType.multiline,
            maxLines: 4,
            minLines: 1,
            style: const TextStyle(color: Colors.white),
            textCapitalization: TextCapitalization.sentences,
            decoration: const InputDecoration(
              border: InputBorder.none
            ),
            )
          ),
          IconButton(onPressed: sendMessage, icon: const Icon(Icons.send, color: Colors.white,)),
        ],
      ),
    );
  }
}
