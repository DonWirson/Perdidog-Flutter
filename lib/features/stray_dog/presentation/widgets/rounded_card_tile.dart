import 'package:flutter/material.dart';
import '../../../../core/extension/font_extension.dart';

class RoundedCardTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color tileColor;
  final void Function()? onTap;

  const RoundedCardTile({
    required this.title,
    required this.subTitle,
    required this.tileColor,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: ListTile(
          tileColor: tileColor,
          title: Text(
            title,
            style: Theme.of(context).textTheme.h3,
          ),
          subtitle: Text(
            subTitle,
            style: Theme.of(context).textTheme.h4,
          ),
          isThreeLine: true,
        ),
      ),
    );
  }
}
