import 'package:flutter/material.dart';
import 'package:superhero_app/data/model/superhero_search_response.dart';
import 'package:superhero_app/data/repository.dart';

class SuperheroSearchScreen extends StatefulWidget {
  const SuperheroSearchScreen({super.key});

  @override
  State<SuperheroSearchScreen> createState() => _SuperheroSearchScreenState();
}

class _SuperheroSearchScreenState extends State<SuperheroSearchScreen> {
  Future<SuperheroSearchResponse?>? _superheroSearchInfo;
  Repository repository = Repository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Superhero Search')),
      body: Column(children: [searchField(), bodyList()]),
    );
  }

  Padding searchField() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Search for a superhero',
          prefixIcon: const Icon(Icons.search),
        ),
        onChanged: (value) {
          if (value.isNotEmpty) {
            setState(() {
              _superheroSearchInfo = repository.fetchSuperheroInfo(value);
            });
          } else {
            setState(() {
              _superheroSearchInfo = null;
            });
          }
        },
      ),
    );
  }

  Widget bodyList() {
    if (_superheroSearchInfo == null) {
      return const Expanded(child: Text('Type to search'));
    }
    return Expanded(
      child: FutureBuilder<SuperheroSearchResponse?>(
        future: _superheroSearchInfo,
        builder: (context, snapshost) {
          if (snapshost.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshost.hasData) {
            final data = snapshost.data;
            if (data == null) {
              return const Center(child: Text('No results found'));
            }
            if (data.response == 'error') {
              return Center(child: Text(data.error ?? 'No results found'));
            }
            if (data.results.isEmpty) {
              return const Center(child: Text('No results found'));
            }
            return ListView.builder(
              shrinkWrap: true,
              itemCount: data.results.length,
              itemBuilder: (context, index) {
                final superhero = data.results[index];
                if (superhero.name.isEmpty) {
                  return const SizedBox.shrink();
                }
                return itemSuperhero(superhero);
              },
            );
          } else if (snapshost.hasError) {
            final data = snapshost.data;
            // Check if data is null or has an error
            if (data == null) {
              return const Center(child: Text('No results found'));
            }
            if (data.response == 'error') {
              return Center(child: Text(data.error ?? 'No results found'));
            }
            if (data.results.isEmpty) {
              return const Center(child: Text('No results found'));
            }
            return Center(child: Text('Error: ${snapshost.error}'));
          } else {
            return const Center(child: Text('No results found'));
          }
        },
      ),
    );
  }

  ListTile itemSuperhero(SuperheroResponse superhero) {
    return ListTile(
      title: Text(superhero.name),
      subtitle: Text(superhero.biography.fullName),
      leading: Image.network(superhero.image.url),
      onTap: () {
        // Handle tap on the superhero item
      },
    );
  }
}
