class Ticket {
  final String from;
  final String destination;
  final int pax;
  final String departure;
  final double price;

  Ticket(
      {required this.from,
      required this.departure,
      required this.pax,
      required this.destination,
      required this.price});
}
