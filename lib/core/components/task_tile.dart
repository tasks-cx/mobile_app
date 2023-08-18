import 'package:flutter/material.dart';
import 'package:tasks_cx/core/data/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  const TaskTile({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title),
      subtitle: Text(
        task.body,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.purple.shade50,
            child: Text(task.assignee.username[0]),
          ),
          const SizedBox(width: 10),
          const Icon(Icons.comment),
          Text(
            task.comments.length.toString(),
          ),
        ],
      ),
    );
  }
}
