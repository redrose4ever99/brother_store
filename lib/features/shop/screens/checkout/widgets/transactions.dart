import 'dart:async';
import 'dart:io' show Platform;

import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paytabs_bridge/BaseBillingShippingInfo.dart';
import 'package:flutter_paytabs_bridge/IOSThemeConfiguration.dart';
//import 'package:flutter_paytabs_bridge/PaymentSDKCardApproval.dart';
//import 'package:flutter_paytabs_bridge/PaymentSDKNetworks.dart';
import 'package:flutter_paytabs_bridge/PaymentSDKQueryConfiguration.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkApms.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkConfigurationDetails.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkLocale.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkTokeniseType.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkTransactionClass.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkTransactionType.dart';
import 'package:flutter_paytabs_bridge/flutter_paytabs_bridge.dart';

/// Main widget for the app
class Transaction extends StatefulWidget {
  @override
  _Transaction createState() => _Transaction();
}

class _Transaction extends State<Transaction> {
  /// Instructions for the user interface.
  final String _instructions =
      'Tap on "Pay with card" Button to try PayTabs for test';

  /// Profile ID for the payment configuration.
  static const String profileId = "110145";

  /// Server key for the payment configuration.
  static const String serverKey = "SMJNHZG26Z-JKNZ2NMDBK-JTZW2WDT6B";

  /// Client key for the payment configuration.
  static const String clientKey = "CHKM96-BD7B6K-Q9MQND-9TDBHB";

  /// Cart ID for the payment configuration.
  static const String cartId = "12433";

  /// Description of the cart for the payment configuration.
  static const String cartDescription = "Brothers Cart Descriptions";

  /// Merchant name for the payment configuration.
  static const String merchantName = "Brothers Creative";

  /// Screen title for the payment configuration.
  static const String screenTitle = "Pay with Card";

  /// Amount for the payment configuration.
  static const double amount = 1.0;

  /// Currency code for the payment configuration.
  static const String currencyCode = "SAR";

  /// Merchant country code for the payment configuration.
  static const String merchantCountryCode = "SA";

  /// Apple Pay identifier for the payment configuration.
  static const String merchantApplePayIdentifier = "";

  /// Flag to simplify Apple Pay validation.
  static const bool simplifyApplePayValidation = true;

  /// Flag to show billing information.
  static const bool showBillingInfo = true;

  /// Flag to force shipping information.
  static const bool forceShippingInfo = false;

  /// Tokenization type for the payment configuration.
  static const tokeniseType = PaymentSdkTokeniseType.MERCHANT_MANDATORY;

  /// Transaction type for the payment configuration.
  static const transactionType = PaymentSdkTransactionType.SALE;

  /// List of alternative payment methods.
  final List<PaymentSdkAPms> apms = [PaymentSdkAPms.AMAN];

  /// List of supported payment networks.
  // final List<PaymentSDKNetworks> networks = [
  //   PaymentSDKNetworks.visa,
  //   PaymentSDKNetworks.amex
  // ];

  /// Card approval configuration for the payment configuration.
  // final PaymentSDKCardApproval cardApproval = PaymentSDKCardApproval(
  //   validationUrl: "https://www.example.com/validation",
  //   binLength: 6,
  //   blockIfNoResponse: false,
  // );

  /// Billing name for the payment configuration.
  static const String billingName = "Nuwar Saeed";

  /// Billing email for the payment configuration.
  static const String billingEmail = "nuwar.m.saeed@gmail.com";

  /// Billing phone number for the payment configuration.
  static const String billingPhone = "+971503780091";

  /// Billing address for the payment configuration.
  static const String billingAddress =
      "3017 Haroon Al Rashid Rd, Dareen St. 3017 ";

  /// Billing country for the payment configuration.
  static const String billingCountry = "Saudi Arabia";

  /// Billing city for the payment configuration.
  static const String billingCity = "Riyadh";

  /// Billing state for the payment configuration.
  static const String billingState = "SA";

  /// Billing zip code for the payment configuration.
  static const String billingZipCode = "12345";

  /// Shipping name for the payment configuration.
  static const String shippingName = billingName;

  /// Shipping email for the payment configuration.
  static const String shippingEmail = billingEmail;

  /// Shipping phone number for the payment configuration.
  static const String shippingPhone = billingPhone;

  /// Shipping address for the payment configuration.
  static const String shippingAddress = billingAddress;

