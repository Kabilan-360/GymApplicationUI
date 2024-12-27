import 'package:flutter/material.dart';
import 'package:gym_application/ui/Plans_Screen/basic_plan_screen.dart';
import 'package:gym_application/ui/notofications.dart';
import 'package:gym_application/ui/profile_screen.dart';

class MembershipScreen extends StatefulWidget {
  const MembershipScreen({super.key});

  @override
  State<MembershipScreen> createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<MembershipScreen> {
  String? _basicSelectedDuration;
  String? _premiumSelectedDuration;
  String? _vipSelectedDuration;

  final List<String> _options = ['1 month', '6 months', '1 Year'];

  // Plan titles (editable)
  String _basicTitle = "Basic";
  String _premiumTitle = "Premium";
  String _vipTitle = "VIP";

  String? _validateDuration(String? selectedDuration) {
    if (selectedDuration == null || selectedDuration.isEmpty) {
      return 'Please select a membership duration';
    }
    return null;
  }

  // Dialog to edit the title
  void _editTitle(String currentTitle, Function(String) onSave) {
    TextEditingController _controller =
    TextEditingController(text: currentTitle);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Plan Title'),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Enter new title',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                onSave(_controller.text);
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildBenefitsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Benefits:",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 18),
            SizedBox(width: 5),
            Text("Unlimited Gym Access", style: TextStyle(color: Colors.white)),
          ],
        ),
        Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 18),
            SizedBox(width: 5),
            Text("Free Classes", style: TextStyle(color: Colors.white)),
          ],
        ),
        Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 18),
            SizedBox(width: 5),
            Text("Nutrition Plan", style: TextStyle(color: Colors.white)),
          ],
        ),
      ],
    );
  }

  Widget _buildPlanCard({
    required String title,
    required String imageUrl,
    required String? selectedDuration,
    required Function(String?) onDurationChange,
    required Function(String) onEditTitle,
  }) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(25),
            color: Colors.grey[900],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                  imageUrl,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.white),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    onPressed: () => _editTitle(title, onEditTitle),
                    icon: Icon(Icons.edit, color: Colors.white),
                  )
                ],
              ),
              SizedBox(height: 10),
              _buildBenefitsList(),
              SizedBox(height: 10),
              Column(
                children: _options.map((option) {
                  return RadioListTile<String>(
                    title: Text(
                      option +
                          (option == '6 months'
                              ? ' - \$120 (10% OFF)'
                              : option == '1 Year'
                              ? ' - \$200 (20% OFF)'
                              : ' - \$25'),
                      style: TextStyle(color: Colors.white),
                    ),
                    value: option,
                    groupValue: selectedDuration,
                    onChanged: onDurationChange,
                    activeColor: Colors.blueAccent,
                  );
                }).toList(),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  String? validationError = _validateDuration(selectedDuration);
                  if (validationError != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(validationError)),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Form submitted successfully')),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BasicPlanScreen(),
                      ),
                    );
                  }
                },
                child: Text("Submit"),
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Welcome to Our GYM",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileScreen()));
                    },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVCHywHxDFVk0j8PEgX8FELCQ8Vbiu2a49Xg&s'),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NotificationScreen()));
                    },
                    icon: Icon(Icons.notifications, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.logout, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 20),
              _buildPlanCard(
                title: _basicTitle,
                imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqEyFHvuFMAc-knprFmaQcUBLgB4bTxJwL9Q&s",
                selectedDuration: _basicSelectedDuration,
                onDurationChange: (value) {
                  setState(() {
                    _basicSelectedDuration = value;
                  });
                },
                onEditTitle: (newTitle) {
                  setState(() {
                    _basicTitle = newTitle;
                  });
                },
              ),
              _buildPlanCard(
                title: _premiumTitle,
                imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqEyFHvuFMAc-knprFmaQcUBLgB4bTxJwL9Q&s",
                selectedDuration: _premiumSelectedDuration,
                onDurationChange: (value) {
                  setState(() {
                    _premiumSelectedDuration = value;
                  });
                },
                onEditTitle: (newTitle) {
                  setState(() {
                    _premiumTitle = newTitle;
                  });
                },
              ),
              _buildPlanCard(
                title: _vipTitle,
                imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqEyFHvuFMAc-knprFmaQcUBLgB4bTxJwL9Q&s",
                selectedDuration: _vipSelectedDuration,
                onDurationChange: (value) {
                  setState(() {
                    _vipSelectedDuration = value;
                  });
                },
                onEditTitle: (newTitle) {
                  setState(() {
                    _vipTitle = newTitle;
                  });
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
