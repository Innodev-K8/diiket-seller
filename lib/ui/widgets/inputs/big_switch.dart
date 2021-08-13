import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:seller/ui/common/styles.dart';

class BigSwitch extends HookWidget {
  const BigSwitch({
    Key? key,
    this.onToggle,
    this.initialValue = false,
    this.height = 45.0,
    this.width = 195.0,
  }) : super(key: key);

  final bool initialValue;
  final Function(bool)? onToggle;

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    // keep track of the state, on or off
    final state = useState(initialValue);

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: height,
      width: width,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: ColorPallete.primaryColor,
        borderRadius: BorderRadius.circular(height),
      ),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) => Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              top: 0,
              bottom: 0,
              left: state.value ? constraints.maxWidth / 2 : 0,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                width: constraints.maxWidth / 2,
                height: constraints.maxHeight,
                decoration: BoxDecoration(
                  color: state.value ? Colors.white : ColorPallete.errorColor,
                  borderRadius: BorderRadius.circular(height),
                ),
              ),
            ),
            Positioned.fill(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        state.value = false;

                        onToggle?.call(false);
                      },
                      child: Container(
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        child: Text(
                          'Tutup',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        state.value = true;

                        onToggle?.call(true);
                      },
                      child: Container(
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        child: Text(
                          'Buka',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: state.value == true
                                ? ColorPallete.textColor
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
