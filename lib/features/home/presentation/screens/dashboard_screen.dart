import 'package:flutter/material.dart';
import 'package:keep_fit/features/home/presentation/screens/widgets/keep_fit_navigation_bar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: widget.child,
        bottomNavigationBar: KeepFitNavigationBar(
          child: widget.child,
        ),
      );
}
