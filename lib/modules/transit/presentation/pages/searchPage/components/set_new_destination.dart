import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_find_taxi/_shared/presentation/widgets/app_container.dart';

class SetNewDestination extends StatelessWidget {
  const SetNewDestination({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(
            child: AppContainer(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 22),
              child: Row(
                children: [
                  Icon(
                    Icons.map_outlined,
                    color: Colors.black.withOpacity(.30),
                  ),
                  const Gap(9),
                  Text(
                    "Set A New Destination",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(.30),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Gap(15),
          AppContainer(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Go",
              style: TextStyle(
                color: Colors.black.withOpacity(.30),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
