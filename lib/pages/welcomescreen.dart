import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Welcomescreen extends StatefulWidget {
  const Welcomescreen({Key? key}) : super(key: key);

  @override
  State<Welcomescreen> createState() => _WelcomescreenState();
}

class _WelcomescreenState extends State<Welcomescreen> {
  DateTime selectedDate = DateTime.now();
  DateFormat formatter = DateFormat('dd/MM/yyyy');

  var dateCtl = TextEditingController();

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateCtl.text = formatter.format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 300,
      width: 700,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text("Court"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 250,
                      height: 50,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Location...',
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 3, color: Colors.blue),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 3, color: Colors.red),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 50),
                    SizedBox(
                      width: 180,
                      height: 50,
                      child: TextField(
                        controller: dateCtl,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: 'dd/mm/yy',
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 3, color: Colors.blue),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 3, color: Colors.red),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              _selectDate(context);
                              print(selectedDate);
                            },
                            icon: const Icon(
                              Icons.date_range_outlined,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    ElevatedButton(onPressed: () {}, child: const Text("Find"))
                  ],
                ),
              ),
              const SizedBox(height: 40)
            ],
          ),
        ),
      ),
    );
  }
}
