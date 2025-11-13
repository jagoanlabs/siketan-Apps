import 'package:flutter/material.dart';
import 'package:siketan/core/constant/image/image_config.dart';

class InformasiPage extends StatelessWidget {
  const InformasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const InformasiPageView();
  }
}

class InformasiPageView extends StatefulWidget {
  const InformasiPageView({super.key});

  @override
  State<InformasiPageView> createState() => _InformasiPageViewState();
}

class _InformasiPageViewState extends State<InformasiPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Informasi'),
        ),
      ),
    );
  }
}
