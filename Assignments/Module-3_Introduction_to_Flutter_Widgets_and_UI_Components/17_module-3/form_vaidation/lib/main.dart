import 'package:flutter/material.dart';
import 'package:form_vaidation/success.dart';

void main() {
  runApp(
    MaterialApp(home: Form_Validation(), debugShowCheckedModeBanner: false),
  );
}

class Form_Validation extends StatefulWidget {
  const Form_Validation({super.key});

  @override
  State<Form_Validation> createState() => _Form_ValidationState();
}

String? name, email, number;
TextEditingController password = TextEditingController();
final GlobalKey<FormState> formkey = GlobalKey<FormState>();

class _Form_ValidationState extends State<Form_Validation> {
  void dialog() {
    showDialog(
      context: context,
      builder: (builder) {
        return AlertDialog(
          title: Text('Successfully'),
          elevation: 5,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context)=> success()));
              },
              child: Text('ok'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Registration Form',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 168, 205, 241),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Royal Industry',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Color.fromARGB(255, 168, 205, 241),
                  child: Icon(
                    Icons.directions_bike_rounded,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.name,

                    validator: (values) {
                      if (values!.isEmpty) {
                        return 'Please Enter Your Email id';
                      }
                      return null;
                    },
                    onSaved: (values) {
                      name = values;
                    },
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person, color: Colors.white),

                      hintText: 'Enter your Full Name',
                      hintStyle: TextStyle(
                        color: Color.fromARGB(125, 120, 123, 126),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      label: Text(
                        'Full Name',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    validator: (values) {
                      if (values!.isEmpty) {
                        return 'Please Enter Your Name';
                      }
                      if (!RegExp(
                        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$",
                      ).hasMatch(values)) {
                        return 'Please Enter Valid Email id';
                      }
                      return null;
                    },
                    onSaved: (values) {
                      email = values;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email, color: Colors.white),
                      hintText: 'Enter your Email',
                      hintStyle: TextStyle(
                        color: Color.fromARGB(125, 120, 123, 126),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      label: Text(
                        'Email',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: password,
                    validator: (values) {
                      if (values!.isEmpty) {
                        return 'Please Enter your Password';
                      }
                      if (!RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                      ).hasMatch(values)) {
                        return 'Please Enter Valid Password';
                      }
                      return null;
                    },
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password, color: Colors.white),
                      hintText: 'Enter Your Password',
                      hintStyle: TextStyle(
                        color: Color.fromARGB(125, 120, 123, 126),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      label: Text(
                        'Password',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.number,
                    validator: (values) {
                      if (values!.isEmpty) {
                        return 'Please Enter Your Mobile Number';
                      }
                      if (!RegExp(r'^\d{10}$').hasMatch(values)) {
                        return 'Please Enter Valid Mobile Number';
                      }
                      return null;
                    },
                    onSaved: (values) {
                      number = values;
                    },
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.numbers_outlined,
                        color: Colors.white,
                      ),
                      hintText: 'Enter your Phone Number',
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 106, 107, 110),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      label: Text(
                        'Mobile.No.',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      return dialog();
                    } else {
                      print('unsuccessfull');
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    elevation: 4,
                    side: BorderSide(color: Colors.white),
                  ),
                  child: Text(
                    'Submit..',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
