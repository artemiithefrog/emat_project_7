import 'dart:async';
import 'dart:convert';
import 'package:emat_project_7/model/crypto_model.dart';
import 'package:http/http.dart' as http;

class CryptoViewModel {
  final _cryptoController = StreamController<List<Crypto>>.broadcast();
  Stream<List<Crypto>> get cryptoStream => _cryptoController.stream;

  Future<void> fetchData() async {
    try {
      final response = await http
          .get(
            Uri.parse(
                'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&ids=bitcoin,ethereum,binancecoin,ripple,litecoin,cardano,chainlink,polkadot,stellar,dogecoin'),
          )
          .timeout(const Duration(seconds: 15));
      if (response.statusCode == 200) {
        final List<Crypto> cryptoList = (json.decode(response.body) as List)
            .map((item) => Crypto.fromJson(item))
            .toList();
        _cryptoController.sink.add(cryptoList);
      } else {
        _cryptoController.sink.addError('Failed to load crypto prices');
      }
    } catch (error) {
      _cryptoController.sink.addError('Error fetching data: $error');
    }
  }

  void dispose() {
    _cryptoController.close();
  }
}
