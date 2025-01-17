import 'dart:js_util';

import 'package:js_bindings/js_bindings.dart' as interop;

import '../interop/utils_interop.dart' as interop;
import '../request.dart';
import '../response.dart';
import 'cache_query_options.dart';

class Cache {
  final interop.Cache _delegate;

  Cache._(this._delegate);

  Future<void> add(Request request) async {
    await _delegate.add(request.delegate);
  }

  Future<void> addAll(Iterable<Request> requests) async {
    await _delegate.addAll(requests.map((r) => r.delegate).toList());
  }

  Future<void> delete(Request request,
      [MultiCacheQueryOptions? options]) async {
    await _delegate.delete(request.delegate, options?.delegate);
  }

  Future<Response?> match(Request requst, [CacheQueryOptions? options]) async {
    final obj = await promiseToFuture(
        _delegate.match(requst.delegate, options?.delegate));
    return obj == null ? null : responseFromJsObject(obj);
  }

  Future<Iterable<Response>> matchAll(
      [Request? request, CacheQueryOptions? options]) async {
    final matches = await _delegate.matchAll(
      request?.delegate ?? interop.jsUndefined,
      options?.delegate,
    );
    return matches.map((obj) => responseFromJsObject(obj));
  }

  Future<void> put(
    Request request,
    Response response,
  ) async {
    return _delegate.put(request.delegate, response.delegate);
  }
}

Cache cacheFromJsObject(interop.Cache delegate) {
  return Cache._(delegate);
}
