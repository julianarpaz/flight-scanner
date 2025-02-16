class Flight {
  final String duration;
  final String airline;
  final String flightNumber;
  final String departure;
  final String departureAirport;
  final String arrival;
  final String arrivalAirport;

  Flight({
    required this.duration,
    required this.airline,
    required this.flightNumber,
    required this.departure,
    required this.departureAirport,
    required this.arrival,
    required this.arrivalAirport,
  });

  factory Flight.fromJson(Map<String, dynamic> json) {
    return Flight(
      duration: json["duration"],
      airline: json["airline"],
      flightNumber: json["flightNumber"],
      departure: json["departure"],
      departureAirport: json["departureAirport"],
      arrival: json["arrival"],
      arrivalAirport: json["arrivalAirport"],
    );
  }
}
