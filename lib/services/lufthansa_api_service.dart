import 'dart:convert';
import 'package:http/http.dart' as http;

class LufthansaApiService {
  final String clientId = "<client_id>";
  final String clientSecret = "<client-secret>";
  String? accessToken;

  Future<void> getAccessToken() async {
    final url = Uri.parse("https://api.lufthansa.com/v1/oauth/token");
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
      body: {
        "client_id": clientId,
        "client_secret": clientSecret,
        "grant_type": "client_credentials"
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      accessToken = data["access_token"];
      print("Access Token Obtido: $accessToken");
    } else {
      throw Exception("Falha ao obter token: ${response.body}");
    }
  }

  Future<List<Map<String, dynamic>>> getFlightSchedules(String origin, String destination, String date) async {
    if (accessToken == null) {
      await getAccessToken();
    }

    final url = Uri.parse("https://api.lufthansa.com/v1/operations/schedules/$origin/$destination/$date?directFlights=1");

    final response = await http.get(
      url,
      headers: {
        "Authorization": "Bearer $accessToken",
        "Accept": "application/json"
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> schedules = data["ScheduleResource"]["Schedule"];

      List<Map<String, dynamic>> flights = schedules.map((flight) {
        return {
          "duration": flight["TotalJourney"]["Duration"],
          "airline": flight["Flight"]["MarketingCarrier"]["AirlineID"],
          "flightNumber": flight["Flight"]["MarketingCarrier"]["FlightNumber"],
          "departure": flight["Flight"]["Departure"]["ScheduledTimeLocal"]["DateTime"],
          "departureAirport": flight["Flight"]["Departure"]["AirportCode"],
          "arrival": flight["Flight"]["Arrival"]["ScheduledTimeLocal"]["DateTime"],
          "arrivalAirport": flight["Flight"]["Arrival"]["AirportCode"],
        };
      }).toList();

      return flights;
    } else {
      throw Exception("Erro ao buscar voos: ${response.body}");
    }
  }
}
