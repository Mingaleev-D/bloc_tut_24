import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/swither_bloc.dart';

class SwitherPage extends StatelessWidget {
  const SwitherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switcher'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('notification'),
              BlocBuilder<SwitherBloc, SwitherState>(
                builder: (context, state) {
                  return Switch(
                      value: state.isSwitch,
                      onChanged: (newValue) {
                        context
                            .read<SwitherBloc>()
                            .add(EnableOrDisableNotification());
                      });
                },
              )
            ],
          ),
          const SizedBox(height: 30),
          BlocBuilder<SwitherBloc, SwitherState>(
            builder: (context, state) {
              return Container(
                height: 200,
                color: Colors.red.withOpacity(state.sliderValue),
              );
            },
          ),
          const SizedBox(height: 50),
          BlocBuilder<SwitherBloc, SwitherState>(
            builder: (context, state) {
              return Slider(
                value: state.sliderValue,
                onChanged: (value) {
                  context
                      .read<SwitherBloc>()
                      .add(SwitherChangedEvent(slider: value));
                },
              );
            },
          )
        ],
      ),
    );
  }
}
