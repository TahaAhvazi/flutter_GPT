import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:realaiapp/constant.dart';
import 'package:realaiapp/model/chat_model.dart';
import 'package:realaiapp/routes/side_menu.dart';
import 'package:realaiapp/widgets/alert_dialog.dart';
import 'package:realaiapp/widgets/appbarTitle.dart';
import 'package:realaiapp/widgets/chat_message_widget.dart';
import 'package:realaiapp/widgets/questions.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isChating = false;
  bool isLoading = false;
  final _scrollController = ScrollController();
  final TextEditingController _textEditingController = TextEditingController();
  final _focosNode = FocusNode();
  final List<ChatMessage> _chatMessages = [];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Future<String> reciveMessageFromBot(String prompt) async {
      const apiKey = apiSecretKey;

      var url = Uri.https("api.openai.com", "/v1/completions");
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          "Authorization": "Bearer $apiKey"
        },
        body: json.encode({
          "model": "text-davinci-003",
          "prompt": prompt,
          'temperature': 0,
          'max_tokens': 2000,
          'top_p': 1,
          'frequency_penalty': 0.0,
          'presence_penalty': 0.0,
        }),
      );
      Map<String, dynamic> newresponse = jsonDecode(response.body);

      return newresponse['choices'][0]['text'];
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        toolbarHeight: MediaQuery.of(context).size.height *
            0.1, //108  was what in figma desing, But i make it Responsive UI,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              child: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onTap: () => Navigator.of(context).push(_navigateSideMenu()),
            ),
            const AppBarTitle()
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 16, right: 15),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              isChating
                  ? SizedBox(
                      height: height * 60 / 100,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        controller: _scrollController,
                        itemCount: _chatMessages.length,
                        itemBuilder: (context, index) {
                          var message = _chatMessages[index];
                          return ChatMessagesWidget(
                            text: message.text,
                            chatMessagesType: message.chatMessagesType,
                          );
                        },
                      ),
                    )
                  : const Questions(),
              const SizedBox(
                height: 3,
              ),
              Align(
                alignment: Alignment.center,
                child: Visibility(
                    visible: isLoading,
                    child: const CircularProgressIndicator()),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: height * .05),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: GestureDetector(
                      onTap: () {
                        _showAlertDialog(context);
                      },
                      child: Visibility(
                        visible: !isLoading,
                        child: Image.asset(
                          "assets/sub.png",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 53,
                    width: width * 80 / 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: TextField(
                        focusNode: _focosNode,
                        textCapitalization: TextCapitalization.sentences,
                        controller: _textEditingController,
                        onSubmitted: (value) async {
                          setState(() {
                            isChating = true;
                            Future.delayed(const Duration(milliseconds: 100))
                                .then((value) {
                              isLoading = true;
                              _chatMessages.add(
                                ChatMessage(
                                    text: _textEditingController.text,
                                    chatMessagesType: ChatMessagesType.user),
                              );
                              var userQuestion = _textEditingController.text;
                              _textEditingController.clear();
                              Future.delayed(const Duration(milliseconds: 50))
                                  .then((value) => _scrollDown());

                              reciveMessageFromBot(userQuestion).then((value) {
                                setState(() {
                                  isLoading = false;
                                  _chatMessages.add(
                                    ChatMessage(
                                        text: value.toString(),
                                        chatMessagesType: ChatMessagesType.bot),
                                  );
                                });
                              });
                              _textEditingController.clear();
                              Future.delayed(const Duration(seconds: 2))
                                  .then((value) => _scrollDown())
                                  .then((value) =>
                                      Future.delayed(const Duration(seconds: 5))
                                          .then((value) => _scrollDown()))
                                  .then((value) => Future.delayed(
                                          const Duration(seconds: 10))
                                      .then((value) => _scrollDown()));
                            });
                          });
                        },
                        cursorColor: Colors.black,
                        cursorHeight: 25,
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          focusedBorder: InputBorder.none,
                          hintText: "What can i assist you with?",
                          hintStyle: TextStyle(
                            fontFamily: 'manrope400',
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Color.fromRGBO(155, 161, 174, 1),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Image.asset("assets/send.png"),
                    onTap: () {
                      _focosNode.unfocus();
                      setState(() {
                        isChating = true;
                        Future.delayed(const Duration(milliseconds: 100))
                            .then((value) {
                          isLoading = true;
                          _chatMessages.add(
                            ChatMessage(
                                text: _textEditingController.text,
                                chatMessagesType: ChatMessagesType.user),
                          );
                          var userQuestion = _textEditingController.text;
                          _textEditingController.clear();
                          Future.delayed(const Duration(milliseconds: 50))
                              .then((value) => _scrollDown());

                          reciveMessageFromBot(userQuestion).then((value) {
                            setState(() {
                              isLoading = false;
                              _chatMessages.add(
                                ChatMessage(
                                    text: value.toString(),
                                    chatMessagesType: ChatMessagesType.bot),
                              );
                            });
                          });
                          _textEditingController.clear();
                          Future.delayed(const Duration(seconds: 2))
                              .then((value) => _scrollDown())
                              .then((value) =>
                                  Future.delayed(const Duration(seconds: 5))
                                      .then((value) => _scrollDown()))
                              .then((value) =>
                                  Future.delayed(const Duration(seconds: 10))
                                      .then((value) => _scrollDown()));
                        });
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _scrollDown() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }
}

Route _navigateSideMenu() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const SideMenu(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(-1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(
        CurveTween(curve: curve),
      );

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

void _showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: const MyAlertDialog());
    },
  );
}
