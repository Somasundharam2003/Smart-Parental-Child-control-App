import 'package:flutter/material.dart';

class RemoteControlScreen extends StatelessWidget {
  const RemoteControlScreen({super.key});

  void lockDevice() {
    print("🔒 Device Locked");
  }

  void unlockDevice() {
    print("🔓 Device Unlocked");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Remote Device Control"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton.icon(
              onPressed: lockDevice,
              icon: const Icon(Icons.lock, color: Colors.white),
              label: const Text("Lock Device"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                textStyle: const TextStyle(fontSize: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: unlockDevice,
              icon: const Icon(Icons.lock_open, color: Colors.white),
              label: const Text("Unlock Device"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                textStyle: const TextStyle(fontSize: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
