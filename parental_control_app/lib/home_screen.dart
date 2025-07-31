import 'package:flutter/material.dart';
import 'remote_control_screen.dart';
import 'location_screen.dart';
import 'app_usage_screen.dart';
import 'screen_time_screen.dart';
import 'website_block_screen.dart';
import 'sos_alert_screen.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onLogout;

  const HomeScreen({super.key, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Parental Control Dashboard"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: onLogout,
            tooltip: "Logout",
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome, Parent!",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),

              // 🔒 Remote Control
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RemoteControlScreen()),
                  );
                },
                icon: const Icon(Icons.phonelink_lock),
                label: const Text("Remote Device Control"),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  backgroundColor: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 20),

              // 📍 Location Tracking
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LocationScreen()),
                  );
                },
                icon: const Icon(Icons.location_on),
                label: const Text("Track Child Location"),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  backgroundColor: Colors.teal,
                ),
              ),
              const SizedBox(height: 20),

              // 📊 App Usage Monitor
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AppUsageScreen()),
                  );
                },
                icon: const Icon(Icons.bar_chart),
                label: const Text("App Usage Monitor"),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  backgroundColor: Colors.orange,
                ),
              ),
              const SizedBox(height: 20),

              // ⏳ Screen Time Control
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ScreenTimeScreen()),
                  );
                },
                icon: const Icon(Icons.timer),
                label: const Text("Set Screen Time"),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  backgroundColor: Colors.redAccent,
                ),
              ),
              const SizedBox(height: 20),

              // 🌐 Website Blocker
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WebsiteBlockScreen()),
                  );
                },
                icon: const Icon(Icons.public_off),
                label: const Text("Block Websites"),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  backgroundColor: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 20),

              // 🆘 SOS Alerts
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SosAlertScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.warning_amber_rounded),
                label: const Text("View SOS Alerts"),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  backgroundColor: Colors.pinkAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
