import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';

class TasksScreen extends StatefulWidget {
  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.lightBlue,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => Container(
                color: Color(0xff757575),
                child: Container(
                  padding: EdgeInsets.only(top: 50.0),
                  child: Column(
                    children: [
                      Text(
                        'ADD TASK',
                        style: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 30.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: TextFormField(
                          cursorColor: Theme.of(context).cursorColor,
                          // initialValue: 'Input text',
                          decoration: InputDecoration(
                            labelText: 'Task Text',
                            labelStyle: TextStyle(
                              color: Colors.lightBlue,
                            ),
                            // helperText: 'Enter task text',
                            hintText: 'Enter task text',
                            suffixIcon: Icon(
                              Icons.check_circle,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.lightBlue),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 30,
                        color: Colors.lightBlue,
                        child: ElevatedButton(
                          onPressed: () {
                            // Respond to button press
                          },
                          child: Text('SUBMIT TASK TO LIST'),
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                ),
              ),
            );
          },
          backgroundColor: Colors.lightBlue,
          child: Icon(
            Icons.add,
            size: 30.0,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: Icon(
                      Icons.list,
                      size: 30.0,
                      color: Colors.lightBlue,
                    ),
                    radius: 30.0,
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'TODO LIST',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '12 TASK',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView(
                  padding: const EdgeInsets.all(8),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'This is title.',
                        style: TextStyle(
                            decoration:
                                isChecked ? TextDecoration.lineThrough : null),
                      ),
                      trailing: TaskCheckBox(isChecked, (bool checkboxState) {
                        setState(
                          () {
                            isChecked = checkboxState;
                            // print('Valuse is now : $newValue');
                          },
                        );
                      }),
                    ),
                  ],
                ),
                height: 300.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TaskCheckBox extends StatelessWidget {
  final bool checkboxState;
  final dynamic toggleCheckboxState;

  TaskCheckBox(this.checkboxState, this.toggleCheckboxState);

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: checkboxState,
      onChanged: toggleCheckboxState,
    );
  }
}
