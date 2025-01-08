import 'package:expansion_tile_group/expansion_tile_group.dart';
import 'package:flutter/material.dart';

class CustomExpansionTile extends StatelessWidget {
  final Widget title;
  final Widget? subtitle;
  final List<Widget> children;
  const CustomExpansionTile({super.key, required this.title, this.subtitle, required this.children});

  @override
  Widget build(BuildContext context) {
    var expansionKey = GlobalKey<ExpansionTileCoreState>();
    return Material(
      key: UniqueKey(),
      color: Colors.transparent,
      child: MouseRegion(
        onEnter: (_) => expansionKey.currentState?.expand(),
        onExit: (_) => expansionKey.currentState?.collapse(),
        child: Container(
          color: Theme.of(context).cardColor,
          child: ExpansionTileGroup(
            children: [
              ExpansionTileItem(
                expansionKey: expansionKey,
                border: const Border(),
                textColor: Theme.of(context).colorScheme.onBackground,
                collapsedBackgroundColor: Theme.of(context).hoverColor,
                backgroundColor: Theme.of(context).hoverColor,
                title: title,
                subtitle: subtitle,
                children: children,
              )
            ],
          ),
        ),
      ),
    );
  }
}
