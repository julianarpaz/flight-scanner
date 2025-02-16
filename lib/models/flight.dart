class Flight {
  final String duration;
  final String airline;
  final String flightNumber;
  final String departure;
  final String departureAirport;
  final String departureTime;
  final String arrival;
  final String arrivalAirport;
  final String arrivalTime;

  Flight({
    required this.duration,
    required this.airline,
    required this.flightNumber,
    required this.departure,
    required this.departureAirport,
    required this.departureTime,
    required this.arrival,
    required this.arrivalAirport,
    required this.arrivalTime,
  });

  factory Flight.fromJson(Map<String, dynamic> json) {
    return Flight(
      duration: json["duration"],
      airline: json["airline"],
      flightNumber: json["flightNumber"],
      departure: json["departure"],
      departureAirport: json["departureAirport"],
      departureTime: json["departure"] ?? "Horário de decolagem disponível",
      arrival: json["arrival"],
      arrivalAirport: json["arrivalAirport"],
      arrivalTime: json["arrival"] ?? "Previsão de chegada não disponível",
    );
  }
}
