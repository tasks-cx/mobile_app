import 'package:flutter/material.dart';
import 'package:tasks_cx/core/components/c_text_field.dart';

import '../../core/utils/utils.dart';

class AddProjectScreen extends StatefulWidget {
  const AddProjectScreen({super.key});

  @override
  State<AddProjectScreen> createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {
  late TextEditingController titleController;
  late TextEditingController summaryController;
  late TextEditingController mandatoryLinkController;
  late List<TextEditingController> addedLinkListController;
  late TextEditingController mandatoryMemberController;
  late List<TextEditingController> addedMemberListController;
  late TextEditingController domainController;
  @override
  void initState() {
    titleController = TextEditingController();
    summaryController = TextEditingController();
    mandatoryLinkController = TextEditingController();
    addedLinkListController = [];
    mandatoryLinkController = TextEditingController();
    addedMemberListController = [];
    domainController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Project"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width * 0.98,
        padding: const EdgeInsets.all(20),
        child: ListView(
          // mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
              controller: titleController,
              hintText: "Title",
            ),
            vspace1,
            CustomTextField(
              controller: summaryController,
              hintText: "Summary",
            ),
            vspace1,
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: mandatoryLinkController,
                    hintText: "Link",
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      addedLinkListController.add(TextEditingController());
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
            ...addedLinkListController.map(
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
                          addedLinkListController.remove(e);
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
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: mandatoryLinkController,
                    hintText: "Member",
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      addedMemberListController.add(TextEditingController());
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
            ...addedMemberListController.map((e) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          controller: e,
                          hintText: "Member",
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            addedMemberListController.remove(e);
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
                )),
            CustomTextField(
              controller: domainController,
              hintText: "Domain",
            ),
            vspace1,
            ElevatedButton(
              onPressed: () {},
              child: const Text("Create Project"),
            ),
          ],
        ),
      ),
    );
  }
}
