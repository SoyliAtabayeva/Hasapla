import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text('Sazlamalar'),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          Row(
            children: const [
              Icon(Icons.info),
              SizedBox(
                width: 15,
              ),
              Text('Biz hakda'),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          GestureDetector(
            onTap: () {
              setState(() {});
            },
            child: Row(
              children: const [
                Icon(Icons.language),
                SizedBox(
                  width: 15,
                ),
                Text('dil calyshmak'),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: const [
              Icon(Icons.alarm),
              SizedBox(
                width: 15,
              ),
              Text('wagty duz'),
            ],
          ),
        ],
      ),
    );
  }
}

Diolog(context) {
  return const AlertDialog(
    actions: [
      Text('Turkmen'),
      Text('Русский'),
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog();
    },
  );
}
