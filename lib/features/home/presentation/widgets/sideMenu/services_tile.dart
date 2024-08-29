
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pos_flutter/features/home/infrastucture/models/service.dart';
import 'package:pos_flutter/features/home/providers.dart';

class ServiceTile extends ConsumerWidget {
  final ServiceModel service;
  final bool isAdd;

  const ServiceTile({super.key, required this.service, this.isAdd = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isCollapsed = ref.watch(isSideMenuCollapsed);
    return SizedBox(
      height: 40,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Padding(
          padding: EdgeInsets.only(left: isCollapsed ? 24 : 8.0),
          child: CircleAvatar(
              maxRadius: 15,
              backgroundColor: const Color(0xffE9E7E8),
              child: isAdd
                  ? const Icon(
                      Icons.add,
                      size: 18,
                    )
                  : SvgPicture.asset(
                      service.icon,
                      width: 18,
                    )),
        ),
        title: isCollapsed
            ? null
            : Text(
                service.name,
                overflow: TextOverflow.fade,
                maxLines: 1,
                softWrap: false,
                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
              ),
      ),
    );
  }
}
