//import 'dart:async';
//import 'package:auth_test/src/location_services.dart';
import 'package:auth_test/components/modals/address_autocomplete_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../src/colors.dart';

class EventAddressForm extends StatefulWidget {
  final String defaultText;
  const EventAddressForm({
    super.key,
    required this.defaultText,
  });

  @override
  State<EventAddressForm> createState() => _EventAddressFormState();
}

class _EventAddressFormState extends State<EventAddressForm> {
  //maybe make this
  //stateless
  //This is specifically for mmodal to edit address
  final TextEditingController _addressSearchController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Container(
        decoration: const BoxDecoration(
          color: backgroundWhite,
          borderRadius: BorderRadiusDirectional.all(
            Radius.circular(7),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Flexible(
            child: Text(
              widget.defaultText,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color.fromARGB(255, 128, 128, 128),
              ),
            ),
          ),
        ),
      ),
      onPressed: () => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          content: AddressAutocompleteModal(
            textController: _addressSearchController,
          ),
        ),
      ),
    );
  }
}
