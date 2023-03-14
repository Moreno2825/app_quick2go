import 'package:flutter/material.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help', style: TextStyle(color: Color(0xff625B71)),),
        backgroundColor: const Color(0xffEADDFF),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
          color: const Color(
            0xff625B71,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          ListTile(
            title: const Text('Report a Problem'), leading: const Icon(Icons.report_gmailerrorred), onTap: (){},
          ),
          ListTile(
            title: const Text('Help Center'), leading: const Icon(Icons.help_center), onTap: (){},
          ),
          ListTile(
            title: const Text('Privacy and Security Help'), leading: const Icon(Icons.security), onTap: (){},
          ),
          ListTile(
            title: const Text('Support Request'), leading: const Icon(Icons.support_agent_sharp), onTap: (){},
          ),
        ],
      ),
    );
  }
}