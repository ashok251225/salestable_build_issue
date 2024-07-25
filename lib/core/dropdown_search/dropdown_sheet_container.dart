import 'package:flutter/material.dart';
import 'package:salestable/core/dropdown_search/form_search_field.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_theme.dart';
import 'package:salestable/core/texts/medium_style_title.dart';

class DropDownSheetContainer extends StatefulWidget {
  final List<dynamic> options;

  const DropDownSheetContainer(
      {super.key, required this.options, required this.onChanged});

  final Function(String value) onChanged;

  @override
  State<DropDownSheetContainer> createState() => _DropDownSheetContainerState();
}

class _DropDownSheetContainerState extends State<DropDownSheetContainer> {
  TextEditingController searchController = TextEditingController(text: '');
  List<dynamic> _items = [];

  void initState() {
    super.initState();
    _items = widget.options;
  }

  void filteredItems({String name = ''}) {
    setState(() {
      _items = widget.options
          .where((dynamic item) =>
              item.toString().toLowerCase().contains(name.toLowerCase()))
          .toList();
    });
  }

  Widget buildSearchTile(String title) {
    return ListTile(
      dense: true,
      title: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: MediumStyleTitle(text: title),
      ),
      onTap: () => widget.onChanged(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 32, left: 14, right: 14),
              child: FormSearchField(
                controller: searchController,
                hintText: 'Search',
                onChanged: (String? value) {
                  filteredItems(name: value!);
                  setState(() {});
                },
              ),
            ),
            Expanded(
              child: ListView(
                semanticChildCount: _items.length,
                shrinkWrap: true,
                children: _items.map((e) => buildSearchTile(e)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
