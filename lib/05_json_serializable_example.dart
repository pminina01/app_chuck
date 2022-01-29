import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:networking_examples/ip.dart';

const _baseUrl = 'https://api.ipify.org';

Future<IpResponseModel> _fetchIp() async {
  final response = await get(Uri.parse('$_baseUrl?format=json'));
  return IpResponseModel.fromJson(
      jsonDecode(response.body) as Map<String, Object?>);
}

class JsonSerializableExamplePage extends StatelessWidget {
  const JsonSerializableExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: _ModelWidget(),
        ),
      );
}

class _ModelWidget extends StatelessWidget {
  const _ModelWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<IpResponseModel>(
        future: _fetchIp(),
        builder: (context, snapshot) {
          final data = snapshot.data;
          if (data == null) {
            return const CircularProgressIndicator();
          }
          return Text(data.toString());
        });
  }
}
