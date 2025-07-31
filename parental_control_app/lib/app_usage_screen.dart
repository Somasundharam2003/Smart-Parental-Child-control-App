import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppUsageScreen extends StatelessWidget {
  const AppUsageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('📊 Child App Usage'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('app_usage').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('❌ Error loading app usage data.'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('📭 No app usage data found.'),
            );
          }

          final docs = snapshot.data!.docs;

          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final data = docs[index].data() as Map<String, dynamic>?;

              if (data == null) return const SizedBox.shrink();

              final appName = data['app_name'] ?? 'Unknown App';
              final duration = data['duration'] ?? 0;

              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: const Icon(Icons.apps, color: Colors.blue),
                  title: Text(appName),
                  subtitle: Text('Used for $duration minutes'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
