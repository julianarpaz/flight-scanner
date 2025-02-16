final Map<String, String> airlineNames = {
  "DL": "Delta Airlines",
  "LA": "LATAM Airlines",
  "AA": "American Airlines",
  "G3": "GOL Linhas Aéreas",
  "AF": "Air France",
  "LH": "Lufthansa",
  "EK": "Emirates",
  "QR": "Qatar Airways",
  "JL": "Japan Airlines",
  "BA": "British Airways",
  "CM": "Copa Airlines",
  "IB": "Iberia",
  "AZ": "Alitalia",
  "TK": "Turkish Airlines",
  "UX": "Air Europa",
  "AV": "Avianca",
  "AD": "Azul Linhas Aéreas",
  "AR": "Aerolíneas Argentinas",
  "AM": "Aeroméxico",
  "AC": "Air Canada",
  "NH": "All Nippon Airways",
  "TP": "TAP Air Portugal",
};

String getAirlineName(String code) {
  return airlineNames[code] ?? code;
}
