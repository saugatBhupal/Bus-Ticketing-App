import 'package:flutter/material.dart';

class Bookingscreen extends StatefulWidget {
  const Bookingscreen({super.key});

  @override
  State<Bookingscreen> createState() => _BookingscreenState();
}

class _BookingscreenState extends State<Bookingscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: double.infinity,
        leading: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              Text(
                "Saugat Tickets",
                style: TextStyle(
                  color: Color.fromRGBO(0, 27, 108, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: const Text(
                "Book Your Ticket",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 44,
                  height: 1.2,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text(
                "Pick the destination and number of passengers",
                style: TextStyle(
                  color: Color.fromRGBO(113, 108, 108, 1),
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
