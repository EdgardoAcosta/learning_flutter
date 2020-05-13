import 'package:emailapp/screens/message_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:emailapp/models/message.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MessageList extends StatefulWidget {

  final String status;

  const MessageList({ this.status = 'important'});

  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  Future<List<Message>> messages;

  @override
  void initState() {
    super.initState();
    messages = Message.browse(status:widget.status);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: messages,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return Center(
                child: SpinKitWanderingCubes(
                  color: Colors.blueAccent,
                  size: 100,
                ),
              );
            case ConnectionState.done:
              if (snapshot.hasError)
                return Text('There was an error ${snapshot.error}');
              var messages = snapshot.data;
              return ListView.separated(
                  itemCount: messages.length,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (BuildContext context, int index) {
                    Message message = messages[index];
                    return Slidable(
                      actionPane: SlidableDrawerActionPane(),
                      actionExtentRatio: 0.25,
                      actions: <Widget>[
                        IconSlideAction(
                          caption: 'Archive',
                          color: Colors.blue,
                          icon: Icons.archive,
                          onTap: () => {},
                        ),
                        IconSlideAction(
                          caption: 'Share',
                          color: Colors.indigo,
                          icon: Icons.share,
                          onTap: () => {},
                        ),
                      ],
                      secondaryActions: <Widget>[
                        IconSlideAction(
                          caption: 'More',
                          color: Colors.black45,
                          icon: Icons.more_horiz,
                          onTap: () => {},
                        ),
                        IconSlideAction(
                          caption: 'Delete',
                          color: Colors.red,
                          icon: Icons.delete,
                          onTap: () {
                            setState(() {
                              messages.removeAt(index);
                            });
                          },
                        ),
                      ],
                      child: ListTile(
                        title: Text(message.subject),
                        isThreeLine: true,
                        subtitle: Text(
                          message.body,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        leading: CircleAvatar(
                          child: Text('A'),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (BuildContext context) {
                              return MessageDetailScreen(
                                subject: message.subject,
                                body: message.body,
                              );
                            }),
                          );
                        },
                      ),
                    );
                  });
            default:
              return Center(
                child: Text('Error'),
              );
          }
        });
  }
}
