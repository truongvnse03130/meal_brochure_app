import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  void _onToggleChanged(Filter currentFilter, bool isChecked, WidgetRef ref) {
    ref.read(filterProvider.notifier).setFilter(currentFilter, isChecked);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(onSelectScreen: (identifier) {
      //   Navigator.of(context).pop();
      //   if (identifier == 'meals') {
      //     Navigator.of(context)
      //         .pushReplacement(MaterialPageRoute(builder: (ctx) => TabsScreen()));
      //   }
      // }),
      body: Column(
        children: [
          FilterSwitch(
            title: 'Gluten-free',
            subTitle: 'Only inclue gluten-free meals.',
            value: activeFilters[Filter.glutenFree]!,
            onChangedStatus: (isChecked) {
              _onToggleChanged(Filter.glutenFree, isChecked, ref);
            },
          ),
          FilterSwitch(
            title: 'Lactose-free',
            subTitle: 'Only inclue lactose-free meals.',
            value: activeFilters[Filter.lactoseFree]!,
            onChangedStatus: (isChecked) {
              _onToggleChanged(Filter.lactoseFree, isChecked, ref);
            },
          ),
          FilterSwitch(
            title: 'Vegetarian',
            subTitle: 'Only inclue vegetarian meals.',
            value: activeFilters[Filter.vegetarianFree]!,
            onChangedStatus: (isChecked) {
              _onToggleChanged(Filter.vegetarianFree, isChecked, ref);
            },
          ),
          FilterSwitch(
            title: 'Vegan',
            subTitle: 'Only inclue vegan meals.',
            value: activeFilters[Filter.veganFree]!,
            onChangedStatus: (isChecked) {
              _onToggleChanged(Filter.veganFree, isChecked, ref);
            },
          )
        ],
      ),
    );
  }
}

class FilterSwitch extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool value;

  final void Function(bool isChecked) onChangedStatus;

  const FilterSwitch(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.value,
      required this.onChangedStatus});

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: value,
      onChanged: (isChecked) {
        onChangedStatus(isChecked);
      },
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(
        left: 34,
        right: 22,
      ),
    );
  }
}
