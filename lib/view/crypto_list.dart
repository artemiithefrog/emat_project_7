import 'package:emat_project_7/model/crypto_model.dart';
import 'package:emat_project_7/view_model/crypto_viewmodel.dart';
import 'package:flutter/material.dart';

class CryptoList extends StatefulWidget {
  const CryptoList({super.key});

  @override
  _CryptoListState createState() => _CryptoListState();
}

class _CryptoListState extends State<CryptoList> {
  late CryptoViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = CryptoViewModel();
    _viewModel.fetchData();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: StreamBuilder<List<Crypto>>(
          stream: _viewModel.cryptoStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text('No data available'),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final crypto = snapshot.data![index];
                  return CryptoTile(crypto: crypto);
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class CryptoTile extends StatelessWidget {
  final Crypto crypto;

  const CryptoTile({super.key, required this.crypto});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Image.network(
          crypto.image,
          width: 40,
          height: 40,
        ),
        title: Text(
          crypto.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('\$${crypto.currentPrice}'),
      ),
    );
  }
}