  /// Shipping country for the payment configuration.
  static const String shippingCountry = billingCountry;

  /// Shipping city for the payment configuration.
  static const String shippingCity = billingCity;

  /// Shipping state for the payment configuration.
  static const String shippingState = billingState;

  /// Shipping zip code for the payment configuration.
  static const String shippingZipCode = billingZipCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: const Text('payment'),
        showBackArrow: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_instructions),
              SizedBox(height: 16),
              ..._buildPaymentButtons(),
              // ElevatedButton(
              //   onPressed: _handleQuery,
              //   child: Text('Query Transaction'),
              // ),
              _buildApplePayButton(),
            ],
          ),
        ),
      ),
    );
  }

  /// Creates billing details for the payment configuration.
  ///
  /// Returns a [BillingDetails] object containing the billing information.
  BillingDetails _createBillingDetails() {
    return BillingDetails(
      billingName,
      billingEmail,
      billingPhone,
      billingAddress,
      billingCountry,
      billingCity,
      billingState,
      billingZipCode,
    );
  }

  /// Creates shipping details for the payment configuration.
  ///
  /// Returns a [ShippingDetails] object containing the shipping information.
  ShippingDetails _createShippingDetails() {
    return ShippingDetails(
      shippingName,
      shippingEmail,
      shippingPhone,
      shippingAddress,
      shippingCountry,
      shippingCity,
      shippingState,
      shippingZipCode,
    );
  }

  /// Generates the payment configuration details.
  ///
  /// This method creates and returns a [PaymentSdkConfigurationDetails] object
  /// that contains all the necessary information for configuring a payment.
  ///
  /// Returns:
  ///   A [PaymentSdkConfigurationDetails] object containing the payment configuration.
  PaymentSdkConfigurationDetails _generatePaymentConfig() {
    final configuration = PaymentSdkConfigurationDetails(
      profileId: "110145", //110145
      showShippingInfo: false,
      iOSThemeConfigurations: IOSThemeConfigurations(),
      forceShippingInfo: false,
      serverKey: "SMJNHZG26Z-JKNZ2NMDBK-JTZW2WDT6B",
      clientKey: "CHKM96-BD7B6K-Q9MQND-9TDBHB",
      cartId: "test111orderid",
      transactionType: PaymentSdkTransactionType.SALE,
      transactionClass: PaymentSdkTransactionClass.ECOM,
      cartDescription: "cart description it is about the products or project",
      merchantName: "Brothers Creative",
      screentTitle: "Pay with Card",
      locale:
          PaymentSdkLocale.EN, //PaymentSdkLocale.AR or PaymentSdkLocale.DEFAULT
      amount: 0.002,
      currencyCode: "SAR",
      merchantCountryCode: "SA",
      showBillingInfo: true,
      // billingDetails: BillingDetails("walaa Elsaeed", "walaa@gmail.com", "",
      //     "address line", "SA", "city", "state", "213"),

      billingDetails: _createBillingDetails(),

      alternativePaymentMethods: apms,
      linkBillingNameWithCardHolderName: true,
      // cardApproval: cardApproval,
    );

    configuration.iOSThemeConfigurations = IOSThemeConfigurations();
    configuration.tokeniseType = tokeniseType;

    return configuration;
  }

  /// Handles the payment process for any provided payment method.
  ///
  /// This method takes a payment method function, generates the payment configuration,
  /// and processes the transaction event.
  ///
  /// Parameters:
  /// - [paymentMethod]: A function that initiates the payment process.
  Future<void> _handlePayment(Function paymentMethod) async {
    paymentMethod(_generatePaymentConfig(), (event) {
      setState(() {
        _processTransactionEvent(event);
      });
    });
  }

  /// Processes transaction event responses.
  ///
  /// This method handles the different statuses of a transaction event and logs
  /// the appropriate messages.
  ///
  /// Parameters:
  /// - [event]: The event data containing the transaction status and details.
  void _processTransactionEvent(dynamic event) {
    if (event["status"] == "success") {
      final transactionDetails = event["data"];
      _logTransaction(transactionDetails);
    } else if (event["status"] == "error") {
      debugPrint("Error occurred in transaction: ${event["message"]}");
    } else if (event["status"] == "event") {
      debugPrint("Event occurred: ${event["message"]}");
    }
  }

  /// Logs transaction details.
  ///
  /// This method logs the details of a transaction, including whether it was
  /// successful or pending.
  ///
  /// Parameters:
  /// - [transactionDetails]: The details of the transaction.
  void _logTransaction(dynamic transactionDetails) {
    if (transactionDetails["isSuccess"]) {
      debugPrint("successful transaction");
      if (transactionDetails["isPending"]) {
        debugPrint("transaction pending");
      }
    } else {
      debugPrint(
          "failed transaction. Reason: ${transactionDetails["payResponseReturn"]}");
    }
  }

  /// Generates the query configuration.
  ///
  /// This method creates and returns a [PaymentSDKQueryConfiguration] object
  /// that contains the necessary information for querying a transaction.
  ///
  /// Returns:
  ///   A [PaymentSDKQueryConfiguration] object containing the query configuration.
  PaymentSDKQueryConfiguration _generateQueryConfig() {
    return PaymentSDKQueryConfiguration("ServerKey", "ClientKey",
        "Country Iso 2", "Profile Id", "Transaction Reference");
  }

  /// Handles transaction query.
  ///
  /// This method initiates a transaction query using the generated query configuration
  /// and processes the event response.
  Future<void> _handleQuery() async {
    FlutterPaytabsBridge.queryTransaction(
      _generatePaymentConfig(),
      _generateQueryConfig(),
      (event) {
        setState(() {
          _processTransactionEvent(event);
        });
      },
    );
  }

  /// Handles the Apple Pay payment process.
  ///
  /// This method configures and initiates the Apple Pay payment process,
  /// and processes the event response.
  Future<void> _handleApplePay() async {
    final configuration = PaymentSdkConfigurationDetails(
      profileId: profileId,
      serverKey: serverKey,
      clientKey: clientKey,
      cartId: cartId,
      cartDescription: cartDescription,
      merchantName: merchantName,
      amount: amount,
      currencyCode: currencyCode,
      merchantCountryCode: merchantCountryCode,
      merchantApplePayIndentifier: merchantApplePayIdentifier,
      simplifyApplePayValidation: simplifyApplePayValidation,
      //paymentNetworks: networks,
    );
    FlutterPaytabsBridge.startApplePayPayment(configuration, (event) {
      setState(() {
        _processTransactionEvent(event);
      });
    });
  }

  /// Builds the Apple Pay button, shown only on iOS.
  ///
  /// This method returns a [TextButton] widget for Apple Pay if the platform is iOS,
  /// otherwise it returns an empty [SizedBox].
  ///
  /// Returns:
  ///   A [Widget] representing the Apple Pay button or an empty box.
  Widget _buildApplePayButton() {
    if (Platform.isIOS) {
      return TextButton(
        onPressed: _handleApplePay,
        child: Text('Pay with Apple Pay'),
      );
    }
    return SizedBox.shrink();
  }

  /// Builds the payment buttons.
  ///
  /// This method returns a list of [TextButton] widgets for different payment methods.
  ///
  /// Returns:
  ///   A list of [Widget] representing the payment buttons.
  List<Widget> _buildPaymentButtons() {
    return [
      ElevatedButton(
        onPressed: () => FlutterPaytabsBridge.startCardPayment(
            _generatePaymentConfig(), (event) {
          setState(() {
            if (event["status"] == "success") {
              // Handle transaction details here.
              var transactionDetails = event["data"];
              print(transactionDetails);

              if (transactionDetails["isSuccess"]) {
                print("successful transaction");
              } else {
                print("failed transaction");
              }
            } else if (event["status"] == "error") {
              // Handle error here.
            } else if (event["status"] == "event") {
              // Handle cancel events here.
            }
          });
        }),

        // _handlePayment(FlutterPaytabsBridge.startCardPayment),
        child: 
        Text('Pay with Card'),
      ),
      // ElevatedButton(
      //   onPressed: () =>
      //       _handlePayment(FlutterPaytabsBridge.startTokenizedCardPayment),
      //   child: Text('Pay with Token'),
      // ),
      // ElevatedButton(
      //   onPressed: () => _handlePayment(
      //       FlutterPaytabsBridge.start3DSecureTokenizedCardPayment),
      //   child: Text('Pay with 3DS'),
      // ),
      // ElevatedButton(
      //   onPressed: () =>
      //       _handlePayment(FlutterPaytabsBridge.startAlternativePaymentMethod),
      //   child: Text('Pay with Alternative Payment Methods'),
      // ),
    ];
  }
}
