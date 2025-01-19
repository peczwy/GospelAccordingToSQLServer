import 'package:flutter/material.dart';
import 'package:gospel_at_flutter/_exports.dart';
import 'package:gospel_at_flutter/gospel_at_flutter.dart';

class GospelNavigation extends StatelessWidget {
  const GospelNavigation({
    super.key,
    required this.selected,
    required this.navigation,
    required this.registrar,
  });

  final SQLEntry selected;
  final List<SQLEntry> registrar;
  final Map<String, List<SQLEntry>> navigation;

  @override
  Widget build(BuildContext context) {
    final keys = navigation.keys.toList()..sort();
    return CustomScrollView(
      slivers: [
        for (final type in keys)
          SliverMainAxisGroup(slivers: [
            SliverPersistentHeader(
              delegate: HeaderDelegate(type),
              pinned: true,
            ),
            Builder(builder: (_) {
              final entries = navigation[type] ?? [];
              return SliverList.separated(
                itemCount: entries.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                    entries[index].title.toUpperCase(),
                    style: Consts.typography.copyWith(
                      fontWeight: entries[index].key == selected.key ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  onTap: () => context.go('${Consts.pathToGospel}/${entries[index].key}'),
                  hoverColor: Consts.color.darken(),
                ),
                separatorBuilder: (_, __) => const Divider(
                  height: 0,
                  color: Colors.black,
                  endIndent: 10,
                  indent: 10,
                ),
              );
            }),
          ]),
      ],
    );
  }
}

class HeaderDelegate extends SliverPersistentHeaderDelegate {
  HeaderDelegate(this.title);

  final String title;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Consts.color,
      padding: EdgeInsets.all(Consts.padding),
      child: Text(
        title.toUpperCase(),
        style: Consts.typographyHeader,
      ),
    );
  }

  @override
  double get maxExtent => 66.0;

  @override
  double get minExtent => 66.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}
