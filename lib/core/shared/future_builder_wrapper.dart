import 'package:flutter/material.dart';
import 'package:salestable/core/shared/loading_for_all.dart';
import 'package:flutter/foundation.dart';
import 'package:salestable/core/shared/snapshoterror_handler.dart';

class FutureBuilderWrapper<T> extends StatelessWidget {
  const FutureBuilderWrapper({
    Key? key,
    required this.snapshot,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final AsyncSnapshot<T> snapshot;

  @override
  Widget build(BuildContext context) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return LoadingAll();
    } else if (snapshot.hasError) {
      return SnapshotErrorHandler(snapshot: snapshot);
    } else {
      return child;
    }
  }
}
