import 'package:flutter/material.dart';
import 'package:gym_application/components/alert.dart';
import 'package:gym_application/ui/Plans_Screen/basic_plan_screen.dart';

class MembershipScreen extends StatefulWidget {
  const MembershipScreen({super.key});

  @override
  State<MembershipScreen> createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<MembershipScreen> {
  String? _selectedDuration = '';

  String? _basicSelectedDuration;
  String? _premiumSelectedDuration;
  String? _vipSelectedDuration;

  final List<String> _options = ['1 month', '6 months', '1 Year'];

  String? _validateDuration(String? selectedDuration) {
    if (selectedDuration == null || selectedDuration.isEmpty) {
      return 'Please select a membership duration';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Welcome to Our GYM",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.logout))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              //

              //Basic
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 3),
                    borderRadius: BorderRadius.circular(25)),
                margin: EdgeInsets.only(left: 20, right: 20),
                padding: EdgeInsets.all(10),
                // height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(25)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.network(
                            // height: 200,
                            //  width: double.infinity,
                            fit: BoxFit.cover,
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqEyFHvuFMAc-knprFmaQcUBLgB4bTxJwL9Q&s"),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Basic",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white),
                    ),
                    Text("Choose an Option:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,color: Colors.white
                        )),
                    RadioListTile<String>(
                        title: Text("1 month \$ 25",style: TextStyle(color: Colors.white),),
                        value: '1 month',
                        groupValue: _basicSelectedDuration,
                        onChanged: (String? value) {
                          setState(() {
                            _basicSelectedDuration = value;
                          });
                        }),
                    RadioListTile<String>(
                        title: Text('6 months \$ 120',style: TextStyle(color: Colors.white)),
                        value: '6 months',
                        groupValue: _basicSelectedDuration,
                        onChanged: (String? value) {
                          setState(() {
                            _basicSelectedDuration = value;
                          });
                        }),
                    RadioListTile<String>(
                        title: Text("1 Year \$ 200",style: TextStyle(color: Colors.white)),
                        value: '1 Year',
                        groupValue: _basicSelectedDuration,
                        onChanged: (String? value) {
                          setState(() {
                            _basicSelectedDuration = value;
                          });
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          String? validationError =
                              _validateDuration(_basicSelectedDuration);
                          if (validationError != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(validationError)),
                            );
                          } else {
                            // Proceed with submit
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('Form submitted successfully')),
                            );
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>BasicPlanScreen()));
                          }
                        },
                        child: Text("Submit"))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //Premium
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 3),
                    borderRadius: BorderRadius.circular(25)),
                margin: EdgeInsets.only(left: 20, right: 20),
                padding: EdgeInsets.all(10),
                // height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(25)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.network(
                            // height: 200,
                            //  width: double.infinity,
                            fit: BoxFit.cover,
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqEyFHvuFMAc-knprFmaQcUBLgB4bTxJwL9Q&s"),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Premium",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white),
                    ),
                    Text("Choose an Option:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,color: Colors.white
                        )),
                    RadioListTile<String>(
                        title: Text("1 month \$ 25",style: TextStyle(color: Colors.white)),
                        value: '1 month',
                        groupValue: _premiumSelectedDuration,
                        onChanged: (String? value) {
                          setState(() {
                            _premiumSelectedDuration = value;
                          });
                        }),
                    RadioListTile<String>(
                        title: Text('6 months \$ 120',style: TextStyle(color: Colors.white)),
                        value: '6 months',
                        groupValue: _premiumSelectedDuration,
                        onChanged: (String? value) {
                          setState(() {
                            _premiumSelectedDuration = value;
                          });
                        }),
                    RadioListTile<String>(
                        title: Text("1 Year \$ 200",style: TextStyle(color: Colors.white)),
                        value: '1 Year',
                        groupValue: _premiumSelectedDuration,
                        onChanged: (String? value) {
                          setState(() {
                            _premiumSelectedDuration = value;
                          });
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          String? validationError =
                              _validateDuration(_premiumSelectedDuration);
                          if (validationError != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(validationError)),
                            );
                          } else {
                            // Proceed with submit
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('Form submitted successfully')),
                            );
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>BasicPlanScreen()));

                          }
                        },
                        child: Text("Submit"))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //VIP
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 3),
                    borderRadius: BorderRadius.circular(25)),
                margin: EdgeInsets.only(left: 20, right: 20),
                padding: EdgeInsets.all(10),
                // height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(25)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.network(
                            // height: 200,
                            //  width: double.infinity,
                            fit: BoxFit.cover,
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqEyFHvuFMAc-knprFmaQcUBLgB4bTxJwL9Q&s"),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "VIP",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white),
                    ),
                    Text("Choose an Option:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,color: Colors.white
                        )),
                    RadioListTile<String>(
                        title: Text("1 month \$ 25",style: TextStyle(color: Colors.white)),
                        value: '1 month',
                        groupValue: _vipSelectedDuration,
                        onChanged: (String? value) {
                          setState(() {
                            _vipSelectedDuration = value;
                          });
                        }),
                    RadioListTile<String>(
                        title: Text('6 months \$ 120',style: TextStyle(color: Colors.white)),
                        value: '6 months',
                        groupValue: _vipSelectedDuration,
                        onChanged: (String? value) {
                          setState(() {
                            _vipSelectedDuration = value;
                          });
                        }),
                    RadioListTile<String>(
                        title: Text("1 Year \$ 200",style: TextStyle(color: Colors.white)),
                        value: '1 Year',
                        groupValue: _vipSelectedDuration,
                        onChanged: (String? value) {
                          setState(() {
                            _vipSelectedDuration = value;
                          });
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          String? validationError =
                              _validateDuration(_vipSelectedDuration);
                          if (validationError != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(validationError)),
                            );
                          } else {
                            // Proceed with submit
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('Form submitted successfully')),
                            );
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>BasicPlanScreen()));

                          }
                        },
                        child: Text("Submit"))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
