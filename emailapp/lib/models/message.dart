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

  static Future<List<Message>> browse({status = 'important'}) async {

    String url = (status == 'important') ? 'http://www.mocky.io/v2/5da4d12835000060004a7913' : 'http://www.mocky.io/v2/5da25fab2f00006600f41947';
    NetworkHelper messagesList =
        NetworkHelper(url);
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
