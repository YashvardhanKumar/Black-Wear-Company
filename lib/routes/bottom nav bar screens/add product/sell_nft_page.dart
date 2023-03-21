import 'package:bfm/components/buttons/text_button.dart';
import 'package:bfm/components/custom_app_bar.dart';
import 'package:bfm/components/custom_icon_icons.dart';
import 'package:bfm/components/custom_text.dart';
import 'package:flutter/material.dart';

class SellNFTPage extends StatefulWidget {
  const SellNFTPage({Key? key}) : super(key: key);

  @override
  State<SellNFTPage> createState() => _SellNFTPageState();
}

class _SellNFTPageState extends State<SellNFTPage> {
  final List<String> currencyType = ['ETH', 'All'];
  final List<Duration> expiryDate = [
    Duration(days: 1),
    Duration(days: 5),
    Duration(days: 7),
    Duration(days: 15)
  ];

  String selectedCurrency = 'ETH';
  Duration selectedExpiry = Duration(days: 1);

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
      appBar: CustomAppBar(
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
                      children: [
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
                          offset: Offset(4, 4),
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
                                  Icon(
                                    CustomIcon.ethereum,
                                    size: 22,
                                  ),
                                  CustomText(
                                    selectedCurrency,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(Icons.arrow_drop_down_rounded),
                                ],
                              ),
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (_) => SimpleDialog(
                                  backgroundColor: Colors.white,
                                  title: CustomText('Select Currency Type'),
                                  children: currencyType
                                      .map(
                                        (e) => SimpleDialogOption(
                                          child: Row(
                                            children: [
                                              Icon(
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
                              contentPadding: EdgeInsets.symmetric(
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
                      children: [
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
                          offset: Offset(4, 4),
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
                            Icon(Icons.arrow_drop_down_rounded),
                          ],
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => SimpleDialog(
                            backgroundColor: Colors.white,
                            title: CustomText('Select Currency Type'),
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
                  SizedBox(height: 40,),
                  CustomFilledButton(
                    width: double.infinity,
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: CustomText('Sell Now',
                          fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                    onPressed: () {
                      // Navigator.push(
                      //     context, CustomPageRoute(child: SellNFTPage()));
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
