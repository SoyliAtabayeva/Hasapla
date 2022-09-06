import 'package:flutter/material.dart';

class EmptyPAge extends StatelessWidget {
  const EmptyPAge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Image.asset(
              'document.gif',
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Maglumat goshun',
            style:
                TextStyle(fontSize: 20, color: Color.fromARGB(255, 47, 47, 47)),
          ),
        ],
      ),
    );
  }
}
