import 'package:flutter/material.dart';
import 'modelclass/businessmodel.dart';
import '../database/databasefile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DatabaseInsert(),
    );
  }
}

class DatabaseInsert extends StatefulWidget {
  const DatabaseInsert({super.key});

  @override
  State<DatabaseInsert> createState() => _DatabaseInsertState();
}

class _DatabaseInsertState extends State<DatabaseInsert> {
  final _formKey = GlobalKey<FormState>();
  final _businessmanname = TextEditingController();
  final _businessname = TextEditingController();
  final _businessdetail = TextEditingController();
  final _businessid = TextEditingController();

  // Define the database handler
  final databasehandler dbHandler = databasehandler();

  @override
  void dispose() {
    _businessmanname.dispose();
    _businessname.dispose();
    _businessdetail.dispose();
    _businessid.dispose();
    super.dispose();
  }

  void _submitData({bool isUpdate = false}) async {
    // 1. Trigger validation
    if (_formKey.currentState!.validate()) {
      // 2. If valid, create the model
      final business = Businessmodel(
        businessname: _businessname.text,
        businessdetail: _businessdetail.text,
        id: int.tryParse(_businessid.text),
        businessmanname: _businessmanname.text,
      );

      // 3. Save or Update in database
      if (isUpdate) {
        await dbHandler.updateinformation(business);
      } else {
        await dbHandler.addinformation(business);
      }

      // 4. Feedback and cleanup
      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              isUpdate ? 'Business Updated Successfully' : 'Business Data Saved',
            ),
          ),
        );

        _clearFields();
        setState(() {});
      }
    }
  }

  void _clearFields() {
    _businessmanname.clear();
    _businessname.clear();
    _businessdetail.clear();
    _businessid.clear();
  }

  void showbottom({Businessmodel? business}) {
    bool isUpdate = business != null;

    if (isUpdate) {
      // Pre-fill fields for update
      _businessmanname.text = business.businessmanname;
      _businessname.text = business.businessname;
      _businessdetail.text = business.businessdetail;
      _businessid.text = business.id.toString();
    } else {
      _clearFields();
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 16,
          ),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _businessmanname,
                    decoration: const InputDecoration(
                      labelText: 'Businessman Name',
                    ),
                    validator: (value) =>
                        (value == null || value.isEmpty)
                            ? 'Please enter name'
                            : null,
                  ),
                  TextFormField(
                    controller: _businessname,
                    decoration: const InputDecoration(
                      labelText: 'Business Name',
                    ),
                    validator: (value) =>
                        (value == null || value.isEmpty)
                            ? 'Please enter business name'
                            : null,
                  ),
                  TextFormField(
                    controller: _businessdetail,
                    decoration: const InputDecoration(
                      labelText: 'Business Detail',
                    ),
                    validator: (value) =>
                        (value == null || value.isEmpty)
                            ? 'Please enter details'
                            : null,
                  ),
                  TextFormField(
                    controller: _businessid,
                    keyboardType: TextInputType.number,
                    enabled: !isUpdate, // Usually don't update the primary key
                    decoration: const InputDecoration(
                      labelText: 'Business ID',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return 'Please enter ID';
                      if (int.tryParse(value) == null)
                        return 'Enter a valid number';
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _submitData(isUpdate: isUpdate),
                    child: Text(isUpdate ? 'Update' : 'Submit'),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ROYAL BUSINESS'),
        actions: [
          IconButton(
            onPressed: () => showbottom(),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder<List<Businessmodel>>(
        future: dbHandler.readinformation(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error :- ${snapshot.error} '));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No Business Data Found'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final item = snapshot.data![index];
              return InkWell(
                onDoubleTap: () => showbottom(business: item),
                onLongPress: () async {
                  await dbHandler.deletedata(item.id!);
                  setState(() {});
                },
                child: Card(
                  child: ListTile(
                    leading: CircleAvatar(child: Text(item.id.toString())),
                    title: Text(item.businessname),
                    isThreeLine: true,
                    subtitle: Text(
                      "Businessman Name: ${item.businessmanname}\nBusiness Detail: ${item.businessdetail}",
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
