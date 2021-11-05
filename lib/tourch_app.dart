import 'package:bloc_test/bloc/flash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'constants/colors.dart';

class TourchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBrown,
      body: BlocBuilder<FlashCubit, FlashState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 50, top: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Flashlight : ',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: state.status.toString(),
                        style: TextStyle(
                          color: state.status == "ON" ? kOrange : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: double.infinity,
                  height: 30,
                ),
                if (state is FlashOnState)
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 150,
                        backgroundColor: kBrownOrange1,
                      ),
                      const CircleAvatar(
                        radius: 120,
                        backgroundColor: kBrownOrange2,
                      ),
                      InkWell(
                        onTap: () {
                          BlocProvider.of<FlashCubit>(context).toggleFlash();
                        },
                        child: const CircleAvatar(
                          radius: 80,
                          backgroundColor: kOrange,
                          child: Icon(
                            Icons.power_settings_new,
                            size: 100,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                if (state is FlashOffState)
                  InkWell(
                    onTap: () {
                      BlocProvider.of<FlashCubit>(context).toggleFlash();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        bottom: 70,
                      ),
                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 5,
                          color: kOrange,
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Icon(
                        Icons.power_settings_new,
                        size: 100,
                        color: Colors.grey,
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
