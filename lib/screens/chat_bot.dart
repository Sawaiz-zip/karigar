import 'package:flutter/material.dart';
import 'package:karigar/models/chat_bot_model.dart';
import 'package:karigar/utils/assets.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({Key? key}) : super(key: key);

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  TextEditingController _messageController = TextEditingController();
  bool _change = false;
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Chatty',
          style: TextStyle(
              fontFamily: 'Angle', fontSize: 24, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(143, 127, 153, 1),
        actions: [
          IconButton(onPressed: () {}, icon: Image.asset(Assets.helpWhite))
        ],
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.center,
          children: [
            for (int index = 0; index < chatBotContent.length; index++)
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  height: 40,
                  width: 120,
                  child: Material(
                    borderRadius: BorderRadius.circular(26),
                    color: Color.fromRGBO(241, 240, 244, 1),
                    child: TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.transparent,
                          alignment: Alignment.center,
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          onSurface: Colors.transparent),
                      child: Text(
                        chatBotContent[index].defaultText,
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            height: 45,
            child: Material(
              borderRadius: BorderRadius.circular(24),
              color: Color.fromRGBO(241, 240, 244, 1),
              elevation: 20,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: SizedBox(
                        width: 250,
                        child: TextField(
                          onChanged: ((value) {
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
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(_change
                            ? Assets.sendBlack
                            : Assets.emojiCoverBlack))
                  ]),
            ),
          ),
        )
      ]),
    );
  }
}
