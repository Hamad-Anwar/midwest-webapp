import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BuyTicketController extends ChangeNotifier{
  // final razorPay=Razorpay();
  final name=TextEditingController();
  final email=TextEditingController();
  final mobileNumber=TextEditingController();
  final organization=TextEditingController();
  final designation=TextEditingController();
  final country=TextEditingController();
  final state=TextEditingController();
  final city=TextEditingController();
  final formKey=GlobalKey<FormState>();



  submit(BuildContext context)async{
    if(formKey.currentState!.validate()){
      try{
        launchUrl(Uri.parse('https://play.google.com/store/apps/details?id=com.razorpay.payments.app&hl=en_US&pli=1'));
      }catch(_){
      }
    //   razorPay.clear();
    //   razorPay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    //   razorPay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    //   razorPay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    //   var options = {
    //     'key': 'rzp_test_1DP5mmOlF5G5ag',
    //     'amount': 200 * 100,
    //     'name': 'Robowar Pass',
    //     'description': 'Paying 200 to buy visitor pass',
    //     'currency': 'INR',
    //     'prefill': {
    //       'contact': '+912212345678',
    //       'email': 'test@razorpay.com'
    //     }
    //   };
    //   razorPay.open(options);
      final key = DateTime.now().microsecondsSinceEpoch.toString();
       await FirebaseFirestore.instance.collection('requests').doc(key).set({
          'email': email.value.text.toString(),
          'key' : key,
          'name': name.value.text.toString(),
          'number': mobileNumber.value.text.toString(),
        });
       showGeneralDialog(context: context, pageBuilder: (context, animation, secondaryAnimation) {
         return AlertDialog(
           title: Text('Book Ticket'),
           content: Text('Your request for ticket booking is send to server'),
           actions: [
             TextButton(onPressed: () => Navigator.pop(context), child: Text('OK',))
           ],
         );
       },);
    }
  }


  // void _handlePaymentSuccess(PaymentSuccessResponse response) {
  //   final key = DateTime.now().microsecondsSinceEpoch.toString();
  //   FirebaseFirestore.instance.collection('requests').doc(key).set({
  //     'email': email.value.text.toString(),
  //     'key' : key,
  //     'name': name.value.text.toString(),
  //     'number': mobileNumber.value.text.toString(),
  //   });
  // }
  //
  // void _handlePaymentError(PaymentFailureResponse response) {
  //   print('Error ${response.message}');
  // }
  //
  // void _handleExternalWallet(ExternalWalletResponse response) {
  //   // Do something when an external wallet was selected
  // }


}