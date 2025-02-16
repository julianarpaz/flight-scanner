import 'package:flight_scanner/utils/colors.dart';
import 'package:flutter/material.dart';
import '../services/lufthansa_api_service.dart';
import '../models/flight.dart';
import '../utils/airlines_data.dart';
import 'package:intl/intl.dart';

class SearchResultsPage extends StatefulWidget {
  final String origin;
  final String destination;
  final String departureDate;

  const SearchResultsPage({
    required this.origin,
    required this.destination,
    required this.departureDate,
  });

  @override
  _SearchResultsPageState createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  final LufthansaApiService apiService = LufthansaApiService();
  List<Flight> flights = [];
  bool isLoading = false;

  void searchFlights() async {
    setState(() => isLoading = true);

    try {
      List<Map<String, dynamic>> response = await apiService.getFlightSchedules(
          widget.origin, widget.destination, widget.departureDate);
      setState(() {
        flights = response.map((data) => Flight.fromJson(data)).toList();
        isLoading = false;
      });
    } catch (e) {
      print("Erro ao buscar voos: $e");
      setState(() => isLoading = false);
    }
  }

  String formatDuration(String duration) {
    final regex = RegExp(r'PT(?:(\d+)H)?(?:(\d+)M)?');
    final match = regex.firstMatch(duration);

    if (match != null) {
      final hours = match.group(1) ?? "0";
      final minutes = match.group(2) ?? "0";

      if (hours != "0" && minutes != "0") {
        return "$hours horas e $minutes minutos";
      } else if (hours != "0") {
        return "$hours horas";
      } else {
        return "$minutes minutos";
      }
    }
    return "Duração desconhecida";
  }

  String formatFlightTime(String departure, String arrival) {
    print("Departure: ${departure}");
    print("Arrival: ${arrival}");
    try {
      // Converte as strings para objetos DateTime
      DateTime departureTime = DateTime.parse(departure);
      DateTime arrivalTime = DateTime.parse(arrival);

      // Formata as horas e minutos
      String formattedDeparture = DateFormat('HH\'h\'mm').format(departureTime);
      String formattedArrival = DateFormat('HH\'h\'mm').format(arrivalTime);

      // Retorna o horário formatado no padrão desejado
      return "- $formattedDeparture - $formattedArrival";
    } catch (e) {
      print("Erro ao formatar horário: $e");
      return "";
    }
  }

  @override
  void initState() {
    super.initState();
    searchFlights();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: customSwatch,
        title: Text("${widget.origin} - ${widget.destination}"),
        centerTitle: true,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : flights.isEmpty
              ? Center(child: Text("Nenhum voo encontrado."))
              : ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemCount: flights.length,
                  itemBuilder: (context, index) {
                    final flight = flights[index];

                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 3,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Destino e Companhia Aérea
                            Text(
                              "Previsão ${formatFlightTime(flight.departureTime, flight.arrivalTime)}",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "${getAirlineName(flight.airline)} - Voo ${flight.flightNumber}",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black87),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Duração: ${formatDuration(flight.duration)}",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                            SizedBox(height: 10),
                            Divider(),
                            SizedBox(height: 10),
                            // Botões de Ação
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: customSwatch,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    "Get Prices",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    foregroundColor: Color(0xFF1E88E5),
                                  ),
                                  child: Text("Details"),
                                ),
                                IconButton(
                                  icon: Icon(Icons.favorite_border,
                                      color: Color(0xFF1E88E5)),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
