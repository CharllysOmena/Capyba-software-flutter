import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  const Error({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.dangerous,
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
