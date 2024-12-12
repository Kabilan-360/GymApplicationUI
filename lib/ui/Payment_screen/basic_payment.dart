import 'package:flutter/material.dart';
import 'package:gym_application/ui/Profile_Page/basic_plan_profile.dart';

class BasicPayment extends StatefulWidget {
  const BasicPayment({super.key});

  @override
  State<BasicPayment> createState() => _BasicPaymentState();
}

class _BasicPaymentState extends State<BasicPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqEyFHvuFMAc-knprFmaQcUBLgB4bTxJwL9Q&s"),
                fit: BoxFit.cover)),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // IconButton(onPressed: (){
              //   Navigator.pop(context);
              // }, icon: Icon(Icons.arrow_back)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title:
                            const Text('Membership Plan Selected Successfully'),
                        // content: const Text('AlertDialog description'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BasicPlanProfile())),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    ),
                    child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(25)),
                        child: const Text('Proceed to Payment')),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancel"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
