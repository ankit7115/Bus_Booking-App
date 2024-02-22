import 'package:flutter/material.dart';

class ConfirmPage extends StatefulWidget {
  const ConfirmPage({Key? key}) : super(key: key);

  @override
  State<ConfirmPage> createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed.
    _nameController.dispose();
    _numberController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_circle_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Confirm Booking"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Please Provide your information",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(35, 10, 35, 0),
              child: Container(
                color: const Color.fromARGB(255, 65, 65, 65),
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 40,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Enter your name',
                        ),
                        onChanged: (value) {
                          setState(() {
                            // Handle name changes
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(35, 5, 35, 0),
              child: Container(
                color: const Color.fromARGB(255, 65, 65, 65),
                child: Row(
                  children: [
                    Icon(
                      Icons.phone,
                      size: 40,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: _numberController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Enter your phone number',
                        ),
                        onChanged: (value) {
                          setState(() {
                            // Handle phone number changes
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(35, 5, 35, 20),
              child: Container(
                color: const Color.fromARGB(255, 65, 65, 65),
                child: Row(
                  children: [
                    Icon(
                      Icons.email,
                      size: 40,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Enter your Email',
                        ),
                        onChanged: (value) {
                          setState(() {
                            // Handle email changes
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Booking Info",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Container(
                color: const Color.fromARGB(255, 65, 65, 65),
                height: 275,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Customer Name : " + _nameController.text, style: TextStyle(fontSize: 20)),
                    Text("Mobile Number : " + _numberController.text, style: TextStyle(fontSize: 20)),
                    Text("Email Address : " + _emailController.text, style: TextStyle(fontSize: 20)),
                    Text("Route : ", style: TextStyle(fontSize: 20)),
                    Text("Departure date : ", style: TextStyle(fontSize: 20)),
                    Text("Ticket Price : ", style: TextStyle(fontSize: 20)),
                    Text("Total Seats : ", style: TextStyle(fontSize: 20)),
                    Text("Seat Numbers : ", style: TextStyle(fontSize: 20)),
                    Text("Discount : ", style: TextStyle(fontSize: 20)),
                    Text("Processing fee : ", style: TextStyle(fontSize: 20)),
                    Text("Grand Total : ", style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green[500]),
                ),
                onPressed: () {
                  // Handle booking confirmation
                },
                child: Container(
                  width: double.infinity,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text("Confirm Booking"),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
