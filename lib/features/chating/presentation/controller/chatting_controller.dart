import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:image_picker/image_picker.dart';

class ChatController extends GetxController {
  final _messages = <types.Message>[].obs; // Sử dụng loại Message tổng quát
  List<types.Message> get messages => _messages;

  final user = const types.User(id: 'user1'); // Người dùng chính
  final otherUser = const types.User(id: 'user2'); // Người dùng đối phương

  @override
  void onInit() {
    super.onInit();
    // Thêm một vài tin nhắn giả lập để hiển thị trên giao diện
    _messages.addAll([
      types.TextMessage(
        author: otherUser,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: '1',
        text: 'Xin chào! Cửa hàng có thể giúp gì cho bạn',
      ),
      types.TextMessage(
        author: user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: '2',
        text: 'Hello! I’m good, thanks. What about you?',
      ),
      types.TextMessage(
        author: otherUser,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: '3',
        text: 'Xin chào! Cửa hàng có thể giúp gì cho bạn',
      ),
    ]);
  }

  void sendMessage(String text) {
    final message = types.TextMessage(
      author: user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: text,
    );

    _messages.insert(0, message); // Thêm tin nhắn mới vào đầu danh sách
  }

  Future<void> sendImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery); // Hoặc ImageSource.camera để chụp ảnh

    if (pickedFile != null) {
      final message = types.ImageMessage(
        author: user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: pickedFile.name,
        uri: pickedFile.path,
        size: await File(pickedFile.path).length(),
      );

      _messages.insert(0, message); // Thêm tin nhắn ảnh mới vào đầu danh sách
    }
  }
}
