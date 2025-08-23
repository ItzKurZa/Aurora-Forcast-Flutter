import 'package:flutter/material.dart';

class AlertsToggleWidget extends StatefulWidget {
  const AlertsToggleWidget({super.key});

  @override
  State<AlertsToggleWidget> createState() => _AlertsToggleWidgetState();
}

class _AlertsToggleWidgetState extends State<AlertsToggleWidget> {
  bool enabled = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border(bottom: BorderSide(color: Colors.white12, width: 1)),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: const Text(
          'Enable Alerts',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),
        trailing: Switch(
          value: enabled,
          onChanged: (val) => setState(() => enabled = val),
          activeThumbColor: Colors.blue,
        ),
      ),
    );
  }
}
