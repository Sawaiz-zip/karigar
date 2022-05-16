import 'package:flutter/material.dart';
import 'package:karigar/screens/customer_feedback.dart';
import 'package:karigar/screens/payment.dart';

import 'package:karigar/utils/assets.dart';

class ChatBox extends StatefulWidget {
  final String name;
  const ChatBox({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  State<ChatBox> createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  TextEditingController _messageController = TextEditingController();
  String? text;
  bool _change = false;
  List<Widget> messages = [];
  @override
  void initState() {
    _messageController.addListener(() {
      if (_messageController.text.isEmpty) {
        setState(() {
          _change = false;
        });
      } else {
        setState(() {
          _change = true;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            widget.name,
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 24,
                fontWeight: FontWeight.w400),
          ),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(143, 127, 153, 1),
          actions: [
            IconButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Payment())),
                icon: Text(
                  "Pay",
                  style: TextStyle(fontFamily: 'Poppins'),
                ))
          ],
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                  child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (BuildContext context, int index) {
                  return messages[index];
                },
              )),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  height: 45,
                  child: Material(
                    borderRadius: BorderRadius.circular(24),
                    color: Color.fromRGBO(241, 240, 244, 1),
                    elevation: 20,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                            ),
                            child: SizedBox(
                              width: 250,
                              child: TextField(
                                onChanged: ((value) {
                                  text = _messageController.text;
                                  if (value.isEmpty)
                                    setState(() {
                                      _change = false;
                                    });
                                  else
                                    _change = true;
                                }),
                                controller: _messageController,
                                cursorColor: Colors.grey,
                                decoration: InputDecoration.collapsed(
                                    hintText: 'Type message',
                                    hintStyle: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300)),
                              ),
                            ),
                          ),
                          GestureDetector(
                              onTap: () {},
                              child: Image.asset(Assets.emojiCoverBlack)),
                          _change
                              ? Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _messageController.clear();
                                          writeMessage();
                                        });
                                      },
                                      child: Image.asset(Assets.sendBlack)),
                                )
                              : SizedBox(),
                        ]),
                  ),
                ),
              )
            ]),
      ),
    );
  }

  void writeMessage() {
    setState(() {
      messages.add(
        Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: Material(
                  borderRadius: BorderRadius.circular(26),
                  color: Color.fromRGBO(241, 240, 244, 1),
                  child: TextButton(
                    style: TextButton.styleFrom(
                        primary: Colors.transparent,
                        alignment: Alignment.centerLeft,
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        onSurface: Colors.transparent),
                    child: Text(
                      text!,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                    onPressed: () => {},
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
    print(messages);
  }
}
