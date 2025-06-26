import 'package:flutter/material.dart';

class InternetExceptionWidget extends StatelessWidget {
  final VoidCallback onPress;
  const InternetExceptionWidget({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.15,
        ),
        Icon(
          Icons.cloud_off_outlined,
          size: 50,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Text(
            "We're unable to show results,\nplease check your data\nconnection",
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontSize: 20),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        ElevatedButton(onPressed: onPress, child: Text("Retry"))
      ],
    );
  }
}
