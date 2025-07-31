import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ScreenTimeScreen extends StatefulWidget {
  const ScreenTimeScreen({super.key});

  @override
  State<ScreenTimeScreen> createState() => _ScreenTimeScreenState();
}

class _ScreenTimeScreenState extends State<ScreenTimeScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _loading = false;
  String? _currentLimit;

  @override
  void initState() {
    super.initState();
    _fetchCurrentLimit();
  }

  Future<void> _fetchCurrentLimit() async {
    setState(() => _loading = true);
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('screen_time')
          .doc('child1') // you can change this ID based on UID later
          .get();

      if (snapshot.exists) {
        setState(() {
          _currentLimit = snapshot.data()?['limit'];
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching data: $e')),
      );
    } finally {
      setState(() => _loading = false);
    }
  }

  Future<void> _setLimit() async {
    final limit = _controller.text.trim();
    if (limit.isEmpty) return;

    setState(() => _loading = true);
    try {
      await FirebaseFirestore.instance
          .collection('screen_time')
          .doc('child1') // again, can be UID
          .set({'limit': limit});

      setState(() => _currentLimit = limit);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Screen time limit set!')),
      );
      _controller.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to set limit: $e')),
      );
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set Screen Time Limit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: _loading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (_currentLimit != null) ...[
                    Text(
                      'Current Limit: $_currentLimit minutes',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 20),
                  ],
                  TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Enter new screen time (in minutes)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: _setLimit,
                    icon: const Icon(Icons.save),
                    label: const Text('Set Limit'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 14),
                      backgroundColor: Colors.green,
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
