import 'dart:async';
import 'package:flutter/material.dart';

enum ToastType { info, success, error, warning }
enum ToastPosition { top, centerTop, center, bottom }

class AppToast {
  AppToast._();

  static final _queue = <_ToastRequest>[];
  static bool _isShowing = false;

  static void showSuccess(BuildContext context, String message,
          {Duration duration = const Duration(seconds: 3)}) =>
      show(context, message, type: ToastType.success, duration: duration);

  static void showError(BuildContext context, String message,
          {Duration duration = const Duration(seconds: 3)}) =>
      show(context, message, type: ToastType.error, duration: duration);

  static void showInfo(BuildContext context, String message,
          {Duration duration = const Duration(seconds: 3)}) =>
      show(context, message, type: ToastType.info, duration: duration);

  static void showWarning(BuildContext context, String message,
          {Duration duration = const Duration(seconds: 3)}) =>
      show(context, message, type: ToastType.warning, duration: duration);

  /// DEFAULT POSITION = centerTop
  static void show(
    BuildContext context,
    String message, {
    ToastType type = ToastType.info,
    Duration duration = const Duration(seconds: 3),
    bool dismissible = true,
    double horizontalPadding = 24,
    double widthFactor = 0.92,
    ToastPosition position = ToastPosition.top, // DEFAULT POSITION
  }) {
    final req = _ToastRequest(
      context: context,
      message: message,
      type: type,
      duration: duration,
      dismissible: dismissible,
      horizontalPadding: horizontalPadding,
      widthFactor: widthFactor,
      position: position,
    );

    _queue.add(req);
    if (!_isShowing) _showNext();
  }

  static void dismissAll() {
    for (final req in List<_ToastRequest>.from(_queue)) {
      req.entry?.remove();
      req._completer?.complete();
    }
    _queue.clear();
    _isShowing = false;
  }

  static Future<void> _showNext() async {
    if (_queue.isEmpty) {
      _isShowing = false;
      return;
    }

    _isShowing = true;
    final req = _queue.removeAt(0);
    final overlay = Overlay.of(req.context);

    final entry = OverlayEntry(builder: (ctx) => _ToastView(request: req));

    req.entry = entry;
    overlay.insert(entry);

    await req._completer?.future;
    req.entry?.remove();

    Future.microtask(() => _showNext());
  }
}

class _ToastRequest {
  final BuildContext context;
  final String message;
  final ToastType type;
  final Duration duration;
  final bool dismissible;
  final double horizontalPadding;
  final double widthFactor;
  final ToastPosition position;

  OverlayEntry? entry;
  Completer<void>? _completer;

  _ToastRequest({
    required this.context,
    required this.message,
    required this.type,
    required this.duration,
    required this.dismissible,
    required this.horizontalPadding,
    required this.widthFactor,
    required this.position,
  }) {
    _completer = Completer<void>();
  }
}

class _ToastView extends StatefulWidget {
  final _ToastRequest request;
  const _ToastView({required this.request});

  @override
  State<_ToastView> createState() => _ToastViewState();
}

class _ToastViewState extends State<_ToastView>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnim;
  late Animation<double> _opacityAnim;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );

    final beginOffset = const Offset(0, -0.50); // slide dari atas dikit
    _offsetAnim = Tween(begin: beginOffset, end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );

    _opacityAnim =
        CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward();

    _timer = Timer(widget.request.duration, _hide);
  }

  void _hide() {
    _timer?.cancel();
    _controller.reverse().then((_) {
      if (!(widget.request._completer?.isCompleted ?? true)) {
        widget.request._completer?.complete();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final width = media.size.width * widget.request.widthFactor;

    double? top;
    double? bottom;

    switch (widget.request.position) {
      case ToastPosition.top:
        top = media.padding.top + 16;
        break;

      case ToastPosition.centerTop:
        top = media.size.height * 0.20; // ⇦ DEFAULT
        break;

      case ToastPosition.center:
        top = media.size.height * 0.40;
        break;

      case ToastPosition.bottom:
        bottom = 24 + media.viewInsets.bottom;
        break;
    }

    return Positioned(
      top: top,
      bottom: bottom,
      left: (media.size.width - width) / 2,
      child: Material(
        color: Colors.transparent,
        child: SlideTransition(
          position: _offsetAnim,
          child: FadeTransition(
            opacity: _opacityAnim,
            child: _buildCard(width),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(double width) {
    final bg = _bgColorForType();

    return GestureDetector(
      onTap: widget.request.dismissible ? _hide : null,
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
                color: Colors.black26, blurRadius: 16, offset: Offset(0, 6))
          ],
        ),
        child: Row(
          children: [
            Icon(_iconForType(), color: Colors.white, size: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                widget.request.message,
                style: const TextStyle(
                    color: Colors.white, fontSize: 14, height: 1.2),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (widget.request.dismissible)
              InkWell(
                onTap: _hide,
                child:
                    const Icon(Icons.close, color: Colors.white, size: 18),
              ),
          ],
        ),
      ),
    );
  }

  Color _bgColorForType() {
    switch (widget.request.type) {
      case ToastType.success:
        return const Color(0xFF1E8E3E);
      case ToastType.error:
        return const Color(0xFFB00020);
      case ToastType.warning:
        return const Color(0xFFE08A00);
      default:
        return const Color(0xFF1967D2);
    }
  }

  IconData _iconForType() {
    switch (widget.request.type) {
      case ToastType.success:
        return Icons.check_circle_outline;
      case ToastType.error:
        return Icons.error_outline;
      case ToastType.warning:
        return Icons.warning_amber_outlined;
      default:
        return Icons.info_outline;
    }
  }
}
