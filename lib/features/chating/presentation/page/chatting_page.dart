import 'dart:io';

import 'package:agri_shop/core/configs/themes/app_colors.dart';
import 'package:agri_shop/core/ui/text_input/widgets/text/text_widget.dart';
import 'package:agri_shop/features/chating/presentation/controller/chatting_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:get/get.dart';

class ChatPage extends StatelessWidget {
  final ChatController _controller = Get.put(ChatController());
  final TextEditingController _textEditingController = TextEditingController();

  ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          text: 'Liên hệ với cửa hàng',
          size: 18,
          color: Colors.white,
        ),
        backgroundColor: AppColors.appbarColors,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            Expanded(
              child: Obx(
                    () => ListView.builder(
                  reverse: true,
                  padding: const EdgeInsets.all(8),
                  itemCount: _controller.messages.length,
                  itemBuilder: (context, index) {
                    final message = _controller.messages[index];
                    final isMe = message.author.id == _controller.user.id;

                    return Column(
                      crossAxisAlignment:
                      isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                      children: [
                        // Hiển thị tin nhắn văn bản
                        if (message is types.TextMessage)
                          Container(
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            constraints: BoxConstraints(
                                maxWidth: MediaQuery.of(context).size.width * 0.7),
                            decoration: BoxDecoration(
                              color: isMe ? Colors.green : Colors.grey.shade300,
                              borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(12),
                                topRight: const Radius.circular(12),
                                bottomLeft:
                                isMe ? const Radius.circular(12) : Radius.zero,
                                bottomRight:
                                isMe ? Radius.zero : const Radius.circular(12),
                              ),
                            ),
                            child: Text(
                              message.text,
                              style: TextStyle(
                                color: isMe ? Colors.white : Colors.black87,
                              ),
                            ),
                          ),
                        // Hiển thị hình ảnh
                        if (message is types.ImageMessage)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth: MediaQuery.of(context).size.width * 0.7,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.file(
                                  File(message.uri),
                                  fit: BoxFit.cover,
                                  width: 200, // Kích thước của hình ảnh
                                  height: 200,
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                        fillColor: Colors.grey[200],
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.image, color: Colors.green),
                    // Nút gửi ảnh
                    onPressed: () async {
                      await _controller.sendImage();
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: Colors.green),
                    onPressed: () {
                      final text = _textEditingController.text;
                      if (text.isNotEmpty) {
                        _controller.sendMessage(text);
                        _textEditingController.clear(); // Xóa nội dung TextField sau khi gửi
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
