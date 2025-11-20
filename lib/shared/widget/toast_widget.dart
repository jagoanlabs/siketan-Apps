import 'package:flutter/material.dart';

enum ToastType { info, success, error, warning }

class Toast {
  static OverlayEntry? _currentToast;

  static void show({
    required String message,
    ToastType type = ToastType.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    // Tutup toast sebelumnya jika ada
    _currentToast?.remove();
    _currentToast = null;

    final overlayEntry = OverlayEntry(
      builder: (context) => ToastWidget(
        message: message,
        type: type,
        duration: duration,
        onRemove: () {
          _currentToast?.remove();
          _currentToast = null;
        },
      ),
    );

    _currentToast = overlayEntry;

    // Tambahkan ke overlay
    Overlay.of(navigatorKey.currentContext!)!.insert(overlayEntry);

    // Auto-dismiss
    Future.delayed(duration, () {
      if (_currentToast != null) {
        _currentToast!.remove();
        _currentToast = null;
      }
    });
  }
}

// GlobalKey untuk mengakses navigator dari mana saja
final navigatorKey = GlobalKey<NavigatorState>();

class ToastWidget extends StatefulWidget {
  final String message;
  final ToastType type;
  final Duration duration;
  final VoidCallback onRemove;

  const ToastWidget({
    super.key,
    required this.message,
    required this.type,
    required this.duration,
    required this.onRemove,
  });

  @override
  State<ToastWidget> createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<ToastWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _slideAnimation;

  Color _getBackgroundColor() {
    switch (widget.type) {
      case ToastType.success:
        return Colors.green.shade500;
      case ToastType.error:
        return Colors.red.shade500;
      case ToastType.warning:
        return Colors.orange.shade500;
      case ToastType.info:
      default:
        return Colors.blue.shade500;
    }
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _slideAnimation = Tween<double>(begin: 30.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 40,
      left: 16,
      right: 16,
      child: GestureDetector(
        onTap: widget.onRemove,
        child: FadeTransition(
          opacity: _opacityAnimation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, -0.5),
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: _controller,
              curve: Curves.easeOut,
            )),
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: _getBackgroundColor(),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      _getIcon(),
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        widget.message,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  IconData _getIcon() {
    switch (widget.type) {
      case ToastType.success:
        return Icons.check_circle;
      case ToastType.error:
        return Icons.error;
      case ToastType.warning:
        return Icons.warning;
      case ToastType.info:
      default:
        return Icons.info;
    }
  }
}