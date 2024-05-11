import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';

class TSingleBlog extends StatelessWidget {
  const TSingleBlog({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: TAppBar(
      title: Text('Article title'),
      showBackArrow: true,
    ));
  }
}
