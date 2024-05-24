import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:midwest/view/register_team/register_team.dart';
import 'package:url_launcher/url_launcher.dart';

class RegisterTeamController extends ChangeNotifier {
  final instituteName = TextEditingController();
  final personName = TextEditingController();
  final emailId = TextEditingController();
  final club = TextEditingController();
  final contactNo = TextEditingController();
  final country = TextEditingController();
  final state = TextEditingController();
  final city = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool registerEvents = false;
  bool loading = false;
  bool getPlayerLoading = false;
  bool eventLoading = false;
  String teamEmailId='';

  List<Map<dynamic, dynamic>> selectedPlayers = [];
  List<Map<dynamic, dynamic>> availablePlayer = [];
  final teamIDEvent = TextEditingController();
  final eventNane = TextEditingController();
  final eventPassword = TextEditingController();

  List<Map<String, TextEditingController>> players = [
    {'name': TextEditingController(), 'email': TextEditingController()}
  ];
  bool showPassword = false;

  // final razorPay = Razorpay();
  String username = 'rh676838@gmail.com';
  String gmailPassword = 'citc tgij tkpr zhtk';

  changeRegister({required bool value}) {
    registerEvents = value;
    notifyListeners();
  }

  registerTeam(BuildContext context) async {

    if (formKey.currentState!.validate()) {
      loading = true;
      notifyListeners();
      if (await isDocExist(club.value.text.toString())) {
        loading = false;
        notifyListeners();
        showGeneralDialog(
          context: registerTeamContext!,
          pageBuilder: (context, animation, secondaryAnimation) {
            return AlertDialog(
              title: Text('Warning',style: TextStyle(fontSize: 12),),
              content: const Text('This team ID is already exsist',style: TextStyle(fontSize: 10)),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'OK',
                    ))
              ],
            );
          },
        );
      } else {
        await FirebaseFirestore.instance
            .collection('teams')
            .doc(club.value.text.toString())
            .set({
          'institute': instituteName.value.text.toString(),
          'contactPerson': contactNo.value.text.toString(),
          'email': emailId.value.text.toString(),
          'teamID': club.value.text.toString(),
          'contactNo': contactNo.value.text.toString(),
          'password': password.value.text.toString(),
          'country': country.value.text.toString(),
          'state': state.value.text.toString(),
          'city': city.value.text.toString(),
          'players': players
              .map((e) => {
                    'id': DateTime.now().microsecondsSinceEpoch.toString(),
                    'name': e['name']!.value.text.toString(),
                    'email': e['email']!.value.text.toString(),
                  })
              .toList()
        });

        loading = false;
        notifyListeners();

        var option = gmail(username, gmailPassword);

        final message = Message()
          ..from = Address(username, 'ROBOWAR Team')
          ..recipients.add(emailId.value.text.toString())
          ..subject = 'ROBOWAR Team Registration'
          ..html = '''
      <h1>Team Registration Confirmation</h1>
      <p>Dear User,</p>
      <p>Your team is succesfulyy registered:</p>
      <p>Team ID: <strong>${club.value.text.toString()}</strong></p>
      <p>Players</p>
      <p></p>
      ${players.map((e) => '<p>${e['name'] ?? ''}</p><p>${e['email'] != null ? e['email'] : ''}</p>').toList().join()}
      <p></p>
      <p></p>
      <p>Thank you for choosing ROBOWAR!</p>
      ''';

        try {
          final sendReport = await send(message, option);
          print('Message sent: ' + sendReport.toString());
        } catch (e) {
          print('Message not sent: $e');
        }
        showGeneralDialog(
          context: registerTeamContext!,
          pageBuilder: (context, animation, secondaryAnimation) {
            return AlertDialog(
              title: Text('Success',style: TextStyle(fontSize: 12)),
              content:
                  Text('Your team is successfully registered',style: TextStyle(fontSize: 10)),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'OK',
                    ))
              ],
            );
          },
        );
      }

      // try{
      //   launchUrl(Uri.parse('https://play.google.com/store/apps/details?id=com.razorpay.payments.app&hl=en_US&pli=1'));
      // }catch(_){
      // }
      // final key = DateTime.now().microsecondsSinceEpoch.toString();
      // await FirebaseFirestore.instance.collection('requests').doc(key).set({
      //   'email': emailId.value.text.toString(),
      //   'key' : key,
      //   'name': personName.value.text.toString(),
      //   'number': contactNo.value.text.toString(),
      // });
    }
  }

  registerEventss(BuildContext context) async {
    if(formKey.currentState!.validate()){
      if(selectedPlayers.isEmpty){
        showGeneralDialog(
          context: registerTeamContext!,
          pageBuilder: (context, animation, secondaryAnimation) {
            return AlertDialog(
              title: Text('Warning',style: TextStyle(fontSize: 12),),
              content:
              const Text('Please add at least one player to add register',style: TextStyle(fontSize: 10),),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'OK',
                    ))
              ],
            );
          },
        );
      }else{

        eventLoading=true;
        notifyListeners();

       try{
         await FirebaseFirestore.instance.collection('teams').doc(teamIDEvent.value.text.toString()).update({
           'events' : FieldValue.arrayUnion([
             {
               'event' : eventNane.value.text.toString(),
               'players' : selectedPlayers.map((e) => {
                 'name' : e['name'],
                 'email' : e['email'],
                 'id'  : e['id']
               }).toList()
             }
           ])
         });
         eventLoading=false;
         notifyListeners();

         var option = gmail(username, gmailPassword);
         final playersHtml = selectedPlayers.map((player) => '<p>Name: ${player['name'] ?? ''}, Email: ${player['email'] ?? ''}</p>').join();
         final message = Message()
           ..from = Address(username, 'ROBOWAR Team')
           ..recipients.add(teamEmailId)
           ..subject = 'ROBOWAR Event Registration'
           ..html = '''
      <h1>Event Registration Confirmation</h1>
      <p>Dear User,</p>
      <p>You are successfully registered to this event</p>
      <p>Event: <strong>${eventNane.value.text.toString()}</strong></p>
      <h4>Players</h4>
      $playersHtml
      <p>Thank you for choosing ROBOWAR!</p>
      ''';

         try {
           final sendReport = await send(message, option);
           print('Message sent: ' + sendReport.toString());
         } catch (e) {
           print('Message not sent: $e');
         }

         showGeneralDialog(
           context: registerTeamContext!,
           pageBuilder: (context, animation, secondaryAnimation) {
             return AlertDialog(
               title: Text('Success',style: TextStyle(fontSize: 12),),
               content:
               const Text('You are successfully registered for this event',style: TextStyle(fontSize: 10),),
               actions: [
                 TextButton(
                     onPressed: () => Navigator.pop(context),
                     child: Text(
                       'OK',
                     ))
               ],
             );
           },
         );


       }catch(_){
         eventLoading=false;
         notifyListeners();
         showGeneralDialog(
           context: registerTeamContext!,
           pageBuilder: (context, animation, secondaryAnimation) {
             return AlertDialog(
               title: Text('Warning',style: TextStyle(fontSize: 12),),
               content:
                Text(_.toString(),style: TextStyle(fontSize: 10),),
               actions: [
                 TextButton(
                     onPressed: () => Navigator.pop(context),
                     child: Text(
                       'OK',
                     ))
               ],
             );
           },
         );
       }


      }
    }
  }

  showPass(bool value) {
    showPassword = value;
    notifyListeners();
  }



  String generateTicketId() {
    return 'TCKT-${DateTime.now().millisecondsSinceEpoch}';
  }

  Future<Map<String, dynamic>> createPaymentIntent(
      String paymentMethodId) async {
    return {
      'clientSecret': 'your_client_secret_from_server',
    };
  }

  addPlayer() {
    if(players.length<20){
      players.add(
          {'name': TextEditingController(), 'email': TextEditingController()});
      notifyListeners();
    }else{
      showGeneralDialog(
        context: registerTeamContext!,
        pageBuilder: (context, animation, secondaryAnimation) {
          return AlertDialog(
            title: Text('Warning',style: TextStyle(fontSize: 12),),
            content:
            const Text('Only 20 players can join a team',style: TextStyle(fontSize: 10),),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'OK',
                  ))
            ],
          );
        },
      );
    }

  }

  removePlayer({required Map<String, TextEditingController> map}) {
    players.remove(map);
    notifyListeners();
  }

  Future<bool> isDocExist(String docId) async {
    DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
        .collection('teams')
        .doc(docId)
        .get();
    return docSnapshot.exists;
  }

  addRemovePlayer(bool value, int index) {
    if (!value) {
      selectedPlayers.remove(availablePlayer[index]);
    } else {

      if(selectedPlayers.length<10){
        selectedPlayers.add(availablePlayer[index]);
      }else{
        showGeneralDialog(
          context: registerTeamContext!,
          pageBuilder: (context, animation, secondaryAnimation) {
            return AlertDialog(
              title: Text('Warning',style: TextStyle(fontSize: 12),),
              content:
              const Text('Only 10 players can participate in an event',style: TextStyle(fontSize: 10),),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'OK',
                    ))
              ],
            );
          },
        );
      }


    }
    notifyListeners();
  }

  getPlayers() async {
    if (teamIDEvent.value.text.toString().length > 3) {
      try {
        getPlayerLoading = true;
        notifyListeners();
        DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
            .collection('teams')
            .doc(teamIDEvent.value.text.toString())
            .get();
        if (docSnapshot.exists) {
          if(eventPassword.value.text.toString()==docSnapshot.get('password').toString()){
            teamEmailId=docSnapshot.get('email')??'';
            List<dynamic> list = docSnapshot.get('players');
            availablePlayer = list
                .map((e) => {'name': e['name'], 'email': e['email'],'id' : e['id']})
                .toList();
            print(docSnapshot.get('players'));
            notifyListeners();
          }else{
            showGeneralDialog(
              context: registerTeamContext!,
              pageBuilder: (context, animation, secondaryAnimation) {
                return AlertDialog(
                  title: Text('Warning',style: TextStyle(fontSize: 12),),
                  content:
                  const Text('Invalid credentials. Please enter correct email and password',style: TextStyle(fontSize: 10),),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          'OK',
                        ))
                  ],
                );
              },
            );
          }
        } else {
          showGeneralDialog(
            context: registerTeamContext!,
            pageBuilder: (context, animation, secondaryAnimation) {
              return AlertDialog(
                title: Text('Warning',style: TextStyle(fontSize: 12),),
                content:
                Text('This team id doesn\'t exsist',style: TextStyle(fontSize: 10),),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'OK',
                      ))
                ],
              );
            },
          );
        }

        getPlayerLoading = false;
        notifyListeners();
      } catch (e) {
        showGeneralDialog(
          context: registerTeamContext!,
          pageBuilder: (context, animation, secondaryAnimation) {
            return AlertDialog(
              title: Text('Warning',style: TextStyle(fontSize: 12),),
              content:
              Text(e.toString(),style: TextStyle(fontSize: 10),),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'OK',
                    ))
              ],
            );
          },
        );
      }
    }
  }
}
