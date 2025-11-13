import 'package:flutter/material.dart';
import 'package:siketan/core/constant/image/image_config.dart';

class DataPage extends StatelessWidget {
  const DataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DataPageView();
  }
}

class DataPageView extends StatefulWidget {
  const DataPageView({super.key});

  @override
  State<DataPageView> createState() => _DataPageViewState();
}

class _DataPageViewState extends State<DataPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Data'),
        ),
      ),
    );
  }
}
