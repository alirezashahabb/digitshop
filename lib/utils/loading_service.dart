import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class LoadingService extends StatelessWidget {
  const LoadingService({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Lottie.asset('assets/img/loading.json'),
    );
  }
}
