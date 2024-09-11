import 'package:flutter/material.dart';

import '../../../../design/design.dart';

class Header extends StatelessWidget {
  final Function(String) onSearchSubmitted;

  const Header({super.key, required this.onSearchSubmitted});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Padding(
          padding: EdgeInsets.all(Units.edgeInsetsXXLarge),
          child: Text(
            'LOLIBEE',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: Units.u18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(Units.edgeInsetsLarge),
          width: 300,
          child: TextField(
            onSubmitted: onSearchSubmitted,
            autofocus: false,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(
                  left: Units.edgeInsetsXXXLarge,
                  bottom: Units.edgeInsetsXXXLarge,
                  top: Units.edgeInsetsXXXLarge),
              prefixIcon: const Padding(
                padding: EdgeInsets.only(left: Units.edgeInsetsLarge),
                child: Icon(Icons.search),
              ),
              border: const OutlineInputBorder(),
              hintText: "Search Product",
              fillColor: Colors.grey.shade100,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Colors.white, width: Units.u4),
                borderRadius: BorderRadius.circular(Units.radiusXXXXXXLarge),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Units.radiusXXXXXXLarge),
                borderSide:
                    const BorderSide(color: Colors.white, width: Units.u4),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
