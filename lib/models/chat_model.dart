enum MessageType { text, audio, image }

class ChatModel {
  final String content;
  final MessageType type;

  ChatModel({required this.content, required this.type});
}