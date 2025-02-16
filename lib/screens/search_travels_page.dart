import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'search_results_page.dart';

class SearchTravelsPage extends StatefulWidget {
  @override
  _SearchTravelsPageState createState() => _SearchTravelsPageState();
}

class _SearchTravelsPageState extends State<SearchTravelsPage> {
  String tripType = "Round Trip"; // Tipo de viagem padrão
  DateTime? departureDate;
  DateTime? returnDate;
  final TextEditingController originController = TextEditingController();
  final TextEditingController destinationController = TextEditingController();

  Future<void> _selectDate(BuildContext context, Function(DateTime) onDateSelected) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Flights"),
        backgroundColor: const Color(0xFF0CC0DF),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Botões de seleção de tipo de viagem
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _tripTypeButton("One Way"),
                ],
              ),
              const SizedBox(height: 16),

              // Campos de entrada de origem e destino
              _textField("Origin", originController),
              const SizedBox(height: 8),
              _textField("Destination", destinationController),
              const SizedBox(height: 16),

              // Seleção de datas
              Row(
                children: [
                  Flexible(
                    child: _dateField(
                      label: "Departure",
                      date: departureDate,
                      onTap: () => _selectDate(context, (date) {
                        setState(() {
                          departureDate = date;
                        });
                      }),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Botão de pesquisa
              ElevatedButton(
                onPressed: () {
                  if (originController.text.isNotEmpty &&
                      destinationController.text.isNotEmpty &&
                      departureDate != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchResultsPage(
                          origin: originController.text.toUpperCase(),
                          destination: destinationController.text.toUpperCase(),
                          departureDate: DateFormat('yyyy-MM-dd').format(departureDate!),
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Preencha todos os campos")),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0CC0DF),
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                ),
                child: const Text(
                  "Search",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Botão para selecionar o tipo de viagem
  Widget _tripTypeButton(String type) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          tripType = type;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: tripType == type ? const Color(0xFF0CC0DF) : Colors.white,
        foregroundColor: tripType == type ? Colors.white : Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Color(0xFF0CC0DF)),
        ),
      ),
      child: Text(type),
    );
  }

  // Campo de texto para origem e destino
  Widget _textField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.flight, color: Color(0xFF0CC0DF)),
        hintText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  // Campo para selecionar data
  Widget _dateField({required String label, required DateTime? date, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              date != null ? DateFormat('dd/MM/yyyy - EEEE').format(date) : label,
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
            const Icon(Icons.calendar_today, color: Color(0xFF0CC0DF)),
          ],
        ),
      ),
    );
  }
}
