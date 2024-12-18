import 'package:bus_ticketing_app/model/ticket.dart';
import 'package:flutter/material.dart';

class Billingscreen extends StatelessWidget {
  final Ticket ticket;
  const Billingscreen({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 248, 248, 1),
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
                      color: const Color.fromRGBO(0, 0, 0, 0.5),
                    ),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: SizedBox(
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                ticket.from,
                                style: const TextStyle(
                                  color: Color.fromRGBO(0, 27, 108, 1),
                                  fontSize: 22,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: const Color.fromRGBO(0, 27, 108, 1),
                                  ),
                                  height: 5,
                                  width: 32,
                                ),
                              ),
                              Text(
                                ticket.destination,
                                style: const TextStyle(
                                  color: Color.fromRGBO(0, 27, 108, 1),
                                  fontSize: 22,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Passengers",
                                    style: TextStyle(
                                      color: Color.fromRGBO(113, 108, 108, 1),
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    "${ticket.pax} Adults",
                                    style: const TextStyle(
                                      color: Color.fromRGBO(0, 27, 108, 1),
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  const Text(
                                    "Departure",
                                    style: TextStyle(
                                      color: Color.fromRGBO(113, 108, 108, 1),
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    ticket.departure,
                                    style: const TextStyle(
                                      color: Color.fromRGBO(0, 27, 108, 1),
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Text(
                                "Total:",
                                style: TextStyle(
                                  color: Color.fromRGBO(113, 108, 108, 1),
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                ticket.price.toString(),
                                style: const TextStyle(
                                  color: Color.fromRGBO(0, 27, 108, 1),
                                  fontSize: 22,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
