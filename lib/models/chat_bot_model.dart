import 'package:karigar/screens/chat_bot.dart';

class ChatBotContent {
  String defaultText;

  ChatBotContent({required this.defaultText});
}

List<ChatBotContent> chatBotContent = [
  ChatBotContent(defaultText: 'Booking'),
  ChatBotContent(defaultText: 'Help me hire'),
  ChatBotContent(defaultText: 'What to do?'),
  ChatBotContent(defaultText: 'What can you do?'),
  ChatBotContent(defaultText: 'Fix my stuff'),
];
