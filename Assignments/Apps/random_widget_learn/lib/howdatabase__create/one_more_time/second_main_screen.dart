import 'package:flutter/material.dart';

import 'accountmodel.dart';
import 'databasehelper.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  DatabaseInstance databaseInstance = DatabaseInstance();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController amountcontroller = TextEditingController();
  List<Accountmodel> accountmodel = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loaddata();
  }

  void loaddata() async {
    var data = await databaseInstance.readdata();
    setState(() {
      accountmodel = data;
    });
  }

  void insertdata() async {
    await databaseInstance.insert(
      Accountmodel(
        buy: namecontroller.text,
        rupes: int.parse(amountcontroller.text),
      ),
    );
    namecontroller.clear();
    amountcontroller.clear();
    loaddata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Database'), backgroundColor: Colors.teal),
      body: Column(
        children: [
          TextField(
            controller: namecontroller,
            decoration: InputDecoration(hintText: 'enter name'),
          ),
          SizedBox(height: 10),
          TextField(
            controller: amountcontroller,
            decoration: InputDecoration(hintText: 'enter amount'),
          ),
          SizedBox(height: 10),
          ElevatedButton(onPressed: insertdata, child: Text('Insert data')),
          ListView.builder(
            shrinkWrap: true,
            itemCount: accountmodel.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text(accountmodel[index].id.toString()),
                ),
                title: Text(accountmodel[index].buy),
                subtitle: Text(accountmodel[index].rupes.toString()),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () async {
                        await databaseInstance.delete(accountmodel[index].id!);
                        setState(() {
                          loaddata();
                        });
                      },
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                    IconButton(
                      onPressed: () async {
                        namecontroller.text = accountmodel[index].buy;
                        amountcontroller.text = accountmodel[index].rupes
                            .toString();
                        await databaseInstance.update(
                          Accountmodel(
                            buy: namecontroller.text,
                            id: index,
                            rupes: int.parse(amountcontroller.text),
                          ),
                        );
                        namecontroller.clear();
                        amountcontroller.clear();
                        loaddata();
                      },
                      icon: Icon(Icons.edit, color: Colors.greenAccent),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
