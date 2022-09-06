import 'package:flutter/material.dart';

import 'package:newpro/ui/katagoriyaFilter.dart';

Diolog(BuildContext context, String? value) {
  String eneteredWord = '';
  var alert = StatefulBuilder(builder: ((context, setState) {
    return AlertDialog(
      actions: [
        TextFormField(
          onSaved: (newValue) {
            setState(() {
              eneteredWord = newValue.toString();
            });
          },
          decoration: InputDecoration(
            hintText: 'Girizin',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  color: Color.fromARGB(255, 144, 59, 208), width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  color: Color.fromARGB(255, 144, 59, 208), width: 1.0),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(
              child: const Text("Kategoriya gosh"),
              color: Colors.green.shade800,
              onPressed: () {
                setState(
                  () {
                    value != 'Girdeji'
                        ? cykdajy.add(eneteredWord)
                        : girdeji.add(eneteredWord);

                    Navigator.pop(context);
                  },
                );
              },
            ),
            RaisedButton(
              color: Colors.red,
              child: const Text("GoyBolsun etmek"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ],
    );
  }));

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
