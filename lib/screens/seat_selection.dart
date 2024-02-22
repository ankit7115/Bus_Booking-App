import 'dart:ffi';

import 'package:bus_booking/screens/confirm_screen.dart';
import 'package:flutter/material.dart';

class SeatSelectionPage extends StatefulWidget {
  @override
  _SeatSelectionPageState createState() => _SeatSelectionPageState();
}

class _SeatSelectionPageState extends State<SeatSelectionPage> {
  final List<bool> _seatSelected = List.generate(21, (index) => false);
  List<String> _selectedSeats = []; // List to store the selected seat numbers

  void _toggleSeatSelection(int index) {
    setState(() {
      _seatSelected[index] = !_seatSelected[index];
      int row = index ~/ 3 + 1;
      int col = index % 3 + 1;

      // Convert the row index to a letter ('A', 'B', 'C', ...)
      String rowLetter = String.fromCharCode('A'.codeUnitAt(0) + row - 1);

      // Construct the seat number (e.g., 'A1', 'A2', ...)
      String _seatNumber = rowLetter + col.toString();
      if (_seatSelected[index]) {
        _selectedSeats.add(_seatNumber); // Add selected seat number
      } else {
        _selectedSeats.remove(_seatNumber); // Remove deselected seat number
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_circle_left),
          onPressed: () {
            Navigator.pop(context);
          }),
        title: Text('Seat Plan'),
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 20,
                width: 20,
                color: Colors.red[400],
              ),
              SizedBox(width: 5),
              Text("Booked"),
              SizedBox(width: 25),
              Container(
                height: 20,
                width: 20,
                color: Colors.grey[400],
              ),
              SizedBox(width: 5),
              Text("Available"),
              SizedBox(width: 10),
            ],
          ),
          SizedBox(height: 30),
          Text(
              "Selected Seats: ${_selectedSeats.join(', ')}"), // Display selected seat numbers
          Padding(
            padding: EdgeInsets.all(30),
            child: Container(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: _selectedSeats.isNotEmpty
                    ? [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ]
                    : null,
              ),
              child: Column(
                children: [
                  Text(
                    "FRONT",
                    style: TextStyle(color: Colors.grey[400], fontSize: 30),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Divider(
                    height: 1, // Thickness of the divider
                    color: Colors.grey, // Color of the divider
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 500,
                    width: 400,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 40.0, // reduced cross axis spacing
                        mainAxisSpacing: 20.0, // reduced main axis spacing
                        childAspectRatio: 1.1, // adjust child aspect ratio
                      ),
                      itemCount: _seatSelected
                          .length, // Update itemCount to match the length of _seatSelected list
                      itemBuilder: (context, index) {
                        int row = index ~/ 3 + 1;
                        int col = index % 3 + 1;

                        // Convert the row index to a letter ('A', 'B', 'C', ...)
                        String rowLetter =
                            String.fromCharCode('A'.codeUnitAt(0) + row - 1);

                        // Construct the seat number (e.g., 'A1', 'A2', ...)
                        String _seatnumber = rowLetter + col.toString();

                        return GestureDetector(
                          onTap: () {
                            _toggleSeatSelection(index);
                          },
                          child: Container(
                            height: 50, // reduced height
                            width: 50, // reduced width
                            decoration: BoxDecoration(
                              color: _seatSelected[index]
                                  ? Colors.green
                                  : Colors.grey[500],
                              borderRadius: BorderRadius.circular(
                                  5), // reduced border radius
                            ),
                            child: Center(
                              child: Text(
                                _seatnumber,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          // SizedBox(height: 20,),
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 56, 56, 56)),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ConfirmPage()));
            },
            child: Text("NEXT",style: TextStyle(color: Colors.grey[400]),),
          )
        ],
      ),
    );
  }
}
