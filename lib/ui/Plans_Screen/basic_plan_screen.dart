import 'package:flutter/material.dart';
import 'package:gym_application/ui/Payment_screen/basic_payment.dart';

class BasicPlanScreen extends StatefulWidget {
  const BasicPlanScreen({super.key});

  @override
  State<BasicPlanScreen> createState() => _BasicPlanScreenState();
}

class _BasicPlanScreenState extends State<BasicPlanScreen> {
  // Initial text values for benefits
  String benefitsText = """
1. Access to gym facilities during operational hours.
2. Complimentary introductory personal training session.
3. Access to basic group classes (e.g., Yoga, Zumba).
4. Free parking.
5. 10% discount on gym merchandise.
""";

  // TextEditingController for editing all benefits
  TextEditingController benefitsController = TextEditingController();

  // Track whether the text is being edited
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    benefitsController.text = benefitsText; // Initialize the controller with the default text
  }

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
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            margin: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  "Congrats you Selected the Basic plan 🤩",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  "Plan Benefits",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.only(left: 5),
                  padding: EdgeInsets.only(left: 6, right: 2, top: 15, bottom: 15),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      isEditing
                          ? TextField(
                        controller: benefitsController,
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                        maxLines: null, // Allows multiline input
                        decoration: InputDecoration(
                          hintText: "Edit the benefits here...",
                          hintStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.black.withOpacity(0.6),
                        ),
                      )
                          : Text(
                        benefitsText,
                        style: TextStyle(
                            fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                if (isEditing) {
                                  benefitsText = benefitsController.text; // Save edited text
                                }
                                isEditing = !isEditing; // Toggle edit state
                              });
                            },
                            child: Text(
                              isEditing ? "Save" : "Edit",
                              style: TextStyle(color: Colors.blue, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BasicPayment()));
                        },
                        child: Text("Confirm !")),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Go Back !")),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
