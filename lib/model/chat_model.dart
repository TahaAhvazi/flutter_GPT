enum ChatMessagesType { user, bot }

class ChatMessage {
  final String text;
  final ChatMessagesType chatMessagesType;
  ChatMessage({
    required this.text,
    required this.chatMessagesType,
  });
}
