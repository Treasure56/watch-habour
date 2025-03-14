import 'package:flutter/material.dart';
import 'package:watch_hub/utils/utils.dart';

class SearchInput extends StatelessWidget {
  const SearchInput(
      {super.key, required this.onChanged, this.placeholder = "Search Help"});
  final Function(String) onChanged;
  final String placeholder;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: size * 3),
      padding: const EdgeInsets.symmetric(horizontal: size * 2),
      height: size * 6,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size * 3),
          color: AppColors.white),
      child: Row(
        children: [
          const Icon(Icons.search_rounded, color: AppColors.dark),
          const SizedBox(width: size * 2),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: placeholder,
                  hintStyle: TextStyle(
                    color: AppColors.dark.withOpacity(.5),
                  ),
                  enabledBorder: InputBorder.none),
              style: const TextStyle(
                fontSize: size * 2.5,
                color: AppColors.dark,
              ),
              cursorColor: Theme.of(context).primaryColor,
              onChanged: onChanged,
            ),
          )
        ],
      ),
    );
  }
}
