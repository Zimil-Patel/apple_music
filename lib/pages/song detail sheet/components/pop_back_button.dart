import 'package:flutter/cupertino.dart';

import '../../../utils/constant.dart';

class PopBackButton extends StatelessWidget {
  const PopBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CupertinoButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(CupertinoIcons.clear_circled_solid, color: CupertinoColors.white.withOpacity(0.8), size: height * 0.034,),
        ),
        const SizedBox(
          width: 4,
        ),
      ],
    );
  }
}