import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:stacked_services/stacked_services.dart';

class SendFeedbackDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const SendFeedbackDialog(
      {Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.transparent,
        child:
            _SendFeedbackDialogContent(request: request, completer: completer));
  }
}

class _SendFeedbackDialogContent extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const _SendFeedbackDialogContent(
      {Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = TextEditingController();
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * .05, vertical: size.height * .02),
      color: Colors.white,
      width: size.width * .9,
      height: size.height * .3,
      child: Column(
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              ComposeFeedback,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: double.infinity),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                  hintText: FeedbackHint, helperText: FeedbackHelperText),
              minLines: 1,
              maxLines: 5,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              MaterialButton(
                  onPressed: () => completer(DialogResponse(confirmed: false)),
                  child: const Text(Cancel)),
              MaterialButton(
                  onPressed: () => completer(
                      DialogResponse(data: controller.text, confirmed: true)),
                  child: const Text(Ok)),
            ],
          )
        ],
      ),
    );
  }
}
