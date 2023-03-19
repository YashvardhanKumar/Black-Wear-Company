import 'package:bfm/components/buttons/custom_chips.dart';
import 'package:bfm/components/buttons/text_button.dart';
import 'package:bfm/components/custom_app_bar.dart';
import 'package:bfm/components/custom_text.dart';
import 'package:flutter/material.dart';
import '../../../components/buttons/icon_button.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  bool deliveryAddressSelected = false;
  bool paymentSelected = false;
  int currentStep = 1;
  Size addressBoxSize = Size.zero;
  int paymentMethodIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const Expanded(
                      child: CustomText(
                        '1.\tSelect a delivery address',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (deliveryAddressSelected)
                      Icon(
                        Icons.verified_rounded,
                        color: Colors.green.shade600,
                        size: 26,
                      ),
                  ],
                ),
              ),
              if (currentStep == 1)
                SelectDeliveryAddress(
                  onAddressConfirmClicked: () {
                    currentStep++;
                    deliveryAddressSelected = true;
                    setState(() {});
                  },
                  onAddressSelectedChanged: (List<int> value) {},
                ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomText(
                  '2.\tPayment Method',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade400,
                ),
              ),
              if (currentStep == 2)
                PaymentMethodCard(
                  onChanged: (int? value) {},
                ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomText(
                  '3.\tItems and Delivery',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade400,
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          'Subtotal:',
                          fontSize: 16,
                        ),
                        CustomText(
                          '\$1403.97',
                          fontSize: 16,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          'Discount:',
                          fontSize: 16,
                        ),
                        CustomText(
                          '- \$60.00',
                          fontSize: 16,
                          color: Colors.green,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          'Tax:',
                          fontSize: 16,
                        ),
                        CustomText(
                          '+ \$14.00',
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          'Total:',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        CustomText(
                          '+ \$14.00',
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomFilledButton(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: CustomText(
                          'Checkout',
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                      onPressed: (deliveryAddressSelected && paymentSelected)
                          ? () {}
                          : null,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectDeliveryAddress extends StatefulWidget {
  const SelectDeliveryAddress({
    Key? key,
    required this.onAddressConfirmClicked,
    required this.onAddressSelectedChanged,
  }) : super(key: key);
  final VoidCallback onAddressConfirmClicked;
  final ValueChanged<List<int>> onAddressSelectedChanged;

  @override
  State<SelectDeliveryAddress> createState() => _SelectDeliveryAddressState();
}

class _SelectDeliveryAddressState extends State<SelectDeliveryAddress> {
  List<int> checkedAddresses = [];

  List<Widget> addresses() {
    List<Widget> addressWidgets = [];
    for (int i = 0; i < 3; i++) {
      addressWidgets.add(
        AddressListTile(
          value: checkedAddresses.contains(i),
          onChanged: (bool? value) {
            if (value!) {
              checkedAddresses.add(i);
            } else {
              checkedAddresses.remove(i);
            }
            setState(() {});
            widget.onAddressSelectedChanged(checkedAddresses);
          },
          address:
          'A48 prem nagar, Gwalior, Madhya Pradesh, 474002, india, phone number: 8269847447',
          ownerName: 'Navyug verma',
        ),
      );
    }
    return addressWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            'Your Addresses',
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          const CustomText(
            'Sending items to more than one Address',
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: addresses(),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: CustomTextButton(
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: CustomText(
                      'Edit Address',
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Container(
                width: 1,
                height: 16,
                color: Colors.grey,
                margin: const EdgeInsets.symmetric(horizontal: 5),
              ),
              Expanded(
                flex: 3,
                child: CustomTextButton(
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: CustomText(
                      'Add Delivery Instructions',
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          CustomOutlineButton(
            child: const Padding(
              padding: EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Icon(Icons.add_rounded),
                  CustomText(
                    'Add a new Address',
                    textAlign: TextAlign.center,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
            onPressed: () {},
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topRight,
            child: CustomFilledButton(
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: CustomText(
                  'Use this Address',
                  textAlign: TextAlign.center,
                  color: Colors.white,
                ),
              ),
              onPressed: widget.onAddressConfirmClicked,
            ),
          ),
        ],
      ),
    );
  }
}

class AddressListTile extends StatelessWidget {
  const AddressListTile({
    super.key,
    required this.value,
    required this.onChanged,
    required this.address,
    required this.ownerName,
  });

  final String address;
  final String ownerName;
  final bool value;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          activeColor: Colors.black,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          splashRadius: 0,
          visualDensity: VisualDensity.compact,
          side: const BorderSide(
            color: Colors.black,
            width: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          value: value,
          onChanged: onChanged,
        ),
        Flexible(
          child: RichText(
            text: TextSpan(
              text: ownerName,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
              children: [
                TextSpan(
                  text: ' $address',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade700,
                    fontFamily: 'Poppins',
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class PaymentMethodCard extends StatefulWidget {
  const PaymentMethodCard({Key? key, required this.onChanged})
      : super(key: key);
  final ValueChanged<int?> onChanged;

  @override
  State<PaymentMethodCard> createState() => _PaymentMethodCardState();
}

class _PaymentMethodCardState extends State<PaymentMethodCard> {
  int? paymentIdx;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            'Your available balance',
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  color: Colors.grey,
                ),
              ),
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      const Flexible(
                        child: TextField(
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            isCollapsed: true,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 46,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                      ),
                      CustomTextButton(
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: CustomText('Apply'),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomText(
            'Another Payment method',
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomText(
            'Pay with Debit/Credit/Atm Cards',
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
          const CustomText(
            'You can save your cards as per new RBI guidlines',
            color: Colors.grey,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                height: 20,
                width: 45,
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(
                      color: Colors.grey.shade300,
                      strokeAlign: BorderSide.strokeAlignOutside),
                ),
                child: Image.asset('images/americanexpress.png',
                    fit: BoxFit.fitWidth),
              ),
              Container(
                height: 20,
                width: 45,
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(
                      color: Colors.grey.shade300,
                      strokeAlign: BorderSide.strokeAlignOutside),
                ),
                child: Image.asset('images/mastercardlogo.png',
                    fit: BoxFit.fitHeight),
              ),
              Container(
                height: 20,
                width: 45,
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(
                      color: Colors.grey.shade300,
                      strokeAlign: BorderSide.strokeAlignOutside),
                ),
                child: Image.asset('images/paypal.png', fit: BoxFit.fitWidth),
              ),
              Container(
                height: 20,
                width: 45,
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(
                      color: Colors.grey.shade300,
                      strokeAlign: BorderSide.strokeAlignOutside),
                ),
                child: Image.asset(
                    'images/visalogo.png', fit: BoxFit.fitWidth),
              ),
              Container(
                height: 20,
                width: 45,
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(
                      color: Colors.grey.shade300,
                      strokeAlign: BorderSide.strokeAlignOutside),
                ),
                child:
                Image.asset('images/applepay.png', fit: BoxFit.fitHeight),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              PaymentMethodCheckList(
                title: 'Net Banking',
                onPressed: (bool value) {
                  if (value) paymentIdx = 0;
                  setState(() {});
                  widget.onChanged(paymentIdx);
                },
                value: paymentIdx == 0,
              ),
              PaymentMethodCheckList(
                title: 'Other UPI Apps',
                onPressed: (bool value) {
                  if (value) paymentIdx = 1;
                  setState(() {});
                  widget.onChanged(paymentIdx);
                },
                value: paymentIdx == 1,
              ),
              PaymentMethodCheckList(
                title: 'Cash On Delivery/ Pay On Delivery',
                onPressed: (bool value) {
                  if (value) paymentIdx = 2;
                  setState(() {});
                  widget.onChanged(paymentIdx);
                },
                value: paymentIdx == 2,
                subtitle:
                'Scan & Pay using Amazon App, Cash, UPI, Cards also accepted',
              ),
              PaymentMethodCheckList(
                title: 'Pay by ETH',
                onPressed: (bool value) {
                  if (value) paymentIdx = 3;
                  setState(() {});
                  widget.onChanged(paymentIdx);
                },
                value: paymentIdx == 3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PaymentMethodCheckList extends StatelessWidget {
  const PaymentMethodCheckList({
    super.key,
    required this.title,
    this.subtitle,
    required this.onPressed,
    required this.value,
  });

  final String title;
  final String? subtitle;
  final ValueChanged<bool> onPressed;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          activeColor: Colors.black,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          splashRadius: 0,
          visualDensity: VisualDensity.compact,
          side: const BorderSide(
            color: Colors.black,
            width: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: Colors.grey, width: 1),
          ),
          value: value,
          onChanged: (value) {
            onPressed.call(value!);
          },
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  title,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
                if (subtitle != null)
                  CustomText(
                    subtitle!,
                    color: Colors.grey,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}