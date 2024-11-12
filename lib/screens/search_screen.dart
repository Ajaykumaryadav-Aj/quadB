import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quad/provider/show_provider.dart';
import 'package:quad/screens/detail_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final showProvider = Provider.of<ShowProvider>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextFormField(
            onChanged: (query) {
              showProvider.filterShows(query);
            },
            autofocus: true,
            decoration: const InputDecoration(
              hintText: 'Search movies...',
              border: InputBorder.none,
              icon: Icon(Icons.search, color: Colors.black54),
            ),
            textInputAction: TextInputAction.search,
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
                      : const Icon(Icons.image,
                          size: 50), 
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
    );
  }
}
