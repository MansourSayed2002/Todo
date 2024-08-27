import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/Core/constant/Colors/Colors.dart';

class SlideableWidgetGlobal extends StatelessWidget {
  const SlideableWidgetGlobal({
    super.key,
    required this.widget,
    required this.onPressed,
  });
  final Widget widget;
  final void Function(BuildContext)? onPressed;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: onPressed,
            label: 'Delete',
            backgroundColor: Appcolors.desire,
          ),
        ],
      ),
      child: widget,
    );
  }
}
