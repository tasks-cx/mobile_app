import 'package:flutter/material.dart';
import 'package:tasks_cx/core/components/task_tile.dart';
import 'package:tasks_cx/core/data/project_model.dart';

class ProjectScreen extends StatefulWidget {
  final Project project;
  const ProjectScreen({
    super.key,
    required this.project,
  });

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  late final TextEditingController titleController;
  late final TextEditingController summaryController;

  @override
  void initState() {
    titleController = TextEditingController();
    summaryController = TextEditingController();
    summaryController.text = widget.project.summary;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.project.title),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: summaryController,
            enabled: false,
            maxLines: 5,
          ),
          const Text('Tasks'),
          // ListView.builder(itemBuilder: (context, index) => TaskTile(task: ), itemCount: widget.project,)
        ],
      ),
    );
  }
}
