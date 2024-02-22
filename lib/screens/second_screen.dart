import 'package:bus_booking/screens/seat_selection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ShowBus extends StatefulWidget {
  ShowBus(
      {super.key,
      required this.selectedSource,
      required this.selectedDestination,
      required this.selectedDate});
  String selectedSource = "";
  String selectedDestination = "";
  DateTime? selectedDate;
  @override
  State<ShowBus> createState() => _ShowBusState();
}

class _ShowBusState extends State<ShowBus> {
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
        title: const Text("Showing results"),
      ),
      body: Column(
        children: [
          Text(
            "Showing results for ${widget.selectedSource} to ${widget.selectedDestination} on \n ${DateFormat('dd/MM/yyyy').format(widget.selectedDate!)}",
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Selected Source: ${widget.selectedSource}"),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Selected Destination: ${widget.selectedDestination}"),
            ),
          ),
          SizedBox(height: 400),
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 56, 56, 56)),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SeatSelectionPage()));
            },
            child: Text("NEXT",style: TextStyle(color: Colors.grey[400]),),
          )
        ],
      ),
    );
  }
}
