import 'package:flutter/material.dart';
import 'message.dart';

class Detailchat extends StatefulWidget {
  const Detailchat({super.key});

  @override
  State<Detailchat> createState() => _DetailchatState();
}

class _DetailchatState extends State<Detailchat> {
  final TextEditingController _chatController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<Message> _messages = [
    const Message(text: 'Hi!', isMe: false),
    const Message(text: 'Bagaimana belajar Flutter?', isMe: false),
    const Message(text: 'Mudah, cuma widget-widget saja nih.', isMe: false),
  ];

  @override
  void dispose() {
    _chatController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    if (_chatController.text.trim().isEmpty) return;

    setState(() {
      _messages.add(Message(text: _chatController.text, isMe: true));
    });

    _chatController.clear();

    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF075E54),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        titleSpacing: 0,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundColor: Color(0xFF25D366),
              child: Text(
                'A',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: Text('Alvin', style: TextStyle(fontSize: 17)),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.videocam_outlined),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.call_outlined)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: Container(
        color: const Color(0xFFF5F7F8),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                 padding: const EdgeInsets.all(20),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                   final msg = _messages[index];
                  return Align(
                     alignment: msg.isMe
                         ? Alignment.centerRight
                         : Alignment.centerLeft,
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.sizeOf(context).width * 0.78,
                      ),
                       margin: const EdgeInsets.symmetric(vertical: 5),
                       padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                         color: msg.isMe ? Colors.green[100] : Colors.green[300],
                         borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                         msg.text,
                      ),
                    ),
                  );
                },
              ),
            ),
            SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 6, 8, 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: TextField(
                         controller: _chatController,
                         decoration: const InputDecoration(
                           hintText: 'Tulis pesan...',
                           border: OutlineInputBorder(),
                         ),
                         onSubmitted: (_) => _sendMessage(),
                      ),
                    ),
                     IconButton(
                       onPressed: _sendMessage,
                       icon: const Icon(Icons.send),
                     ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
