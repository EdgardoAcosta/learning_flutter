import 'package:emailapp/services/networking.dart';
import 'package:json_annotation/json_annotation.dart';
part 'message.g.dart';

@JsonSerializable()
class Message {
  final String subject;
  final String body;

  Message(this.subject, this.body);

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  static Future<List<Message>> brows() async {
    NetworkHelper messagesList =
        NetworkHelper('http://www.mocky.io/v2/5da25fab2f00006600f41947');
    List collation = await messagesList.getData();
    if (collation == null) {
      print('Error on request');
      //TODO:Handel error for user
    }

    // String content = await rootBundle.loadString('data/messages.json');
    List<Message> _messages =
        collation.map((json) => Message.fromJson(json)).toList();

    return _messages;
  }
}
