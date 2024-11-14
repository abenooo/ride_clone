import 'package:flutter/material.dart';

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('asset/onboarding/onboarding4.gif'),
        const SizedBox(
          height: 40.0,
        ),
        const Text(
          "This is screen one showing about track",
          style: TextStyle(
              color: Colors.black, 
              fontSize: 22.0, 
              fontWeight: FontWeight.w400
              ),
              textAlign: TextAlign.center,
        ),
        
        const SizedBox(
          height: 20.0,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: const Text("This is screen one rac This is screen one showing about trac This is screen one showing about trac",
          style:  TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.w300
                ),
                textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
