import 'package:bfm/components/buttons/text_button.dart';
import 'package:bfm/components/custom_app_bar.dart';
import 'package:bfm/components/custom_page_route.dart';
import 'package:bfm/components/custom_text.dart';
import 'package:bfm/routes/bottom%20nav%20bar%20screens/home%20page%20of%20e%20commerce/checkout_page.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: CustomText(
          'Cart',
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
      body: ListView(
        children: [
          CartItemCard(),
          CartItemCard(),
          CartItemCard(),
          CartItemCard(),
          CartItemCard(),
        ],
      ),
      bottomNavigationBar: BottomSheet(
        enableDrag: false,
        backgroundColor: Colors.white,
        onClosing: () {},
        builder: (BuildContext context) => Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          height: 120,
          // color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        CustomText(
                          '\$ 239.93',
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                        CustomText(
                          'Total amount',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade700,
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CustomFilledButton(
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: CustomText(
                            'Check Out',
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            textAlign: TextAlign.center,
                            fontSize: 12,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context, CustomPageRoute(child: CheckOutPage()));
                        },
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      elevation: 0,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'images/product.png',
                    width: 70,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CustomText(
                        'Product Name',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        CustomTextButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Icon(Icons.add_circle_outline_rounded),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CustomText(
                          '1',
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CustomTextButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Icon(Icons.remove_circle_outline_rounded),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomTextButton(
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(Icons.delete_outline_rounded),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomText(
                      'S - 26',
                      color: Colors.grey.shade700,
                    ),
                    Container(
                      height: 16,
                      width: 1,
                      color: Colors.grey,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                    ),
                    CustomText(
                      'Blue',
                      color: Colors.grey.shade700,
                    )
                  ],
                ),
                CustomText(
                  '\$34',
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                )
              ],
            ),
            CustomOutlineButton(
              borderColor: Colors.grey.shade300,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomText('Save for later'),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
