import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:networking_examples/ip.dart';

class DioRequester {
  final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.ipify.org',
    ),
  )..interceptors.add(LoggerInterceptor());

  Future<IpResponseModel> fetchIp() async {
    final response = await _dio
        .get<Map<String, dynamic>>('/', queryParameters: {'format': 'json'});
    return IpResponseModel.fromJson(response.data!);
  }
}

class LoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('${options.uri}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('${response}');
    super.onResponse(response, handler);
  }
}

final _requester = DioRequester();

class DioExample extends StatelessWidget {
  const DioExample({Key? key}) : super(key: key);

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
      future: _requester.fetchIp(),
      builder: (context, snapshot) {
        final data = snapshot.data;
        if (data == null) {
          return const CircularProgressIndicator();
        }
        return Text(data.toString());
      },
    );
  }
}
