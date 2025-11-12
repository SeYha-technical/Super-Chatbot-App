class Message{
  String msg;
  final MessageType messageType;
  Message({required this.messageType, required this.msg});
}
enum MessageType {user,bot}