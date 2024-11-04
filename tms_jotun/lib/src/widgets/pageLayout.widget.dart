import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:tms_jotun/src/widgets/emptyWidget.dart';

class PageLayout extends StatelessWidget {
  final Function()? onBack;
  final String? pageName;
  final Widget? child;
  final List<Widget>? children;
  final Widget? backScreen;
  final bool? showBackBtn;
  final int? adjustHeight;
  final double? padding;
  final double? paddingVertical;
  final double? paddingHorizontal;
  final Future<void> Function()? onRefresh;

  const PageLayout({
    super.key,
    this.onBack,
    this.pageName,
    this.child,
    this.children,
    this.showBackBtn = false,
    this.adjustHeight = 128,
    this.padding = 16,
    this.paddingVertical = 0,
    this.paddingHorizontal = 0,
    this.onRefresh,
    this.backScreen,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double paddingTop = MediaQuery.of(context).padding.top;
    final double paddingBottom = MediaQuery.of(context).padding.bottom;
    final double safeAreaHeight =
        screenHeight - paddingTop - paddingBottom - 32 - adjustHeight!.toDouble();

    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SafeArea(
            child: PopScope(
              canPop: onBack != null || backScreen != null ? false : true,
              onPopInvoked: (result) {
                onBack?.call() ?? () {
                  if (backScreen != null) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => backScreen!),
                    );
                  }
                };
              },
              child: onRefresh != null
                  ? RefreshIndicator(
                      onRefresh: onRefresh!,
                      child: _buildScrollableContent(safeAreaHeight),
                    )
                  : _buildScrollableContent(safeAreaHeight),
            ),
          ),
        );
      },
    );
  }

  Widget _buildScrollableContent(double safeAreaHeight) {
    return SingleChildScrollView(
      padding: paddingVertical != 0 || paddingHorizontal != 0
          ? EdgeInsets.symmetric(
              vertical: paddingVertical ?? 16,
              horizontal: paddingHorizontal ?? 16,
            )
          : EdgeInsets.all(padding ?? 16),
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: safeAreaHeight),
        child: IntrinsicHeight(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children ?? [child ?? const EmptyWidget()],
          ),
        ),
      ),
    );
  }
}
