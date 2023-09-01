import 'package:flutter/material.dart';

class OptionsPage extends StatelessWidget {
  const OptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            radius: 80,
            child: const Icon(Icons.person,size: 80),
          ),
          const SizedBox(height: 40,),
          Column(
            children: [TextButton(onPressed: () {}, child: const Text('Ajustes')),
            TextButton(onPressed: () {}, child: const Text('Ajustes')),
            TextButton(onPressed: () {}, child: const Text('Ajustes'))],
          )
        ],
      ),
    );
  }
}
