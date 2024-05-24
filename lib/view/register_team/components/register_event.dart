import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:midwest/view_model/controller/register_team_controller.dart';
import 'package:provider/provider.dart';

import 'input_field.dart';

class RegisterEvent extends StatelessWidget {
  const RegisterEvent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<RegisterTeamController>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          'Robowar Event Registration page',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
        ),
        SizedBox(
          height: 10,
        ),
        InputField(
          controller: controller.eventNane,
          hint: 'Enter Event Name',
          title: 'Event',
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: InputField(
                controller: controller.teamIDEvent,
                onChanged: (p0) {},
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return 'Please valid ID';
                  }
                  if (p0.length<=3) {
                    return 'Please valid ID';
                  }
                  return null;
                },
                hint: 'Enter team ID',
                title: 'Team ID',
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: InputField(
                controller: controller.eventPassword,
                hint: 'Enter password',
                title: 'Password',
              ),
            ),
          ],
        ),
        SizedBox(height: 20,),

        Consumer<RegisterTeamController>(
          builder: (context, value, child) {
            return value.getPlayerLoading
                ? SizedBox()
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 4),
                    itemCount: controller.availablePlayer.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 6, right: 6, bottom: 10, top: 10),
                        child: Row(
                          children: [
                            Expanded(
                                child: Row(
                              children: [
                                Checkbox(
                                  value: controller.selectedPlayers.contains(
                                      controller.availablePlayer[index]),
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  visualDensity: VisualDensity.compact,
                                  onChanged: (value) {
                                    controller.addRemovePlayer(
                                        value ?? false, index);
                                  },
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.availablePlayer[index]
                                                ['name']
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 12),
                                      ),
                                      Text(
                                        controller.availablePlayer[index]
                                                ['email']
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                          ],
                        ),
                      );
                    },
                  );
          },
        ),
        SizedBox(
          height: 35,
          width: MediaQuery.sizeOf(context).width,
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)))),
              onPressed: () {
                if(controller.getPlayerLoading){
                  return;
                }
                controller.getPlayers();
              },
              child: Consumer<RegisterTeamController>(
                builder: (context, value, child) {
                  return value.getPlayerLoading?Center(
                    child: SizedBox(height: 15,width: 15,
                      child: CircularProgressIndicator(color: Colors.white,),),
                  ) : Center(
                    child: Text(
                      'Add Players First + ',
                      style: TextStyle(height: 0, color: Colors.white,fontFamily: ''),
                    ),
                  );
                },
              )
          ),
        ),
        SizedBox(
          height: 10,
        ),
        const Text(
          'Enter team id to get players list then you can '
          'select players for events',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 10,
          ),
        ),
        InkWell(
          onTap: () {
            controller.changeRegister(value: false);
          },
          child: Text.rich(TextSpan(children: [
            TextSpan(
                text: 'Click here to ',
                style: TextStyle(color: Colors.black, fontSize: 11)),
            TextSpan(
              text: 'Register Team',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            )
          ])),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 35,
          width: 180,
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)))),
              onPressed: () {
                if(controller.eventLoading){
                  return;
                }
                controller.registerEventss(context);
              },
              child: Consumer<RegisterTeamController>(
                builder: (context, value, child) {
                  return value.eventLoading?Center(
                    child: SizedBox(height: 15,width: 15,
                    child: CircularProgressIndicator(color: Colors.white,),),
                  ) : Center(
                    child: Text(
                      'Register',
                      style: TextStyle(height: 0, color: Colors.white,fontFamily: ''),
                    ),
                  );
                },
              )
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
