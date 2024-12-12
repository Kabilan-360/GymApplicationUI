import 'package:flutter/material.dart';
import 'package:gym_application/ui/Payment_screen/basic_payment.dart';

class BasicPlanScreen extends StatefulWidget {
  const BasicPlanScreen({super.key});

  @override
  State<BasicPlanScreen> createState() => _BasicPlanScreenState();
}

class _BasicPlanScreenState extends State<BasicPlanScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://static.vecteezy.com/system/resources/thumbnails/026/781/389/small/gym-interior-background-of-dumbbells-on-rack-in-fitness-and-workout-room-photo.jpg",
            ),
            fit: BoxFit.cover, // Makes the image cover the entire background
          ),
        ),
        child: Container(
          margin: EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Congrats you Selected the Basic plan 🤩",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              // Container(
              //   margin: EdgeInsets.only(right: 10),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(25)
              //   ),
              //   clipBehavior: Clip.hardEdge,
              //   child: Image.network(
              //       "https://static.vecteezy.com/system/resources/thumbnails/026/781/389/small/gym-interior-background-of-dumbbells-on-rack-in-fitness-and-workout-room-photo.jpg"),
              // ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Plan Benefits",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 5),
                padding:
                    EdgeInsets.only(left: 6, right: 2, top: 15, bottom: 15),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(25)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "1. Access to gym facilities during operational hours.",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "2. Complimentary introductory personal training session.",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "3. Access to basic group classes (e.g., Yoga, Zumba).",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "4. Free parking.",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "5. 10% discount on gym merchandise.",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>BasicPayment()));
                            }, child: Text("Confirm !")),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            }, child: Text("Go Back !")),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
