import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/ui/main/today/viewmodel/today_page_viewmodel.dart';
import 'package:project_app/ui/main/today/widgets/today_body.dart';
import 'package:project_app/ui/main/today/widgets/today_header.dart';

import 'viewmodel/visibility_state_viewmodel.dart';

class TodayPage extends ConsumerWidget {
  const TodayPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visibilityState = ref.watch(visibilityProvider);
    TodayPageModel? model = ref.watch(TodayPageProvider);

    if (model == null) {
      return Center(child: CircularProgressIndicator()); // 또는 적절한 위젯으로 대체
    } else {
      return Scaffold(
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            TodayHeader(visibilityState,model),
            TodayBody(),
          ],
        ),
      );
    }
  }
}
