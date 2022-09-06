import 'package:flutter/material.dart';
import 'package:newpro/provider/main_provider.dart';

import 'package:newpro/ui/appbarFilter.dart';
import 'package:newpro/ui/catagory.dart';
import 'package:newpro/ui/emptyPage.dart';
import 'package:newpro/ui/settings.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<MainProvider>().readActivities();
    super.initState(); //bl
  }

  @override
  Widget build(BuildContext context) {
    DateTime a = DateTime.now();
    return Scaffold(
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: FloatingActionButton(
                child: Icon(Icons.settings),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Settings()));
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => Catogory())));
              },
            ),
          ],
        ),
        appBar: AppBar(
          title: const Text('Hasapla'),
          elevation: 0,
          actions: [
            DropDawn(),
          ],
        ),
        body: Consumer<MainProvider>(
            builder: (context, provider, child) => provider
                        .activities.all.length ==
                    0
                ? EmptyPAge()
                : ListView.builder(
                    itemCount: provider.activities.all.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          width: MediaQuery.of(context).size.width - 40,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 226, 199, 231),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 300,
                                  top: 10,
                                ),
                                child: Text('${a.day}. ${a.month}. ${a.year}y'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  'Pul mukdary: ${provider.activities.all[index].price.toString()} TMT',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  'Kategoriyasy: ${provider.activities.all[index].category.toString()}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  'Beyani: ${provider.activities.all[index].decription.toString()}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )));
  }
}
