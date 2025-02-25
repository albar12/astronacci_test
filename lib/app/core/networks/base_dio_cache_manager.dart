import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

class BaseDioCacheManager {
  static Future<DioCacheInterceptor> get dioCacheInterceptor async {
    final options = CacheOptions(
      store: MemCacheStore(
        maxEntrySize: 1024 * 1024 * 2, // 2 MB untuk setiap entri
        maxSize: 1024 * 1024 * 20, // 20 MB untuk total cache
      ),
      policy: CachePolicy.refreshForceCache,
      maxStale: const Duration(days: 7),
      hitCacheOnErrorExcept: [401, 403],
      priority: CachePriority.normal,
      keyBuilder: CacheOptions.defaultCacheKeyBuilder,
      allowPostMethod: false,
    );

    return DioCacheInterceptor(options: options);
  }
}
