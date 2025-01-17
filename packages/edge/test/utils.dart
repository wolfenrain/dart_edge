import 'package:edge/runtime.dart';

Request serverRequest(
  String path, {
  String? method,
  Headers? headers,
  Object? body,
  String? referrer,
  ReferrerPolicy? referrerPolicy,
  RequestMode? mode,
  RequestCredentials? credentials,
  RequestCache? cache,
  RequestRedirect? redirect,
  String? integrity,
  bool? keepalive,
  AbortSignal? signal,
  RequestDuplex? duplex,
}) {
  return Request(
    Resource('http://0.0.0.0:3001$path'),
    method: method,
    headers: headers,
    body: body,
    referrer: referrer,
    referrerPolicy: referrerPolicy,
    mode: mode,
    credentials: credentials,
    cache: cache,
    redirect: redirect,
    integrity: integrity,
    keepalive: keepalive,
    signal: signal,
    duplex: duplex,
  );
}

Future<Response> fetchFromServer(
  String path, {
  String? method,
  Headers? headers,
  Object? body,
  String? referrer,
  ReferrerPolicy? referrerPolicy,
  RequestMode? mode,
  RequestCredentials? credentials,
  RequestCache? cache,
  RequestRedirect? redirect,
  String? integrity,
  bool? keepalive,
  AbortSignal? signal,
  RequestDuplex? duplex,
}) {
  return fetch(
    Resource('http://0.0.0.0:3001$path'),
    method: method,
    headers: headers,
    body: body,
    referrer: referrer,
    referrerPolicy: referrerPolicy,
    mode: mode,
    credentials: credentials,
    cache: cache,
    redirect: redirect,
    integrity: integrity,
    keepalive: keepalive,
    signal: signal,
    duplex: duplex,
  );
}
