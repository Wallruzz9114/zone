import 'package:flutter/material.dart';
import 'package:zone/src/ui/shared/shared_styles.dart' as shared_styles;

class ExpansionListItem extends StatelessWidget {
  const ExpansionListItem({
    Key? key,
    required this.onTap,
    required this.title,
    this.showArrow = false,
    this.smallVersion = false,
  }) : super(key: key);

  final Function() onTap;
  final String title;
  final bool showArrow;
  final bool smallVersion;

  @override
  GestureDetector build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        height: smallVersion
            ? shared_styles.smallFieldHeight
            : shared_styles.fieldHeight,
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontSize: smallVersion ? 12 : 15),
              ),
            ),
            if (showArrow)
              Icon(
                Icons.arrow_drop_down,
                color: Colors.grey[700],
                size: 20,
              )
            else
              Container()
          ],
        ),
      ),
    );
  }
}
