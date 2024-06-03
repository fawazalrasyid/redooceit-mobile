import 'package:flutter/material.dart';

import '../../data/models/member_model.dart';

class SearchableDropdown extends StatefulWidget {
  final List<Member> items;
  final Member? selectedValue;
  final ValueChanged<Member?> onChanged;

  const SearchableDropdown({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  SearchableDropdownState createState() => SearchableDropdownState();
}

class SearchableDropdownState extends State<SearchableDropdown> {
  TextEditingController textEditingController = TextEditingController();
  List<Member> filteredItems = [];

  @override
  void initState() {
    textEditingController.addListener(_onTextChanged);
    filteredItems.addAll(widget.items);
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      filteredItems = widget.items.where((item) {
        final query = textEditingController.text.toLowerCase();
        return item.name.toLowerCase().contains(query) ||
            item.address.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: textEditingController,
          decoration: const InputDecoration(
            labelText: 'Search',
            prefixIcon: Icon(Icons.search),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonFormField<Member>(
            value: widget.selectedValue,
            onChanged: widget.onChanged,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 12),
              border: InputBorder.none,
            ),
            items: filteredItems.map((member) {
              return DropdownMenuItem<Member>(
                value: member,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(member.photoUrl),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          member.name,
                          style: const TextStyle(
                            color: Color(0xFF0E132E),
                            fontSize: 14,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          member.address,
                          style: const TextStyle(
                            color: Color(0xFF0E132E),
                            fontSize: 12,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
