import 'package:flutter/material.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('asset/onboarding/Frame1.png'),
        const SizedBox(
          height: 40.0,
        ),
       const Text(
          "Book your car",
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
          child: Text("This is screen one rac This is screen one showing about trac This is screen one showing about trac",
          style: TextStyle(
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
