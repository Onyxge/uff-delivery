/*import 'package:chapasdk/chapa_sdk.dart';
import 'package:flutter/material.dart';

class ChapaPaymentService {
  final String _chapaPublicKey = 'CHAPAPSK_PUBK-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'; // Replace with your actual public key

  Future<void> initiatePayment({
    required BuildContext context,
    required String amount,
    required String currency,
    required String email,
    required String firstName,
    required String lastName,
    required String txRef,
    String? callbackUrl,
    String? returnUrl,
    String? subAccounts,
    String? customizations,
    String? meta,
  }) async {
    try {
      final Chapa chapa = Chapa.getInstance(publicKey: _chapaPublicKey);

      await chapa.startPayment(
        context: context,
        amount: amount,
        currency: currency,
        email: email,
        firstName: firstName,
        lastName: lastName,
        txRef: txRef,
        callbackUrl: callbackUrl,
        returnUrl: returnUrl,
        subAccounts: subAccounts,
        customizations: customizations,
        meta: meta,
        onPaymentSuccess: (successResponse) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Payment Successful: ${successResponse.message}')),
          );
          // TODO: Handle successful payment, e.g., navigate to order confirmation
        },
        onPaymentError: (errorResponse) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Payment Error: ${errorResponse.message}')),
          );
          // TODO: Handle payment error
        },
        onPaymentCancelled: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Payment Cancelled.')),
          );
          // TODO: Handle payment cancellation
        },
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error initiating payment: $e')),
      );
    }
  }
}


*/