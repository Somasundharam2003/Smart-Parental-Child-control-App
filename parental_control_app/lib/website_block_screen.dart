import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WebsiteBlockScreen extends StatefulWidget {
  const WebsiteBlockScreen({super.key});

  @override
  State<WebsiteBlockScreen> createState() => _WebsiteBlockScreenState();
}

class _WebsiteBlockScreenState extends State<WebsiteBlockScreen> {
  final TextEditingController _urlController = TextEditingController();

  Future<void> _addWebsiteToBlock() async {
    final url = _urlController.text.trim();
    if (url.isNotEmpty) {
      await FirebaseFirestore.instance.collection('blocked_websites').add({
        'url': url,
        'added_at': Timestamp.now(),
      });
      _urlController.clear();
    }
  }

  Future<void> _deleteWebsite(String docId) async {
    await FirebaseFirestore.instance
        .collection('blocked_websites')
        .doc(docId)
        .delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Website Blocker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input field to add website
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _urlController,
                    decoration: const InputDecoration(
                      labelText: 'Enter website URL (e.g., youtube.com)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _addWebsiteToBlock,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // List of blocked websites
            const Text(
              "Blocked Websites",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),

            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('blocked_websites')
                    .orderBy('added_at', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(child: Text('Something went wrong'));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final docs = snapshot.data!.docs;

                  if (docs.isEmpty) {
                    return const Center(
                        child: Text('No websites blocked yet.'));
                  }

                  return ListView.builder(
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      final data = docs[index].data() as Map<String, dynamic>;
                      final url = data['url'] ?? 'unknown.com';
                      return ListTile(
                        leading: const Icon(Icons.block),
                        title: Text(url),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            _deleteWebsite(docs[index].id);
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
