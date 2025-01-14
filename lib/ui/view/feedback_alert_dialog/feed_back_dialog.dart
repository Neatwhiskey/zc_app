import 'package:flutter/material.dart';

import '../../../general_widgets/app_alert_dialog.dart';

class FeedBackDialogCall extends StatelessWidget {
  const FeedBackDialogCall({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        onPressed: () => AppAlertDialog().appDialog(
          context,
          'Compose feedback',
          "e.g i found a bug in the DM's",
        ),
        child: const Text('Alert'),
      ),
    );
  }
}
