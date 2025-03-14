import 'package:flutter/material.dart';
import 'package:watch_hub/utils/utils.dart';
import 'package:watch_hub/widgets/widgets.dart';

class AddressSettingsScreen extends StatefulWidget {
  const AddressSettingsScreen({super.key});

  @override
  State<AddressSettingsScreen> createState() => _AddressSettingsScreenState();
}

class _AddressSettingsScreenState extends State<AddressSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Address Settings",
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(size * 3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppTextField(
                label: "Country",
                hintText: "select country",
              ),
              const SizedBox(height: 12),
              const AppTextField(
                label: "State",
                hintText: "select state",
              ),
              const SizedBox(height: 12),
              const AppTextField(
                label: "Address",
                hintText: "enter address here",
              ),
              const SizedBox(height: 20),
              AppButton.primary(
                onPressed: () => back(context),
                child: "Save",
              )
            ],
          ),
        ),
      ),
    );
  }
}
