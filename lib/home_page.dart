import 'package:flutter/material.dart';
import 'package:http_methods/base_client.dart';

class AppButton extends StatelessWidget {
  final String operation;
  final Color operationColor;
  final String description;
  final VoidCallback onPressed;

  const AppButton({
    required this.operation,
    required this.operationColor,
    required this.description,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(operationColor),
        textStyle: MaterialStateProperty.all<TextStyle>(
          TextStyle(color: Colors.white),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(operation),
          SizedBox(width: 8),
          Text(description),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                FlutterLogo(
                  size: 70,
                ),
                SizedBox(height: 15),
                AppButton(
                  operation: 'GET',
                  operationColor: Colors.lightGreen,
                  description: 'Fetch users',
                  onPressed: () async {
                    var response =
                        await BaseClient().get('/users').catchError((err) {});
                    if (response == null) return;
                    debugPrint('Successful');
                  },
                ),
                AppButton(
                  operation: 'POST',
                  operationColor: Colors.lightBlue,
                  description: 'Fetch users',
                  onPressed: () {},
                ),
                AppButton(
                  operation: 'PUT',
                  operationColor: Colors.orange,
                  description: 'Fetch users',
                  onPressed: () {},
                ),
                AppButton(
                  operation: 'DEL',
                  operationColor: Colors.red,
                  description: 'Fetch users',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
