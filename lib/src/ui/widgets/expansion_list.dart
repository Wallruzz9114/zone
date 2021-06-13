import 'package:flutter/material.dart';
import 'package:zone/src/ui/shared/shared_styles.dart' as shared_styles;
import 'package:zone/src/ui/widgets/expansion_list_item.dart';

class ExpansionList<T> extends StatefulWidget {
  const ExpansionList({
    Key? key,
    required this.items,
    required this.title,
    required this.onItemSelected,
    this.smallVersion = false,
  }) : super(key: key);

  final List<T> items;
  final String title;
  final Function(T) onItemSelected;
  final bool smallVersion;

  @override
  _ExpansionListState<T> createState() => _ExpansionListState<T>();
}

class _ExpansionListState<T> extends State<ExpansionList<T>> {
  final double startingHeight = shared_styles.fieldHeight;
  late double expandedHeight;
  bool expanded = false;
  late String selectedValue;

  List<Widget> _getDropdownListItems() {
    return widget.items
        .map((T item) => ExpansionListItem(
            smallVersion: widget.smallVersion,
            onTap: () {
              setState(() {
                expanded = !expanded;
                selectedValue = item.toString();
              });

              widget.onItemSelected(item);
            },
            title: item.toString()))
        .toList();
  }

  void _calculateExpandedHeight() {
    expandedHeight = 2 +
        (widget.smallVersion
            ? shared_styles.smallFieldHeight
            : shared_styles.fieldHeight) +
        (widget.items.length *
            (widget.smallVersion
                ? shared_styles.smallFieldHeight
                : shared_styles.fieldHeight));
  }

  @override
  void initState() {
    super.initState();
    selectedValue = widget.title;
    _calculateExpandedHeight();
  }

  @override
  AnimatedContainer build(BuildContext context) {
    return AnimatedContainer(
      padding: shared_styles.fieldPadding,
      duration: const Duration(milliseconds: 180),
      height: expanded
          ? expandedHeight
          : widget.smallVersion
              ? shared_styles.smallFieldHeight
              : startingHeight,
      decoration: shared_styles.fieldDecoration.copyWith(
        boxShadow: expanded
            ? <BoxShadow>[BoxShadow(blurRadius: 10, color: Colors.grey[300]!)]
            : null,
      ),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          ExpansionListItem(
            title: selectedValue,
            onTap: () {
              setState(() {
                expanded = !expanded;
              });
            },
            showArrow: true,
            smallVersion: widget.smallVersion,
          ),
          Container(height: 2, color: Colors.grey[300]),
          ..._getDropdownListItems(),
        ],
      ),
    );
  }
}
