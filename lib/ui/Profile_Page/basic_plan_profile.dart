import 'package:flutter/material.dart';
import 'package:gym_application/ui/log_in_page.dart';

class BasicPlanProfile extends StatefulWidget {
  const BasicPlanProfile({super.key});

  @override
  State<BasicPlanProfile> createState() => _BasicPlanProfileState();
}

class _BasicPlanProfileState extends State<BasicPlanProfile> {
  String name = "Kabilan R";
  String email = "Kabilan@gmail.com";
  String activationStatus = "You successfully activated this plan";
  String expiryStatus = "This will be expire on";

  // Controllers for editing
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _activationController = TextEditingController();
  final TextEditingController _expiryController = TextEditingController();

  bool isEditing = false;

  void startEditing() {
    setState(() {
      isEditing = true;
      _nameController.text = name;
      _emailController.text = email;
      _activationController.text = activationStatus;
      _expiryController.text = expiryStatus;
    });
  }

  void saveChanges() {
    setState(() {
      isEditing = false;
      name = _nameController.text;
      email = _emailController.text;
      activationStatus = _activationController.text;
      expiryStatus = _expiryController.text;
    });
  }

  List<bool> selectedGoals = List.generate(5, (index) => false);
  List<String> goalOptions = [
    "Lose 5kg",
    "Run 10km",
    "Increase muscle mass",
    "Improve flexibility",
    "Eat healthier"
  ];

  List<String> selectedGoalLabels = [];

  // Function to update selected goals after button press
  void updateSelectedGoals() {
    setState(() {
      selectedGoalLabels = [];
      for (int i = 0; i < selectedGoals.length; i++) {
        if (selectedGoals[i]) {
          selectedGoalLabels.add(goalOptions[i]);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Container(
          width: 250,
          child: Drawer(
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  accountName: Text(
                    "Kabilan R",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  accountEmail: Text("Kabilan@gmail.com"),
                  currentAccountPicture: ClipOval(
                    child: Image.network(
                      "https://i.pinimg.com/736x/51/ec/d0/51ecd0532e8d08227b15fa65a55cf522.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home, color: Colors.black),
                  title: Text("Home"),
                  onTap: () {
                    // Navigate to home or perform an action
                  },
                ),
                ListTile(
                  leading: Icon(Icons.person, color: Colors.black),
                  title: Text("Profile"),
                  onTap: () {
                    // Navigate to profile
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings, color: Colors.black),
                  title: Text("Settings"),
                  onTap: () {
                    // Navigate to settings
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.logout, color: Colors.black),
                  title: Text("Log Out"),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LogInPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),

        backgroundColor: Colors.black.withOpacity(.01),
        body: Container(
          child: Container(
            constraints: BoxConstraints.expand(),
            // Expands the container to fill the screen
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center, // Align content in the center
                children: [
                  Text(
                    "Lead a Healthy Life 🦾",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: Image.network(
                          "https://i.pinimg.com/736x/51/ec/d0/51ecd0532e8d08227b15fa65a55cf522.jpg",
                          height: 80,
                          width: 80,
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LogInPage()));
                          },
                          child: Text("Log out")),
                      IconButton(
                          onPressed: () {
                            startEditing();
                          },
                          icon: Icon(Icons.edit)),
                      Builder(
                        builder: (BuildContext context) {
                          return IconButton(
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                            icon: Icon(Icons.menu_open_sharp),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  if (isEditing)
                    Column(
                      children: [
                        buildEditableField("Name", _nameController),
                        buildEditableField("Email", _emailController),
                        buildEditableField(
                            "Activation Status", _activationController),
                        buildEditableField("Expiry Status", _expiryController),
                        ElevatedButton(
                          onPressed: saveChanges,
                          child: Text("OK"),
                        ),
                      ],
                    )
                  else
                    Column(
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          email,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          activationStatus,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          expiryStatus,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),

                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Text(
                          "Key stats ",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatCard("Weight", "75 kg", Colors.blue),
                      _buildStatCard("BMI", "24.5", Colors.purple),
                      _buildStatCard("BODY FAT", "18%", Colors.green),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Text(
                          "Your Goals",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ],
                  ),

                  Column(
                    children: List.generate(goalOptions.length, (index) {
                      return CheckboxListTile(
                        title: Text(
                          goalOptions[index],
                          style: TextStyle(color: Colors.white),
                        ),
                        value: selectedGoals[index],
                        onChanged: (bool? value) {
                          setState(() {
                            selectedGoals[index] = value!;
                          });
                        },
                      );
                    }),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: updateSelectedGoals,
                    child: Text("Save Selected Goals"),
                    style: ElevatedButton.styleFrom(
                      // primary: Colors.orange,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Display selected goals
                  selectedGoalLabels.isNotEmpty
                      ? Column(
                          children: selectedGoalLabels
                              .map((goal) => Text(
                                    goal,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ))
                              .toList(),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Widget to create stat cards
Widget _buildStatCard(String title, String value, Color color) {
  return Card(
    elevation: 5,
    color: color.withOpacity(0.5),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    child: Container(
      padding: EdgeInsets.all(16),
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    ),
  );
}

Widget buildEditableField(String label, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.grey.shade800,
      ),
      style: TextStyle(color: Colors.white),
    ),
  );
}
