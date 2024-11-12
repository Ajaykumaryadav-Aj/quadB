import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quad/provider/show_provider.dart';
import 'package:quad/screens/detail_screen.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onSearchTapped;

  const HomeScreen({super.key, required this.onSearchTapped});

  @override
  Widget build(BuildContext context) {
    final showProvider = Provider.of<ShowProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: GestureDetector(
            onTap: onSearchTapped,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, color: Colors.black54),
                  SizedBox(width: 8),
                  Text(
                    'Search movies...',
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: showProvider.isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: showProvider.shows.length,
                itemBuilder: (context, index) {
                  final show = showProvider.shows[index];
                  return ListTile(
                    leading: show.image != null
                        ? Image.network(show.image!.medium)
                        : const Icon(Icons.image, size: 50),
                    title: Text(show.name),
                    subtitle: Text(show.type),
                    trailing: Text(show.runtime != null
                        ? '${show.runtime} mins'
                        : 'No runtime info'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(show: show),
                        ),
                      );
                    },
                  );
                },
              ),
      ),
    );
  }
}
