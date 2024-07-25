import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:salestable/controllers/pulse_controller.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_theme.dart';
import 'package:salestable/core/texts/small_style_title.dart';
import 'package:salestable/models/get_post_count_response.dart';

class PulseCategoryFilter extends StatefulWidget {
  const PulseCategoryFilter({
    super.key,
    required this.categoryCountList,
    required this.onUpdate,
  });

  final List<CategoryElement> categoryCountList;
  final void Function({String category}) onUpdate;

  @override
  _PulseCategoryFilterState createState() => _PulseCategoryFilterState();
}

class _PulseCategoryFilterState extends State<PulseCategoryFilter> {
  final PulseController controller = Get.put(PulseController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PulseController>(
      builder: (controller) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.07,
        width: double.infinity,
        child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 3.0,
          shrinkWrap: true,
          crossAxisCount: widget.categoryCountList.length,
          children: List.generate(widget.categoryCountList.length, (index) {
            final isSelected = controller.isChipSelected[index];

            return ActionChip(
              side: BorderSide(
                  color: FlutterFlowTheme.of(context)
                      .loginButton
                      .withOpacity(0.1)),
              label: Row(
                children: [
                  SvgPicture.asset(
                    _getAssetPath(index),
                    fit: BoxFit.fitHeight,
                    height: 20,
                    width: 20,
                    color: isSelected ? Colors.white : null,
                  ),
                  SmallStyleTitle(
                    text: '+${widget.categoryCountList[index].userPostCount}',
                    color: isSelected ? Colors.white : null,
                    fontSize: 12,
                  )
                ],
              ),
              onPressed: () {
                widget.onUpdate(
                    category: !isSelected ? (index + 1).toString() : '0');
                controller.updateSelectedCategory(index);
              },
              backgroundColor:
                  isSelected ? const Color(0xFF0494FD) : Colors.white,
              elevation: isSelected ? 0.0 : 2.0,
              shadowColor: Colors.white,
              surfaceTintColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }),
        ),
      ),
    );
  }

  String _getAssetPath(int index) {
    switch (index) {
      case 0:
        return 'assets/images/pulse_lessons_learned.svg';
      case 1:
        return 'assets/images/pulse_best_practices.svg';
      case 2:
        return 'assets/images/pulse_thoughts.svg';
      case 3:
        return 'assets/images/pulse_daily_boost.svg';
      case 4:
        return 'assets/images/pulse_wins.svg';
      default:
        return '';
    }
  }
}
