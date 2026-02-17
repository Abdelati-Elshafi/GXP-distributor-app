import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/scan_button/scan_button_widget.dart';
import '/components/order_card/order_card_widget.dart';

// Focus widget keys for this walkthrough
final containerZpb7dhpe = GlobalKey();
final containerLz6k68yw = GlobalKey();

/// Test
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: containerZpb7dhpe,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => ScanButtonWidget(),
          ),
        ],
      ),

      /// fff
      TargetFocus(
        keyTarget: containerLz6k68yw,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.left,
            builder: (context, __) => OrderCardWidget(),
          ),
        ],
      ),
    ];
