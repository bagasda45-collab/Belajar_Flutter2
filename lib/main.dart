import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('WhatsApp'),
          backgroundColor: Color.fromARGB(255, 0, 205, 41),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.chat), text: 'Chat'),
              Tab(icon: Icon(Icons.circle_outlined), text: 'Status'),
              Tab(icon: Icon(Icons.call), text: 'Call'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tampilan Chat
            ListView(
              children: [
                Card(
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(child: Icon(Icons.person)),
                    title: Text('Rizky'),
                    subtitle: Text('Nanti jadi main?'),
                    trailing: Text(
                      '10.30',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
                Card(
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(child: Icon(Icons.person)),
                    title: Text('Andi'),
                    subtitle: Text('Oke, siap'),
                    trailing: Text(
                      '09.15',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
              ],
            ),

            // Tampilan Status
            ListView(
              children: [
                ListTile(
                  leading: Stack(
                    children: [
                      CircleAvatar(
                        radius: 27,
                        child: Icon(Icons.person, size: 30),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Icon(Icons.add_circle, color: Colors.green),
                      ),
                    ],
                  ),
                  title: Text('Status saya'),
                  subtitle: Text('Ketuk untuk menambahkan status'),
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Text('Pembaruan terbaru'),
                ),
                ListTile(
                  leading: CircleAvatar(
                    radius: 27,
                    backgroundColor: Colors.green,
                    child: CircleAvatar(radius: 23, child: Icon(Icons.person)),
                  ),
                  title: Text('Rizky'),
                  subtitle: Text('Hari ini, 08.30'),
                ),
                ListTile(
                  leading: CircleAvatar(
                    radius: 27,
                    backgroundColor: Colors.green,
                    child: CircleAvatar(radius: 23, child: Icon(Icons.person)),
                  ),
                  title: Text('Andi'),
                  subtitle: Text('Hari ini, 07.15'),
                ),
              ],
            ),

            // Tampilan Call
            ListView(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Icon(Icons.link, color: Colors.white),
                  ),
                  title: Text('Buat tautan panggilan'),
                  subtitle: Text('Bagikan tautan untuk panggilan WhatsApp'),
                ),
                Divider(),
                Padding(padding: EdgeInsets.all(12), child: Text('Terbaru')),
                ListTile(
                  leading: CircleAvatar(child: Icon(Icons.person)),
                  title: Text('Rizky'),
                  subtitle: Row(
                    children: [
                      Icon(Icons.call_received, color: Colors.green, size: 16),
                      SizedBox(width: 5),
                      Text('Hari ini, 10.20'),
                    ],
                  ),
                  trailing: Icon(Icons.call, color: Colors.green),
                ),
                ListTile(
                  leading: CircleAvatar(child: Icon(Icons.person)),
                  title: Text('Andi'),
                  subtitle: Row(
                    children: [
                      Icon(Icons.call_made, color: Colors.red, size: 16),
                      SizedBox(width: 5),
                      Text('Kemarin, 20.15'),
                    ],
                  ),
                  trailing: Icon(Icons.videocam, color: Colors.green),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
