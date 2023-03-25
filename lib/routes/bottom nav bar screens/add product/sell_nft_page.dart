import 'package:bfm/components/buttons/text_button.dart';
import 'package:bfm/components/custom_app_bar.dart';
import 'package:bfm/components/custom_icon_icons.dart';
import 'package:bfm/components/custom_text.dart';
import 'package:bfm/routes/bottom%20nav%20bar%20screens/add%20product/sell_price_added_success.dart';
import 'package:flutter/material.dart';

import '../../../components/custom_page_route.dart';

class SellNFTPage extends StatefulWidget {
  const SellNFTPage({Key? key}) : super(key: key);

  @override
  State<SellNFTPage> createState() => _SellNFTPageState();
}

class _SellNFTPageState extends State<SellNFTPage> {
  final List<String> currencyType = ['ETH', 'All'];
  final List<Duration> expiryDate = [
    const Duration(days: 1),
    const Duration(days: 5),
    const Duration(days: 7),
    const Duration(days: 15)
  ];

  String selectedCurrency = 'ETH';
  Duration selectedExpiry = const Duration(days: 1);

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<String>> currencyEntry =
        <DropdownMenuEntry<String>>[];
    for (String currency in currencyType) {
      currencyEntry.add(
        DropdownMenuEntry<String>(
          value: currency,
          label: currency,
        ),
      );
    }

    final List<DropdownMenuEntry<Duration>> expiryEntry =
        <DropdownMenuEntry<Duration>>[];
    for (final Duration expiry in expiryDate) {
      expiryEntry.add(
        DropdownMenuEntry<Duration>(
          value: expiry,
          label: '${expiry.inDays} Days',
        ),
      );
    }
    return Scaffold(
      appBar: const CustomAppBar(
        title: CustomText(
          'Sell',
          fontWeight: FontWeight.w600,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset('images/uploadednft.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: const [
                        CustomText(
                          'Price',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        CustomText(
                          '*',
                          color: Colors.red,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(4, 4),
                          blurRadius: 20,
                          spreadRadius: 6,
                          color: Colors.grey.shade400.withOpacity(0.5),
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        CustomTextButton(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  const Icon(
                                    CustomIcon.ethereum,
                                    size: 22,
                                  ),
                                  CustomText(
                                    selectedCurrency,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Icon(Icons.arrow_drop_down_rounded),
                                ],
                              ),
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (_) => SimpleDialog(
                                  backgroundColor: Colors.white,
                                  title: const CustomText('Select Currency Type'),
                                  children: currencyType
                                      .map(
                                        (e) => SimpleDialogOption(
                                          child: Row(
                                            children: [
                                              const Icon(
                                                CustomIcon.ethereum,
                                                size: 22,
                                              ),
                                              CustomText(
                                                e,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ],
                                          ),
                                          onPressed: () {
                                            selectedCurrency = e;
                                            setState(() {});
                                            Navigator.pop(context);
                                          },
                                        ),
                                      )
                                      .toList(),
                                ),
                              );
                            }),
                        Container(
                          width: 1,
                          height: 20,
                          color: Colors.grey,
                        ),
                        Expanded(
                          child: TextFormField(
                            cursorColor: Colors.grey.shade400,
                            decoration: InputDecoration(
                              hintText: 'Price',
                              hintStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.grey.shade400),
                              isCollapsed: true,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: const [
                        CustomText(
                          'Expiration Date',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        CustomText(
                          '*',
                          color: Colors.red,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(4, 4),
                          blurRadius: 20,
                          spreadRadius: 6,
                          color: Colors.grey.shade400.withOpacity(0.5),
                        )
                      ],
                    ),
                    child: CustomTextButton(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              '${selectedExpiry.inDays} days',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            const Icon(Icons.arrow_drop_down_rounded),
                          ],
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => SimpleDialog(
                            backgroundColor: Colors.white,
                            title: const CustomText('Select Currency Type'),
                            children: expiryDate
                                .map(
                                  (e) => SimpleDialogOption(
                                child: CustomText(
                                  '${e.inDays} Days',
                                  fontSize: 18,
                                ),
                                onPressed: () {
                                  selectedExpiry = e;
                                  setState(() {});
                                  Navigator.pop(context);
                                },
                              ),
                            )
                                .toList(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 40,),
                  CustomFilledButton(
                    width: double.infinity,
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: CustomText('Sell Now',
                          fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context, CustomPageRoute(child: const SellPriceAddedSuccess()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
