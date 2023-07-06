import 'package:flutter/material.dart';
import 'package:flutter_ws_1/styled_text.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors:  [
            Color.fromARGB(255, 26, 2, 80),
            Color.fromARGB(255, 105, 98, 122)
          ],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
        child: StyledText('TTTT'),
      ),
    );
  }
}
