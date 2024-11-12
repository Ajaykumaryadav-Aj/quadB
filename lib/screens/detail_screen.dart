import 'package:flutter/material.dart';
import 'package:quad/models/show_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DetailScreen extends StatelessWidget {
  final ShowModel show;

  const DetailScreen({super.key, required this.show});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(show.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (show.image != null)
              Center(
                child: Image.network(
                  show.image!.original,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 16.0),

            Text(
              show.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              show.type,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 16.0),

            Text(
              "Genres: ${show.genres.join(", ")}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8.0),

            Text("Language: ${show.language}",
                style: const TextStyle(fontSize: 16)),
            Text("Runtime: ${show.runtime ?? 'N/A'} minutes",
                style: const TextStyle(fontSize: 16)),
            Text("Status: ${show.status}",
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16.0),

            const Text(
              "Schedule:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
                "Airs on: ${show.schedule.days.join(", ")} at ${show.schedule.time}",
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16.0),

            if (show.network != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Network: ${show.network!.name}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Country: ${show.network!.country}",
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            const SizedBox(height: 16.0),

            // Official Site
            if (show.officialSite.isNotEmpty)
              InkWell(
                onTap: () {
                  // Launch the URL
                  launchUrl(show.officialSite);
                },
                child: const Text(
                  "Official Site",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      decoration: TextDecoration.underline),
                ),
              ),
            const SizedBox(height: 16.0),

            // Rating
            Text(
              "Rating: ${show.rating ?? 'N/A'}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),

            // Summary
            const Text(
              "Summary:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              show.summary.replaceAll(RegExp(r'<[^>]*>'), ''),
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  // Function to launch URLs
  void launchUrl(String url) async {
    if (await launchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
