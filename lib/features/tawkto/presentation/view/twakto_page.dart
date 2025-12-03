import 'package:flutter/material.dart';
import 'package:flutter_tawkto/flutter_tawk.dart';
import 'package:siketan/core/constant/env.dart';

class TwaktoPage extends StatefulWidget {
  const TwaktoPage({super.key});

  @override
  State<TwaktoPage> createState() => _TwaktoPageState();
}

class _TwaktoPageState extends State<TwaktoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Tawk(
          directChatLink: Env.directChatLink,
          visitor: TawkVisitor(
            name: 'Siketan',
            email: 'ayoubamine2a@gmail.com',
          ),
        ),
      ),
    );
  }
}
