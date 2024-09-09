import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/Core/constant/Colors/Colors.dart';

class SlideableWidgetGlobal extends StatelessWidget {
  const SlideableWidgetGlobal({
    super.key,
    required this.widget,
    required this.onPressed,
    required this.onPressed2,
  });
  final Widget widget;
  final void Function(BuildContext)? onPressed;
  final void Function(BuildContext)? onPressed2;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: onPressed,
            label: 'Delete',
            icon: FluentIcons.delete_12_filled,
            backgroundColor: Appcolors.desire,
          ),
          SlidableAction(
            onPressed: onPressed2,
            label: 'Star',
            icon: FluentIcons.star_12_filled,
            backgroundColor: Appcolors.blue,
          ),
        ],
      ),
      child: widget,
    );
  }
}
