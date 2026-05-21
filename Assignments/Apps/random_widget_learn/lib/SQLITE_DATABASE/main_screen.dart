import 'package:flutter/material.dart';
import 'package:random_widget_learn/SQLITE_DATABASE/database_helper.dart';
import 'package:random_widget_learn/SQLITE_DATABASE/user_model.dart';
import 'package:random_widget_learn/howdatabase__create/one_more_time/second_main_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  DataBaseHelper dataBaseHelper = DataBaseHelper();
  List<UserModel> userdata = [];

  TextEditingController idcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loaddata();
  }

  Future<void> loaddata() async {
    final data = await dataBaseHelper.readdata();
    setState(() {
      userdata = data;
    });
  }

  Future<void> insertdata() async {
    await dataBaseHelper.insertdata(
      UserModel(
        name: namecontroller.text,
        age: int.parse(agecontroller.text),
        id: int.parse(idcontroller.text),
      ),
    );
    idcontroller.clear();
    namecontroller.clear();
    agecontroller.clear();
    loaddata();
  }

  Future<void> updatedata() async {
    // namecontroller = userdata[index].name;
    await dataBaseHelper.updatedata(
      UserModel(
        name: namecontroller.text,
        age: int.parse(agecontroller.text),
        id: int.parse(idcontroller.text),
      ),
    );
    idcontroller.clear();
    namecontroller.clear();
    agecontroller.clear();
    loaddata();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQuerydata = MediaQuery.of(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.maxFinite, 80),
        child: Container(
          width: double.maxFinite,
          height: 70,
          margin: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(80),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(5, 5),
              ),
            ],
            gradient: const LinearGradient(
              colors: [Colors.white, Colors.tealAccent, Colors.teal],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(21),
            border: Border.all(width: 2, color: Colors.black),
          ),
          child: const Row(
            children: [
              BackButton(color: Colors.black),
              Text(
                'SQLite DataBase Learn',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 244, 221, 183),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(3),
              padding: EdgeInsets.all(10),
              width: double.maxFinite,
              height: MediaQuerydata.size.height * 0.30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(21),
                border: Border.all(width: 2, color: Colors.black),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTextField(idcontroller, 'Id:', TextInputType.number),
                  _buildTextField(namecontroller, 'Name:', TextInputType.text),
                  _buildTextField(agecontroller, 'Age:', TextInputType.number),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildButton('Insert', insertdata),
                      _buildButton('Update', updatedata),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(3),
              padding: EdgeInsets.all(10),
              width: double.maxFinite,
              height: MediaQuerydata.size.height * 0.30,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 200, 244, 243),
                borderRadius: BorderRadius.circular(21),
                border: Border.all(width: 2, color: Colors.black),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: userdata.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(21),
                      border: Border.all(width: 2, color: Colors.black),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          '${userdata[index].id}',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        backgroundColor: Color.fromARGB(255, 200, 244, 243),
                      ),
                      title: Text(
                        'Name: ${userdata[index].name}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('age: ${userdata[index].age}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              dataBaseHelper.deletedata(userdata[index].id);
                              loaddata();
                            },
                            icon: Icon(Icons.delete),
                          ),
                          IconButton(
                            onPressed: () {
                              idcontroller.text = userdata[index].id.toString();
                              namecontroller.text = userdata[index].name;
                              agecontroller.text = userdata[index].age
                                  .toString();
                            },
                            icon: Icon(Icons.edit),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountScreen()),
                  );
                });
              },
              child: Container(
                width: double.maxFinite,
                height: MediaQuerydata.size.height * 0.10,
                margin: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 239, 225, 171),
                  borderRadius: BorderRadius.circular(21),
                  border: Border.all(width: 2, color: Colors.black),
                ),
                child: Center(
                  child: Text(
                    'One more time learn Sqlite \ntap on the button',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label,
    TextInputType type,
  ) {
    return TextField(
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.black, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.black, width: 2),
        ),
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.black, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
