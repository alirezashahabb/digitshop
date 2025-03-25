import 'package:apple_shop/bloc/cart/cart_bloc.dart';
import 'package:apple_shop/gen/assets.gen.dart';
import 'package:apple_shop/model/cart_item_model.dart';
import 'package:apple_shop/theme.dart';
import 'package:apple_shop/utils/image_loading_service.dart';
import 'package:apple_shop/utils/string_extions.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:uni_links/uni_links.dart';
import 'package:zarinpal/zarinpal.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final PaymentRequest _paymentRequest = PaymentRequest();

  @override
  void initState() {
    _paymentRequest.setIsSandBox(true);
    _paymentRequest.setAmount(2000);
    _paymentRequest.setDescription('this is test');
    _paymentRequest.setMerchantID('d645fba8-1b29-11ea-be59-000c295eb8fc');
    _paymentRequest.setCallbackURL('expertflutter://shop');

    linkStream.listen(
      (deeplink) {
        if (deeplink!.toLowerCase().contains('authority')) {
          String? authority = deeplink.extractValueFromQuery('Authority');
          String? status = deeplink.extractValueFromQuery('Status');
          ZarinPal().verificationPayment(
            status!,
            authority!,
            _paymentRequest,
            (isPaymentSuccess, refID, paymentRequest, data) {
              if (isPaymentSuccess) {
                print(data);
              } else {
                print('Error');
              }
            },
          );
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return Scaffold(
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CustomScrollView(
                slivers: [
                  if (state is CartLoadingState) ...{
                    SliverToBoxAdapter(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  } else ...{
                    if (state is CartSucessState) ...{
                      SliverAppBar(
                        actions: [
                          Assets.img.iconAppleBlue.image(),
                        ],
                        centerTitle: true,
                        title: Text(
                          'سبد خرید',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: AppColor.mainColor,
                                    fontSize: 17,
                                  ),
                        ),
                        leading: Assets.img.iconBack.image(),
                      ),
                      state.cartItem.fold(
                        (erro) {
                          return SliverToBoxAdapter(
                            child: Text(erro),
                          );
                        },
                        (cartItem) {
                          return SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                return CartItem(
                                  themeData: themeData,
                                  cartItem: cartItem[index],
                                  index: index,
                                );
                              },
                              childCount: cartItem.length,
                            ),
                          );
                        },
                      ),
                    }
                  },
                ],
              ),
              if (state is CartSucessState) ...{
                GestureDetector(
                  onTap: () {
                    // ZarinPal().startPayment(
                    //   _paymentRequest,
                    //   (status, paymentGatewayUri, data) {
                    //     try {
                    //       if (status == 100) {
                    //         launchUrl(
                    //           Uri.parse(paymentGatewayUri!),
                    //           mode: LaunchMode.externalApplication,
                    //         );
                    //       }
                    //     } catch (e) {
                    //       print(e);
                    //     }
                    //   },
                    // );
                    context.read<CartBloc>().add(BasketPaymentInitEvent());
                    context.read<CartBloc>().add(BasketPaymentRequestEvent());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.greenColor,
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                    child: state.finalPrice == 0
                        ? Text(
                            'سبد خرید شما خالی هست',
                            style: TextStyle(
                              color: AppColor.scaffoldColor,
                            ),
                          )
                        : Text(
                            '${state.finalPrice} '.seRagham(),
                            style: TextStyle(
                              color: AppColor.scaffoldColor,
                            ),
                          ),
                  ),
                )
              }
            ],
          );
        },
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final CartItemModel cartItem;
  final int index;
  const CartItem({
    super.key,
    required this.themeData,
    required this.cartItem,
    required this.index,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(44, 20, 44, 20),
      height: 249,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColor.whiteColor,
      ),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                spacing: 10,
                children: [
                  SizedBox(
                    width: 104,
                    height: 104,
                    child: ImageLoadingService(
                      mainImage: cartItem.thumbnail!,
                      radius: 12,
                    ),
                  ),
                  Column(
                    spacing: 6,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cartItem.name!,
                        style: themeData.textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'گارانتی فیلان 18 ماهه',
                        style: themeData.textTheme.bodySmall!.copyWith(
                          color: AppColor.secondaryColor,
                          fontSize: 12,
                        ),
                      ),
                      Row(
                        spacing: 8,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('244تومان'),
                          Container(
                            alignment: Alignment.center,
                            width: 36,
                            height: 15,
                            decoration: BoxDecoration(
                              color: AppColor.redColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text('5%',
                                style: themeData.textTheme.bodySmall!.copyWith(
                                  color: AppColor.whiteColor,
                                  fontSize: 12,
                                )),
                          ),
                        ],
                      ),
                      Wrap(
                        spacing: 8,
                        children: [
                          OptionCheap(
                            'test',
                            color: 'eeeeee',
                          ),
                          GestureDetector(
                            onTap: () {
                              context
                                  .read<CartBloc>()
                                  .add(BasketRemoveEvent(index: index));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColor.redColor,
                                  ),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 2,
                                  horizontal: 6,
                                ),
                                child: Row(
                                  spacing: 4,
                                  children: [
                                    Assets.img.iconTrash.image(),
                                    Text('حذف'),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: DottedLine(
              lineThickness: 3,
              dashLength: 8,
              dashColor: AppColor.secondaryColor.withOpacity(0.5),
              dashGapLength: 3,
              dashGapColor: Colors.transparent,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Row(
              spacing: 4,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${cartItem.realPeice}'.seRagham()),
                Text('تومان')
              ],
            ),
          )
        ],
      ),
    );
  }
}

class OptionCheap extends StatelessWidget {
  String title;
  String? color;
  OptionCheap(this.title, {super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColor.secondaryColor,
          ),
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 2,
          horizontal: 6,
        ),
        child: Row(
          spacing: 4,
          children: [
            Text(title),
            if (color != null) ...{
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: color!.colorParsing(),
                  shape: BoxShape.circle,
                ),
              )
            },
          ],
        ),
      ),
    );
  }
}
