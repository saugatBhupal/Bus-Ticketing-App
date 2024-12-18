import 'package:bus_ticketing_app/widget/button/dark_rounded_button.dart';
import 'package:bus_ticketing_app/widget/input/date_field.dart';
import 'package:bus_ticketing_app/widget/input/location_dropdown.dart';
import 'package:flutter/material.dart';

class Bookingscreen extends StatefulWidget {
  const Bookingscreen({super.key});

  @override
  State<Bookingscreen> createState() => _BookingscreenState();
}

class _BookingscreenState extends State<Bookingscreen> {
  final from = "Butwal";
  String? destination;
  final TextEditingController _paxController = TextEditingController();
  final TextEditingController _farePerPersonController =
      TextEditingController(text: "Rs.0");
  final List<String> destinationList = <String>[
    'Pokhara',
    'Kathmandu',
    'Chitwan'
  ];
  final Map<String, int> tripToPriceMapper = {
    "Pokhara": 800,
    "Kathmandu": 1200,
    "Chitwan": 600,
  };

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
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: LocationDropdown(
                  label: "From",
                  selectedItem: "Butwal",
                  items: const <String>["Butwal"],
                  onChanged: (value) => {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: LocationDropdown(
                  selectedItem: destinationList[0],
                  label: "Destination",
                  items: destinationList,
                  onChanged: (value) => {
                    destination = value,
                    _farePerPersonController.text =
                        tripToPriceMapper[destination].toString(),
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText:
                              "Fare Per Person", // Use `labelText` for the label to appear properly
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                        ),
                        controller: _farePerPersonController,
                        readOnly: true,
                        autofocus: true,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              int.parse(value) < 1) {
                            return "Minimum ticket : 1";
                          }
                          if (int.parse(value) > 5) {
                            return "Maximum ticket : 5";
                          }
                          return null;
                        },
                        controller: _paxController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: "1",
                          label: Text(
                            "PAX",
                            textAlign: TextAlign.center,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          )),
                        ),
                        autofocus: true,
                        onChanged: (value) => {
                          _paxController.text = value,
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: DateField(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: DarkRoundedButton(
                  title: "Book Now",
                  onPressed: () {
                    // calculateFareAndMutate();
                    // navigate();
                  },
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  calculateFare() {
    return ("${tripToPriceMapper[destination]! * int.parse(_paxController.text)}");
  }
}
