import 'dart:convert';

import 'package:dicoding_taskmanager/Alert/SuccessAlert.dart';
import 'package:dicoding_taskmanager/Model/daily_goals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';

class DailyGoalsScreen extends StatefulWidget {
  const DailyGoalsScreen({Key? key}) : super(key: key);

  @override
  State<DailyGoalsScreen> createState() => _DailyGoalsScreenState();
}

class _DailyGoalsScreenState extends State<DailyGoalsScreen> {
  Box? _dailygoalsbox;
  String? selectedDate = DateTime.now().toString();

  @override
  void initState() {
    openBox();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void openBox() async {
    if (!Hive.isBoxOpen('dailygoalsbox')) {
      debugPrint("box closed");
      _dailygoalsbox = await Hive.openBox('dailygoalsbox').whenComplete(() => setState(() {}));
    } else {
      debugPrint("box opened");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () async {
            await Hive.close().whenComplete(() {
              Navigator.pop(context);
            });
          },
        ),
        title: const Text("Daily Goals"),
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              await _dailygoalsbox?.clear().whenComplete(() {
                setState(() {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const SuccessAlert(succMess: "Berhasil Mengosongkan Data");
                    },
                  );
                });
              });
            },
            icon: const Icon(Icons.delete_forever),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraint) {
          if (_dailygoalsbox == null || _dailygoalsbox?.isEmpty == true) {
            return SizedBox(
              height: constraint.maxHeight,
              width: constraint.maxWidth,
              child: const Center(
                child: Text("Belum Ada Goals Tercatat"),
              ),
            );
          }
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                Container(
                  height: 40,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  margin: const EdgeInsets.only(bottom: 10),
                  color: const Color(0xffD8B384),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      const Flexible(
                        child: Text(
                          'Tanggal: ',
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () {
                              DatePicker.showDatePicker(
                                context,
                                showTitleActions: true,
                                onChanged: (date) {
                                  selectedDate = date.toString();
                                },
                                onConfirm: (date) {
                                  debugPrint('confirm $date');
                                  setState(() {});
                                },
                                currentTime: DateTime.parse(selectedDate!),
                              );
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xffEFEAD8),
                                    width: 1,
                                  ),
                                )
                              ),
                              child: Text(
                                DateFormat("d MMM yyyy").format(DateTime.parse(selectedDate!)),
                                style: const TextStyle(
                                  color: Color(0xff5F7161),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ValueListenableBuilder<Box>(
                  valueListenable: Hive.box('dailygoalsbox').listenable(),
                  builder: (context, box, widget) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: box.length,
                      itemBuilder: (builder, index) {
                        if (DateFormat("d MM yyyy").format(DateTime.parse(jsonDecode(box.getAt(index))['createdAt'])) == DateFormat("d MM yyyy").format(DateTime.parse(selectedDate!))) {
                          return Container(
                            width: double.infinity,
                            height: 80,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: Card(
                              color: const Color(0xffF3F0D7),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Expanded(
                                            child: Text(
                                              jsonDecode(box.getAt(index))['task'],
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: Text(
                                              "Dibuat: ${DateFormat('d MMM yyyy HH:mm:ss').format(DateTime.parse(jsonDecode(box.getAt(index))['createdAt']))}",
                                              style: const TextStyle(
                                                color: Colors.black54,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible: jsonDecode(box.getAt(index))['isDone'],
                                            child: Flexible(
                                              child: Text(
                                                "Selesai: ${jsonDecode(box.getAt(index))['isDone'] ? DateFormat('d MMM yyyy HH:mm:ss').format(DateTime.parse(jsonDecode(box.getAt(index))['finishedAt'])) : ""}",
                                                style: const TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: !jsonDecode(box.getAt(index))['isDone'],
                                    child: Container(
                                      width: 40,
                                      height: 80,
                                      color: const Color(0xff9FC088),
                                      child: IconButton(
                                        onPressed: () {
                                          DailyGoals tmpDailyGoals = DailyGoals.fromJson(jsonDecode(box.getAt(index)));
                                          tmpDailyGoals.isDone = true;
                                          tmpDailyGoals.finishedAt = DateTime.now().toString();
                                          box.putAt(index, jsonEncode(tmpDailyGoals.toJson()));
                                        },
                                        icon: const Icon(Icons.done),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 40,
                                    height: 80,
                                    color: const Color(0xffF47C7C),
                                    child: IconButton(
                                      onPressed: () {
                                        box.deleteAt(index);
                                      },
                                      icon: const Icon(Icons.delete),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                        return Container(
                          alignment: Alignment.center,
                          height: constraint.maxHeight - 40,
                          child: const Text("Belum Ada Data"),
                        );
                      },
                    );
                  }
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const AddDailyGoals();
            },
          ).then((value) => {
            if (value) {
              setState(() {})
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AddDailyGoals extends StatelessWidget {
  const AddDailyGoals({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? task;
    var size = MediaQuery.of(context).size;
    final formKey = GlobalKey<FormState>();
    FocusNode focus = FocusNode();

    return AlertDialog(
      title: const Text('Tambah Target'),
      backgroundColor: const Color(0xffE9E5D6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      content: Builder(
        builder: (context) {
          return SizedBox(
            width: size.width * 0.9,
            height: size.height * 0.3,
            child: Form(
              key: formKey,
              child: GestureDetector(
                onTap: () => focus.unfocus(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        alignment: Alignment.center,
                        child: TextFormField(
                          focusNode: focus,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff5E454B),
                              ),
                            ),
                            focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                            hintText: "Target hari ini . . .",
                            icon: Icon(
                              Icons.task,
                              color: focus.hasFocus ? const Color(0xff5E454B) : Colors.grey,
                            ),
                            labelText: "Target",
                            labelStyle: TextStyle(
                              color: focus.hasFocus ? const Color(0xff5E454B) : Colors.grey,
                            ),
                          ),
                          onTap: () {
                            FocusScope.of(context).requestFocus(focus);
                          },
                          validator: (String? value) {
                            return (value == "") ? 'Target tidak boleh kosong!' : null;
                          },
                          onChanged: (value){
                            task = value;
                          },
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context, false),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red, // background
                            onPrimary: Colors.white,
                            fixedSize: const Size.fromWidth(100),
                            alignment: Alignment.center,
                          ),
                          child: const Text(
                            'BATAL',
                            style: TextStyle(
                              fontSize: 12,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()){
                              var box = await Hive.openBox('dailygoalsbox');
                              var dailyGoals = DailyGoals()
                                ..task = task
                                ..isDone = false
                                ..createdAt = DateTime.now().toString();
                              await box.add(jsonEncode(dailyGoals.toJson())).whenComplete((){
                                debugPrint("Berhasil Menambahkan");
                                Navigator.pop(context, true);
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green, // background
                            onPrimary: Colors.white,
                            fixedSize: const Size.fromWidth(100),
                            alignment: Alignment.center,
                          ),
                          child: const Text(
                            'TAMBAH',
                            style: TextStyle(
                              fontSize: 12,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
