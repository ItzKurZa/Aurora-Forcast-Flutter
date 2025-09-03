import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aurora_forecast/core/constants/k_sizes.dart';
import '../../application/alert_cubit.dart';
import '../../application/alert_state.dart';

class AlertsToggleWidget extends StatelessWidget {
  const AlertsToggleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlertCubit, AlertState>(
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.black,
            border: Border(bottom: BorderSide(color: Colors.white12, width: 1)),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text(
              'Enable Alerts',
              style: TextStyle(
                color: Colors.white,
                fontSize: KSizes.fontSizeL,
                fontWeight: FontWeight.normal,
              ),
            ),
            trailing: state.isGlobalAlertsLoading
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Switch(
                    value: state.globalAlertsEnabled,
                    onChanged: (val) =>
                        context.read<AlertCubit>().toggleGlobalAlerts(val),
                    activeThumbColor: Colors.blue,
                  ),
          ),
        );
      },
    );
  }
}
