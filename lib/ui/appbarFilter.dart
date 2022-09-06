import 'package:flutter/material.dart';

class DropDawn extends StatefulWidget {
  const DropDawn({Key? key}) : super(key: key);

  @override
  State<DropDawn> createState() => _DropDawn();
}

class _DropDawn extends State<DropDawn> {
  String Selectedmenu = 'One';

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>  (
      icon: const Icon(
        Icons.calendar_month,
        size: 24,
      ),
      onSelected: (item) {
        setState(() {});
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'ay',
          child: Text('Aý boýunça'),
        ),
        const PopupMenuItem<String>(
          value: 'gün',
          child: Text('Gün boýunça'),
        ),
      ],
    );
  }
}
