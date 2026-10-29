import 'package:flutter/material.dart';

class Detailchat extends StatefulWidget {
  const Detailchat({super.key});

  @override
  State<Detailchat> createState() => _DetailchatState();
}

class _DetailchatState extends State<Detailchat> {
  final TextEditingController _messageController = TextEditingController();
  final List<String> _messages = [
    'Halo, sudah sampai?',
    'Sudah, sebentar lagi masuk.',
    'Oke, aku tunggu di depan.',
    'Siap, sebentar lagi sampai.',
  ];

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final message = _messageController.text.trim();
    if (message.isEmpty) return;
    setState(() {
      _messages.add(message);
      _messageController.clear();
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
                padding: const EdgeInsets.all(14),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final isMine = index.isOdd;
                  return Align(
                    alignment: isMine
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.sizeOf(context).width * 0.78,
                      ),
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 9,
                      ),
                      decoration: BoxDecoration(
                        color: isMine ? const Color(0xFFD9FDD3) : Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(10),
                          topRight: const Radius.circular(10),
                          bottomLeft: Radius.circular(isMine ? 10 : 2),
                          bottomRight: Radius.circular(isMine ? 2 : 10),
                        ),
                      ),
                      child: Text(
                        _messages[index],
                        style: const TextStyle(fontSize: 15),
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
                        controller: _messageController,
                        minLines: 1,
                        maxLines: 4,
                        textInputAction: TextInputAction.newline,
                        decoration: InputDecoration(
                          hintText: 'Ketik pesan',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: const Color(0xFF25D366),
                      child: IconButton(
                        onPressed: _sendMessage,
                        color: Colors.white,
                        icon: const Icon(Icons.send),
                      ),
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
