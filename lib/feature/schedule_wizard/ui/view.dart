import 'package:apkainzynierka/feature/schedule_wizard/model/schedule_type.dart';
import 'package:apkainzynierka/feature/schedule_wizard/model/schedule_wizard_state.dart';
import 'package:apkainzynierka/feature/schedule_wizard/service/cubit.dart';
import 'package:flutter/material.dart';

class ScheduleWizardView extends StatelessWidget {
  final ScheduleWizardState state;
  final ScheduleWizardCubit cubit;

  const ScheduleWizardView(
      {super.key, required this.cubit, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SafeArea(child: Text("Nowy harmonogram")),
        _CalendarField(
          dateTime: state.startDate,
          onDateSelected: (DateTime selectedDate) {
            print(selectedDate.day);
          },
        ),
        _CalendarField(
          dateTime: state.endDate,
          onDateSelected: (DateTime selectedDate) {
            print(selectedDate);
          },
        ),
        const _ScheduleTypeSelector()
      ],
    );
  }
}

class _ScheduleTypeSelector extends StatefulWidget {
  const _ScheduleTypeSelector({
    Key? key,
  }) : super(key: key);

  @override
  State<_ScheduleTypeSelector> createState() => _ScheduleTypeSelectorState();
}

class _ScheduleTypeSelectorState extends State<_ScheduleTypeSelector> {
  ScheduleType selectedType = ScheduleType.daily;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ScheduleTypeOption(
          scheduleType: ScheduleType.daily,
          selectedScheduleType: selectedType,
          onChanged: (_) {
            setState(() {
              selectedType = ScheduleType.daily;
            });
          },
        ),
        _ScheduleTypeOption(
          scheduleType: ScheduleType.weekly,
          selectedScheduleType: selectedType,
          onChanged: (_) {
            setState(() {
              selectedType = ScheduleType.weekly;
            });
          },
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
        value: scheduleType,
        groupValue: selectedScheduleType,
        onChanged: onChanged,
      ),
    );
  }

  Widget _createTitle() {
    switch (scheduleType) {
      case ScheduleType.daily:
        return Text("Cykl dzienny");
      case ScheduleType.weekly:
        return Text("Cykl tygodniowy");
    }
  }

  Widget _createDescription() {
    switch (scheduleType) {
      case ScheduleType.daily:
        return Text("Przyjmujesz  taką samą dawkę każdego dnia");
      case ScheduleType.weekly:
        return Text("Określ dawkę dla każdego dnia tygodnia");
    }
  }
}

class _CalendarField extends StatelessWidget {
  final DateTime dateTime;
  final void Function(DateTime selectedDate) onDateSelected;

  const _CalendarField({
    Key? key,
    required this.dateTime,
    required this.onDateSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Text(dateTime.toString()),
        onPressed: () {
          onDateSelected(DateTime.now());
        });
  }
}
