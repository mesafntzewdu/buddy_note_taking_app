import 'package:flutter/material.dart';

class AddAppointment extends StatefulWidget {
  const AddAppointment({super.key});

  @override
  State<AddAppointment> createState() {
    return AddAppointmentState();
  }
}

class AddAppointmentState extends State<AddAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add new Appointment',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
