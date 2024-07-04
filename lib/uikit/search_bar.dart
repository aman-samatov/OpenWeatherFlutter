import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopSearchBar extends StatelessWidget {
  final void Function(String text) searchCity;

  const TopSearchBar(this.searchCity, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: CupertinoSearchTextField(
        onChanged: (String text) {
          if (text.isNotEmpty) searchCity(text);
        },
        backgroundColor: const Color(0xFFd0d0d0),
        style: const TextStyle(
            fontSize: 17,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.w400,
            color: Colors.black,
            height: 1.4),
        placeholder: "Enter the city's name",
        placeholderStyle: const TextStyle(
            leadingDistribution: TextLeadingDistribution.even,
            fontSize: 17,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.w400,
            color: Colors.black,
            height: 1.4),
      ),
    );
  }
}
