import 'package:flutter/material.dart';

import 'block_card.dart';

class StorageMeterBlock extends StatelessWidget {
  const StorageMeterBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return const BlockCard(
      title: 'Storage',
      child: EmptyLine(text: 'Usage appears once features exist.'),
    );
  }
}