import 'package:bus_ticketing_app/model/ticket.dart';
import 'package:flutter/material.dart';

class Billingscreen extends StatelessWidget {
  final Ticket ticket;
  const Billingscreen({super.key, required this.ticket});

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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: const Text(
                    "Successful",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 44,
                      height: 1.2,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Text(
                    "Your ticket has been booked. Look below for your billing details.",
                    style: TextStyle(
                      color: Color.fromRGBO(113, 108, 108, 1),
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 0.4,
                      color: const Color.fromRGBO(0, 0, 0, 10),
                    ),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            ticket.from,
                          ),
                          Container(
                            height: 5,
                            width: 32,
                            color: Colors.black,
                          ),
                          Text(
                            ticket.destination,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              const Text(
                                "Passengers",
                              ),
                              Text(
                                "${ticket.pax} Adults",
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Text(
                                "Passengers",
                              ),
                              Text(
                                "${ticket.pax} Adults",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
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
