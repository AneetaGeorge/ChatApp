import 'package:flutter/material.dart';
import 'package:flutter_application/entities/authorEntity.dart';
import 'package:flutter_application/entities/chatMessageEntity.dart';
import 'package:flutter_application/widgets/image_picker.dart';

class ChatInput extends StatefulWidget {
  final Function(ChatMessage) onSendMessage;
  final String username;
  const ChatInput({super.key, required this.onSendMessage, required this.username});

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final chatMessageController = TextEditingController();
  String selectedImageUrl = '';

  void sendMessage() {
    final chatMessage = ChatMessage(
        id: '12',
        text: chatMessageController.text,
        author: Author(username: widget.username),
        timestamp: DateTime.now().millisecondsSinceEpoch
    );

    if (selectedImageUrl.isNotEmpty) {
      chatMessage.imageUrl = selectedImageUrl;
    }

    widget.onSendMessage(chatMessage);
    setState(() {
      chatMessageController.clear();
      selectedImageUrl = '';
    });
  }

  void onImageSelected(String imageUrl) {
    setState(() {
      selectedImageUrl = imageUrl;
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))
      ),
      child: Row (
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: (){
            showModalBottomSheet(context: context, builder: (BuildContext context) {
              return NetworkImagePicker(onImageSelected: onImageSelected);
            });
          }, icon: const Icon(Icons.add, color: Colors.white,)),
           Expanded(child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               TextField(
                controller: chatMessageController,
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                minLines: 1,
                style: const TextStyle(color: Colors.white),
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  border: InputBorder.none
                ),
                ),
               if (selectedImageUrl.isNotEmpty)
                 Image.network(
                     selectedImageUrl,
                 height: 50)
             ],
           )
          ),
          IconButton(onPressed: sendMessage, icon: const Icon(Icons.send, color: Colors.white,)),
        ],
      ),
    );
  }
}
