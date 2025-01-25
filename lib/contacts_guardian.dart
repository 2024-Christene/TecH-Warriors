import 'package:flutter/material.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  List<Map<String, String>> guardians = []; // List to store guardian details

  // Function to show the Add Guardian form
  void _showAddGuardianForm() {
    final nameController = TextEditingController();
    final addressController = TextEditingController();
    final emailController = TextEditingController();
    final phoneController = TextEditingController();
    final occupationController = TextEditingController();
    final dobController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Guardian'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: addressController,
                  decoration: InputDecoration(labelText: 'Address'),
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: phoneController,
                  decoration: InputDecoration(labelText: 'Phone Number'),
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: occupationController,
                  decoration: InputDecoration(labelText: 'Occupation'),
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: dobController,
                  decoration:
                      InputDecoration(labelText: 'Date of Birth (DD/MM/YYYY)'),
                  keyboardType: TextInputType.datetime,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Add the guardian details to the list
                setState(() {
                  guardians.add({
                    'name': nameController.text,
                    'address': addressController.text,
                    'email': emailController.text,
                    'phone': phoneController.text,
                    'occupation': occupationController.text,
                    'dob': dobController.text,
                  });
                });
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Add Guardian'),
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
        title: Text('Guardians'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Expanded(
            child: guardians.isEmpty
                ? Center(
                    child: Text(
                      'No guardians added yet. Click on "Add Guardian" to start.',
                      style: TextStyle(fontSize: 16.0),
                      textAlign: TextAlign.center,
                    ),
                  )
                : ListView.builder(
                    itemCount: guardians.length,
                    itemBuilder: (context, index) {
                      final guardian = guardians[index];
                      return Card(
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        child: ListTile(
                          title: Text(guardian['name'] ?? ''),
                          subtitle: Text(
                            'Address: ${guardian['address']}\n'
                            'Email: ${guardian['email']}\n'
                            'Phone: ${guardian['phone']}\n'
                            'Occupation: ${guardian['occupation']}\n'
                            'DOB: ${guardian['dob']}',
                          ),
                          isThreeLine: true,
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _showAddGuardianForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text(
                'Add Guardian',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
