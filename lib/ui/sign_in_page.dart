import 'package:flutter/material.dart';
import 'package:gym_application/components/text_form_field.dart';
import 'package:gym_application/ui/log_in_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  String? _membershipType = 'Basic';
  final List<String> _membershipOptions = ['Basic', 'Premium', 'VIP'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://brandwin.in/wp-content/uploads/2024/09/GYM-SHAKER-2.png"),
                fit: BoxFit.cover)),


          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 150,
                    ),
                    Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    CustomTextFormField(
                      hintText: "Full Name",
                      icon: Icons.person,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name'; // Validation if name is empty
                        }
                        return null; // If valid
                      },
                    ),
                    CustomTextFormField(
                      hintText: "Enter your email",
                      icon: Icons.email,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                            .hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    CustomTextFormField(
                      hintText: "Enter your Password",
                      icon: Icons.password,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password'; // Validation if password is empty
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters long'; // Password length check
                        }
                        return null; // If valid
                      },
                    ),
                    CustomTextFormField(
                      hintText: "Contact Number",
                      icon: Icons.contact_page_outlined,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your contact number';
                        } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                          return 'Please enter a valid 10-digit phone number';
                        }
                        return null;
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: DropdownButtonFormField<String>(
                        value: _membershipType,
                        decoration: InputDecoration(
                          labelText: "Select Membership Type",
                          prefixIcon: Icon(Icons.card_membership),
                          border: OutlineInputBorder(),
                        ),
                        items: _membershipOptions.map((String membership) {
                          return DropdownMenuItem(
                            value: membership,
                            child: Text(membership),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _membershipType = newValue!;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a membership type';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LogInPage()));
                      },
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have a account ? "),
                            // SizedBox(width: 10,),
                            Text(
                              "Log In",
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Successfully Signed In'),
                                duration: Duration(
                                    seconds:
                                        2), // The duration the snackbar will be visible
                              ),
                            );

                            // After the Snackbar is shown, navigate to the LogInPage
                            Future.delayed(Duration(seconds: 2), () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LogInPage()),
                              );
                            });
                          } else {
                            print("Form is invalid");
                          }
                        },
                        child: Text("Submit"))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    )));
  }
}
