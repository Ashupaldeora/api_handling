import 'package:api_handling/pixabay_api/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    PixabayProvider pixabayProviderTrue = Provider.of<PixabayProvider>(context);
    PixabayProvider pixabayProviderFalse =
        Provider.of<PixabayProvider>(context, listen: false);

    TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallpaper'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Search',
              ),
              onSubmitted: (value) {
                pixabayProviderFalse.fetchData(value);
              },
            ),
          ),
          Expanded(
            child: (pixabayProviderTrue.isLoading)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : GridView.builder(
                    itemCount: pixabayProviderTrue.data['hits']?.length ?? 0,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) => Card(
                      child: Image.network(
                        pixabayProviderTrue.data['hits'][index]
                            ['largeImageURL'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
