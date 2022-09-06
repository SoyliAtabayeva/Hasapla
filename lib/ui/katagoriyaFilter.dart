import 'package:flutter/material.dart';

List<String> cykdajy = [
  'Tölegler',
  'Iýmit',
  'Söwda',
  'Ýol gatnawy(awtobus..)',
  'Saglyk',
  'Öý',
  'Tehnologiýa',
  'Egin eshik ',
  'Sport',
  'Okuw',
  'Goýum',
  'Maşgala',
  'Syýahat',
  'Iş',
];
List<String> girdeji = ['Aylyk', 'Utushlar', 'Bayraklar', 'Goyum'];

class FilterDropDownBottom extends StatefulWidget {
  bool? renk;
  String? value;
  String? selectedValue;

  Function(String ss)? select;
  FilterDropDownBottom(
      {required this.renk, this.value, this.select, this.selectedValue});

  @override
  State<FilterDropDownBottom> createState() => _FilterDropDownBottomState();
}

class _FilterDropDownBottomState extends State<FilterDropDownBottom> {
  // String? mySelection;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 275,
      height: 40,
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
            color: Colors.black54, style: BorderStyle.solid, width: 0.80),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          borderRadius: BorderRadius.circular(10),
          isDense: true,
          value: widget.selectedValue,
          onChanged: (value) {
            widget.select!(value ?? "");
            // setState(() {
            //   mySelection = value;
            // });
          },
          items: List.generate(
              widget.value != 'Girdeji' ? cykdajy.length : girdeji.length,
              (index) => DropdownMenuItem(
                    value: widget.value != 'Girdeji'
                        ? '${cykdajy[index]}'
                        : '${girdeji[index]}',
                    child: widget.value != 'Girdeji'
                        ? Text('${cykdajy[index]}')
                        : Text('${girdeji[index]}'),
                  )),
        ),
      ),
    );
  }
}
