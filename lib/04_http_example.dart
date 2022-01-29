import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

const _baseUrl = 'https://api.ipify.org';

final _client = Client();

Future<Response> _fetchIp() => get(Uri.parse(_baseUrl));

Future<Response> _fetchIpViaClient() => _client.get(Uri.parse(_baseUrl));

Future<Map<String, Object?>> _fetchIpJson() async {
  final response = await get(Uri.parse('$_baseUrl?format=json'));
  return jsonDecode(response.body) as Map<String, Object?>;
}

class HttpExamplePage extends StatelessWidget {
  const HttpExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: _JsonWidget(),
        ),
      );
}

class _ResponseWidget extends StatelessWidget {
  const _ResponseWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Response>(
        future: _fetchIpViaClient(),
        builder: (context, snapshot) {
          final data = snapshot.data;
          if (data == null) {
            return const CircularProgressIndicator();
          }
          return Text(data.body);
        });
  }
}

class _JsonWidget extends StatelessWidget {
  const _JsonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, Object?>>(
        future: _fetchIpJson(),
        builder: (context, snapshot) {
          final data = snapshot.data;
          if (data == null) {
            return const CircularProgressIndicator();
          }
          return Text(data.toString());
        });
  }
}
