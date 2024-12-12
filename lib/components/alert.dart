import 'package:flutter/material.dart';

class AlertBoxExample extends StatelessWidget {
  const AlertBoxExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
       Column(
         children: [
           IconButton(onPressed: (){
             Navigator.pop(context);
           }, icon: Icon(Icons.arrow_back)),
           TextButton(
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('AlertDialog Title'),
                content: const Text('AlertDialog description'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('OK'),
                  ),
                ],
              ),
            ),
            child: const Text('Show Dialog'),
                 ),
         ],
       ),
    );
  }
}