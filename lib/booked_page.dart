import 'package:flutter/material.dart';

class ConnectionPage extends StatefulWidget {
  @override
  _ConnectionPageState createState() => _ConnectionPageState();
}

class _ConnectionPageState extends State<ConnectionPage> {
  String _serverAddress = 'http://10.0.2.2:5000'; // Default server address
  bool _connected = false; // Initial connection status
  bool _connecting = false; // Connection in progress status

  TextEditingController _addressController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _addressController.text = _serverAddress;
  }

  void _connectToServer() {
    if (!_formKey.currentState!.validate()) {
      return; // Exit if form validation fails
    }

    setState(() {
      _connecting = true; // Start connection process
    });

    // Simulate server validation and connection
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _serverAddress = _addressController.text.trim();
        // Replace with actual validation and connection logic as needed
        _connected = true; // Simulated connection success
        _connecting = false; // Reset connecting status
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connection Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Server Address',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Server address is required.';
                  }
                  // Add additional validation logic here if needed
                  return null;
                },
                enabled: !_connecting, // Disable field during connection
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _connecting ? null : _connectToServer,
                child: _connecting
                    ? CircularProgressIndicator() // Show loading indicator while connecting
                    : Text('Connect'),
              ),
              SizedBox(height: 16),
              _connecting
                  ? Text(
                'Connecting...',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )
                  : _connected
                  ? Text(
                'Connected to: $_serverAddress',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )
                  : Text(
                'Not connected',
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
