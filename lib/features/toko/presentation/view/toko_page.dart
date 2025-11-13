import 'package:flutter/material.dart';
import 'package:siketan/core/constant/image/image_config.dart';

class TokoPage extends StatelessWidget {
  const TokoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const TokoPageView();
  }
}

class TokoPageView extends StatefulWidget {
  const TokoPageView({super.key});

  @override
  State<TokoPageView> createState() => _TokoPageViewState();
}

class _TokoPageViewState extends State<TokoPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Toko'),
        ),
      ),
    );
  }
}
