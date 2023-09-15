import 'package:flutter/material.dart';
import 'package:flutter_application/entities/authorEntity.dart';
import 'package:flutter_application/entities/chatMessageEntity.dart';
import 'package:flutter_application/widgets/image_picker.dart';

class ChatInput extends StatelessWidget {
  final Function(ChatMessage) onSendMessage;
  final String username;
  ChatInput({super.key, required this.onSendMessage, required this.username});

  final chatMessageController = TextEditingController();

  void sendMessage() {
    final chatMessage = ChatMessage(
        id: '12',
        text: chatMessageController.text,
        author: Author(username: username),
        timestamp: DateTime.now().millisecondsSinceEpoch
    );

    onSendMessage(chatMessage);
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
          IconButton(onPressed: (){
            showModalBottomSheet(context: context, builder: (BuildContext context) {
              return NetworkImagePicker();
            });
          }, icon: const Icon(Icons.add, color: Colors.white,)),
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
