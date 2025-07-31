import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SosAlertScreen extends StatelessWidget {
  const SosAlertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SOS Alerts'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('sos_alerts')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Error loading SOS alerts.'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No SOS alerts found.'));
          }

          final alerts = snapshot.data!.docs;

          return ListView.builder(
            itemCount: alerts.length,
            itemBuilder: (context, index) {
              final data = alerts[index].data() as Map<String, dynamic>;
              final message = data['message'] ?? 'SOS triggered!';
              final time = data['timestamp']?.toDate().toString().split('.')[0] ?? '';

              return ListTile(
                leading: const Icon(Icons.warning, color: Colors.red),
                title: Text(message, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('Time: $time'),
              );
            },
          );
        },
      ),
    );
  }
}
