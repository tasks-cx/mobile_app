import 'package:flutter/material.dart';
import 'package:tasks_cx/core/utils/utils.dart';

import '../../core/components/c_text_field.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late final TextEditingController titleController;
  late final TextEditingController bodyController;
  late TextEditingController mandatorySubscriberController;
  late TextEditingController assigneeController;
  late TextEditingController tagsController;
  List<String> tags = [];
  late List<TextEditingController> addedSubscriberListController;

  @override
  void initState() {
    titleController = TextEditingController();
    bodyController = TextEditingController();
    mandatorySubscriberController = TextEditingController();
    addedSubscriberListController = [];
    assigneeController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width * 0.98,
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            CustomTextField(
              controller: titleController,
              hintText: "Title",
            ),
            vspace1,
            CustomTextField(
              controller: bodyController,
              hintText: "Body",
            ),
            vspace1,
            CustomTextField(
              controller: assigneeController,
              hintText: 'Assignee',
            ),
            vspace1,
            CustomTextField(
              controller: tagsController,
              hintText: 'Tags',
            ),
            vspace1,
            Row(
              children: [
                CustomTextField(
                  controller: mandatorySubscriberController,
                  hintText: 'Mandatory Subscriber',
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      addedSubscriberListController
                          .add(TextEditingController());
                    });
                  },
                  icon: const Icon(Icons.add),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.purple.shade50),
                  ),
                )
              ],
            ),
            vspace1,
            ...addedSubscriberListController.map(
              (e) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: e,
                        hintText: "Link",
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          addedSubscriberListController.remove(e);
                        });
                      },
                      icon: const Icon(Icons.remove),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.purple.shade50),
                      ),
                    )
                  ],
                ),
              ),
            ),
            vspace1,
            ElevatedButton(
              onPressed: () {
                tagsController.text.split(',').forEach((element) {
                  tags.add(element.trim());
                });
              },
              child: const Text("Add Task"),
            ),
          ],
        ),
      ),
    );
  }
}
