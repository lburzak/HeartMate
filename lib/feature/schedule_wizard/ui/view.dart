import 'package:apkainzynierka/feature/profile_editor/ui/view.dart';
import 'package:apkainzynierka/feature/schedule_wizard/model/schedule_type.dart';
import 'package:apkainzynierka/feature/schedule_wizard/model/schedule_wizard_state.dart';
import 'package:apkainzynierka/feature/schedule_wizard/service/cubit.dart';
import 'package:apkainzynierka/util/date.dart';
import 'package:apkainzynierka/util/string.dart';
import 'package:apkainzynierka/widget/action_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScheduleWizardView extends StatelessWidget {
  final ScheduleWizardState state;
  final ScheduleWizardCubit cubit;

  const ScheduleWizardView(
      {super.key, required this.cubit, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SafeArea(
            child: Padding(
          padding: EdgeInsets.all(18.0),
          child: Header(
            text: "Dostosuj harmonogram",
          ),
        )),
        _ScheduleTypeSelector(
          selectedType: state.scheduleType,
          onTypeSelected: (type) => cubit.setScheduleType(type!),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 12, bottom: 12),
          child: state.scheduleType == ScheduleType.weekly
              ? buildRowWeekly()
              : buildRowDaily(),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ActionButton(
            onPressed: cubit.save,
            label: "ZAPISZ",
            icon: Icons.done,
          ),
        )
      ],
    );
  }

  Widget buildRowDaily() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Codziennie",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        DosagePicker(
            onIncrement: () => cubit.incrementDosage(0),
            onDecrement: () => cubit.decrementDosage(0),
            dosage: state.dosages[0])
      ],
    );
  }

  Widget buildRowWeekly() {
    return Column(
        children: List.generate(
            7,
            (index) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateFormat("EEEE", "pl_PL")
                            .format(DateTime.now()
                                .week
                                .monday
                                .add(Duration(days: index)))
                            .capitalize(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      DosagePicker(
                        onIncrement: () => cubit.incrementDosage(index),
                        onDecrement: () => cubit.decrementDosage(index),
                        dosage: state.dosages[index],
                      )
                    ])));
  }
}

class DosagePicker extends StatelessWidget {
  final void Function() onIncrement;
  final void Function() onDecrement;
  final double dosage;

  const DosagePicker(
      {super.key,
      required this.onIncrement,
      required this.onDecrement,
      required this.dosage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleButton(
          onPressed: onDecrement,
          icon: Icons.remove,
        ),
        SizedBox(
          width: 90,
          child: Center(
            child: Text(
              "$dosage mg",
              style: const TextStyle(fontSize: 17),
            ),
          ),
        ),
        CircleButton(
          onPressed: onIncrement,
          icon: Icons.add,
        ),
      ],
    );
  }
}

class CircleButton extends StatelessWidget {
  final void Function() onPressed;
  final IconData icon;

  const CircleButton({super.key, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints(minHeight: 36, minWidth: 36),
      onPressed: onPressed,
      elevation: 2.0,
      fillColor: Colors.blue,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: Icon(
        icon,
        size: 20.0,
      ),
    );
  }
}

class _ScheduleTypeSelector extends StatelessWidget {
  final ScheduleType selectedType;
  final void Function(ScheduleType? type) onTypeSelected;

  const _ScheduleTypeSelector({
    Key? key,
    required this.selectedType,
    required this.onTypeSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ScheduleTypeOption(
          scheduleType: ScheduleType.daily,
          selectedScheduleType: selectedType,
          onChanged: onTypeSelected,
        ),
        _ScheduleTypeOption(
          scheduleType: ScheduleType.weekly,
          selectedScheduleType: selectedType,
          onChanged: onTypeSelected,
        ),
      ],
    );
  }
}

class _ScheduleTypeOption extends StatelessWidget {
  final ScheduleType scheduleType;
  final ScheduleType selectedScheduleType;
  final void Function(ScheduleType? value) onChanged;

  const _ScheduleTypeOption({
    Key? key,
    required this.scheduleType,
    required this.selectedScheduleType,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: _createTitle(),
      subtitle: _createDescription(),
      leading: Radio<ScheduleType>(
        activeColor: Colors.blue,
        value: scheduleType,
        groupValue: selectedScheduleType,
        onChanged: onChanged,
      ),
    );
  }

  Widget _createTitle() {
    switch (scheduleType) {
      case ScheduleType.daily:
        return const Text("Cykl dzienny");
      case ScheduleType.weekly:
        return const Text("Cykl tygodniowy");
    }
  }

  Widget _createDescription() {
    switch (scheduleType) {
      case ScheduleType.daily:
        return const Text("Przyjmujesz taką samą dawkę każdego dnia");
      case ScheduleType.weekly:
        return const Text("Określ dawkę dla każdego dnia tygodnia");
    }
  }
}
