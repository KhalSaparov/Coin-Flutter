import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://min-api.cryptocompare.com/data/price';
const apiKey =
    'e16de0a3dbed8170d0c3491f09bf99f1c0f28af3f1d8884e3d9d61f496d76c8e';

class CoinData {
  CoinData(this.currency);
  String currency;
  Future<dynamic> getCoinData() async {
    final Map<String, String> map = {};
    for (String coin in cryptoList) {
      http.Response response = await http.get(Uri.parse(
          '$coinAPIURL?fsym=$coin&tsyms=$currency&api_key={$apiKey}'));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        double price = data[currency];
        map[coin] = price.toStringAsFixed(0);
      } else {
        print(response.statusCode);
      }
    }
    return map;
  }
}
