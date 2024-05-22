import 'package:flutter/widgets.dart';

class AlertWidget extends StatelessWidget {
  const AlertWidget({
    super.key,
    required this.alert,
  });
  final String alert;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Flexible(
      child: SizedBox(
          width: size.width,
          height: size.height * 0.6,
          child: Center(child: Text(alert))),
    );
  }
}
