import 'package:flutter/material.dart';

enum Sizes { small, medium, large }

class SegmentedSizeChoice extends StatefulWidget {
  const SegmentedSizeChoice({super.key});

  @override
  State<SegmentedSizeChoice> createState() => _SegmentedSizeChoiceState();
}

class _SegmentedSizeChoiceState extends State<SegmentedSizeChoice> {
  Sizes selection = Sizes.large;
  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Sizes>(
      showSelectedIcon: false,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Color(0xFF636366);
          }
          return Color(0x90767680);
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Color(0xFFEBEBF5);
          }
          return Color(0x90EBEBF5);
        }),
        side: WidgetStateProperty.all(BorderSide.none),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        padding: WidgetStateProperty.all(EdgeInsets.fromLTRB(2, 0, 2, 0)),
        fixedSize: WidgetStateProperty.all(Size.fromHeight(14)),
      ),
      segments: const <ButtonSegment<Sizes>>[
        ButtonSegment<Sizes>(
          value: Sizes.small,
          label: Text(
            'Small',
            style: TextStyle(
              fontFamily: 'SF Pro Text',
              fontSize: 11,
              letterSpacing: -0.08,
              //height: 1.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ButtonSegment<Sizes>(
          value: Sizes.medium,
          label: Text(
            'Medium',
            style: TextStyle(
              fontFamily: 'SF Pro Text',
              fontSize: 11,
              letterSpacing: -0.08,
              //height: 1.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ButtonSegment<Sizes>(
          value: Sizes.large,
          label: Text(
            'Large',
            style: TextStyle(
              fontFamily: 'SF Pro Text',
              fontSize: 11,
              letterSpacing: -0.08,
              //height: 1.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
      selected: <Sizes>{selection},
      onSelectionChanged: (Set<Sizes> newSelection) {
        setState(() {
          selection = newSelection.first;
        });
      },
    );
  }
}
