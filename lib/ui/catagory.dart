import 'package:flutter/material.dart';

import 'package:newpro/models/activity.dart';

import 'package:newpro/provider/main_provider.dart';
import 'package:newpro/ui/diolog.dart';
import 'package:newpro/ui/katagoriyaFilter.dart';
import 'package:provider/provider.dart';

List<String> name = ['Girdeji', 'Cykdajy'];
List<String> input = ['pul mukdaryny girizin', 'nama harclanynyz'];
List money = [];

class Catogory extends StatefulWidget {
  const Catogory({Key? key}) : super(key: key);

  @override
  State<Catogory> createState() => _CatogoryState();
}

class _CatogoryState extends State<Catogory> {
  TextEditingController description = TextEditingController();
  TextEditingController moneyField = TextEditingController();
  String? myselection;
  void selectcat(String cat) {
    setState(() {
      myselection = cat;
    });
  }

  String? _value = 'Girdeji';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kategoriyalar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: List.generate(
                2,
                (i) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Text(
                          name[i],
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Radio(
                        activeColor: Color.fromARGB(255, 144, 59, 208),
                        value: name[i],
                        groupValue: _value,
                        onChanged: (t) {
                          if (t != null) {
                            setState(() {
                              _value = t.toString();
                              myselection = null;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                FilterDropDownBottom(
                    renk: true,
                    value: _value,
                    select: selectcat,
                    selectedValue: myselection),
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Diolog(context, _value);
                    });
                  },
                  child: Container(
                    width: 50,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color: Colors.black54,
                            style: BorderStyle.solid,
                            width: 0.80)),
                    child: const Icon(Icons.add),
                  ),
                ),
              ],
            ),
            Column(
              children: List.generate(
                input.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: index == 0 ? moneyField : description,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: input[index],
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            width: 1.0,
                            color: Colors.black26,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            width: 1.0,
                            color: Colors.black26,
                          )),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                width: 125,
                height: 40,
                child: RaisedButton(
                  onPressed: () {
                    context.read<MainProvider>().addActivity(Activity(
                        context.read<MainProvider>().activities.all.length,
                        myselection,
                        description.text,
                        int.parse(moneyField.text)));
                  },
                  color: const Color.fromARGB(255, 144, 59, 208),
                  child: const Text(
                    'Yatda saklat',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
