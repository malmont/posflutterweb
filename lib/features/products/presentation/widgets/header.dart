import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final Function(String) onSearchSubmitted;

  const Header({super.key, required this.onSearchSubmitted});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'LOLIBEE',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          width: 300,
          child: TextField(
            onSubmitted: onSearchSubmitted,
            autofocus: false,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.only(left: 20, bottom: 22, top: 22),
              prefixIcon: const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Icon(Icons.search),
              ),
              border: const OutlineInputBorder(),
              hintText: "Search Product",
              fillColor: Colors.grey.shade100,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 3.0),
                borderRadius: BorderRadius.circular(26),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(26),
                borderSide: const BorderSide(color: Colors.white, width: 3.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
