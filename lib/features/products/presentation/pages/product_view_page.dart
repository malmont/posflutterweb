import 'package:flutter/material.dart';

import '../../../../design/design.dart';

class ProductViewPage extends StatefulWidget {
  const ProductViewPage({super.key});

  @override
  State<ProductViewPage> createState() => _ProductViewPageState();
}

class _ProductViewPageState extends State<ProductViewPage> {
   bool isSelected = false;
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: Color(0xff393C49),
      body: Center(
        child: Column(
          children: [
            const Text('Welcome to ProductViewPage'),
            ElevatedButton(
              style: CustomButtonStyle.customButtonStyle(
                  type: ButtonType.validButton, isSelected: isSelected),
              onPressed: () {},
              child: const Text('validButton'),
            ),
            ElevatedButton(
              style: CustomButtonStyle.customButtonStyle(
                  type: ButtonType.cancelButton, isSelected: isSelected),
              onPressed: () {},
              child: const Text('Go cancelButton!'),
            ),
            ElevatedButton(
              style: CustomButtonStyle.customButtonStyle(
                type: ButtonType.selectedButton,
                isSelected: isSelected,
              ),
              onPressed: () {
                setState(() {
                  isSelected = !isSelected;
                });
              },
              child: const Text("selectedButton"),
            ),
          ],
        ),
      ),
    );
  }
}
