import 'dart:collection';

class MRunFutureQueue {
  static final Queue<Future<void> Function()> _requestQueue =
  Queue<Future<void> Function()>();
  static bool _isProcessing = false;

  static Queue<Future<void> Function()> get requestQueue => _requestQueue;

  static Future<void> addRequest(Future<void> Function() request) async {
    _requestQueue.add(request);
    await _processQueue();
  }

  static Future<void> _processQueue() async {
    if (_isProcessing || _requestQueue.isEmpty) {
      return;
    }

    _isProcessing = true;
    final Future<void> Function() request = _requestQueue.removeFirst();
    await request();
    _isProcessing = false;

    await _processQueue();
  }
}
