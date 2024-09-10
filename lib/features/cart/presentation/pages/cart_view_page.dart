import 'package:flutter/material.dart';

import '../../../../design/design.dart';

class CartViewPage extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onCancelPressed;
  final VoidCallback onSelectedPressed;
  final VoidCallback onValidPressed;

  const CartViewPage({
    super.key,
    required this.isSelected,
    required this.onCancelPressed,
    required this.onSelectedPressed,
    required this.onValidPressed,
    required void Function() onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colours.primaryPalette,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Détails supplémentaires',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Description',
            style: TextStyle(fontSize: 16, color: Colours.white),
          ),
          const SizedBox(height: 10),
          const Text(
            'Informations diverses',
            style: TextStyle(fontSize: 16, color: Colours.white),
          ),
          const SizedBox(height: 10),
          const Text(
            'Autre information importante',
            style: TextStyle(fontSize: 16, color: Colours.white),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: CustomButtonStyle.customButtonStyle(
                type: ButtonType.cancelButton,
                isSelected: isSelected,
              ),
              onPressed: onCancelPressed,
              child: const Text('Go cancelButton!'),
            ),
          ),
          ElevatedButton(
            style: CustomButtonStyle.customButtonStyle(
              type: ButtonType.selectedButton,
              isSelected: isSelected,
            ),
            onPressed: onSelectedPressed,
            child: const Text("selectedButton"),
          ),
          ElevatedButton(
            style: CustomButtonStyle.customButtonStyle(
              type: ButtonType.validButton,
              isSelected: isSelected,
            ),
            onPressed: onValidPressed,
            child: const Text('validButton'),
          ),
        ],
      ),
    );
  }
}
