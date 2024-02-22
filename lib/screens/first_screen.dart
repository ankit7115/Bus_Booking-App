import 'package:bus_booking/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String selectedSource = "";
  String selectedDestination = "";
  DateTime selectedDate = DateTime.now();
  List<String> cities = [
    "Istanbul",
    "Seria",
    "Dhaka",
    "Pondecherry",
    "Kashmir"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: const Text("Search"),
        // centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DropdownButton<String>(
              isExpanded: true,
              value: selectedSource.isNotEmpty ? selectedSource : null,
              hint: const Text('Select Source City'),
              onChanged: (value) {
                setState(() {
                  selectedSource = value ?? '';
                });
              },
              items: cities
                  .where((city) => city != selectedDestination)
                  .map((city) {
                return DropdownMenuItem<String>(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              isExpanded: true,
              value:
                  selectedDestination.isNotEmpty ? selectedDestination : null,
              hint: const Text("Select Destination City"),
              onChanged: (value) {
                if (value != selectedSource) {
                  setState(() {
                    selectedDestination = value ?? '';
                  });
                }
              },
              items: cities.where((city) => city != selectedSource).map((city) {
                return DropdownMenuItem<String>(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () async {
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null && pickedDate != selectedDate) {
                      setState(() {
                        selectedDate = pickedDate;
                      });
                    }
                  },
                  child: const Text('Select Departure Date'),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    selectedDate != null
                        ? "${DateFormat('dd/MM/yyyy').format(selectedDate!)}"
                        : DateFormat('dd/MM/yyyy').format(DateTime.now()),
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                    Size(250, 40)), // Set the minimum size
              ),
              onPressed: () {
                if (selectedDestination.isEmpty ||
                    selectedDestination.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                          'Please select both source and destination cities.'),
                    ),
                  );
                } else{
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShowBus(
                              selectedSource: selectedSource,
                              selectedDestination: selectedDestination,
                              selectedDate: selectedDate)));
                }
              },
              child: const Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}
