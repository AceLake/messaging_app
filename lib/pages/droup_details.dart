import 'package:flutter/material.dart';
import 'package:messaging_app/components/nav_bar.dart';
import 'package:messaging_app/model/group.dart';
import 'package:messaging_app/pages/edit_group_page.dart';
import 'package:messaging_app/services/group/group_service.dart';

class GroupDetailsPage extends StatefulWidget {
  final Group group;

  const GroupDetailsPage({Key? key, required this.group}) : super(key: key);

  @override
  _GroupDetailsPageState createState() => _GroupDetailsPageState();
  
}

class _GroupDetailsPageState extends State<GroupDetailsPage> {
  int _currentIndex = 2;
  bool _isCurrentUserMember =
      false; // Flag to track if current user is a member
  bool _isGroupLeader = false; // Flag to track if current user is group leader
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    // Check if the current user is a member of the group
    _checkMembership();
    // Check if the current user is the group leader
    _checkGroupLeadership();
  }

  Future<void> _checkMembership() async {
    // Implement logic to check if the current user is a member of the group
    // You can use a method from your GroupService to do this
    // For example:
    bool isMember =
        await GroupService().isCurrentUserMember(widget.group.groupId);
    setState(() {
      _isCurrentUserMember = isMember;
    });
  }

  Future<void> _checkGroupLeadership() async {
    // Implement logic to check if the current user is the group leader
    // You can use a method from your GroupService to do this
    // For example:
    bool isLeader =
        await GroupService().isCurrentUserGroupLeader(widget.group.groupId);
    setState(() {
      _isGroupLeader = isLeader;
    });
  }

  void _joinGroup() async {
    // Implement logic to add the current user to the group
    // You can use a method from your GroupService to do this
    // For example:
    await GroupService().addCurrentUserToGroup(widget.group.groupId);
    // Update the flag to reflect the user's membership status
    setState(() {
      _isCurrentUserMember = true;
    });
  }

  void _removeUserFromGroup(String userIdToRemove) async {
    // Implement logic to remove user from the group
    // You can use a method from your GroupService to do this
    // For example:
    await GroupService()
        .removeUserFromGroup(widget.group.groupId, userIdToRemove);
    // You may also want to update UI or state accordingly
  }

  List<Widget> _buildAppBarActions() {
    List<Widget> actions = [];
    if (_isCurrentUserMember) {
      actions.add(
        Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
          ),
        ),
      );
    }
    return actions;
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    key: _scaffoldKey,
    appBar: AppBar(
      title: Text(widget.group.groupName),
      leading: IconButton(
        icon: Icon(
          Icons.navigate_before_rounded,
          size: 35,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: _buildAppBarActions(),
    ),
    endDrawer: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          if (_isCurrentUserMember) ...[
            ListTile(
              title: Row(
                children: [
                  Text(
                    'Edit Group',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.edit, color: Colors.blue),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditGroupPage(group: widget.group),
                  ),
                );
              },
            ),
          ],
        ],
      ),
    ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Group Name:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 5),
            Text(widget.group.groupName, style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text(
              'Description:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 5),
            Text(widget.group.groupAbout, style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text(
              'Location:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 5),
            Text(widget.group.groupLocation, style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text(
              'Meeting Time:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 5),
            Text(widget.group.groupMeet, style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text(
              'Study Description:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 5),
            Text(widget.group.groupStudy, style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text(
              'Public:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 5),
            Text(widget.group.public.toString(),
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 20), // Adding space between info and members list
            // Display join group button if the current user is not a member
            if (!_isCurrentUserMember) ...[
              ElevatedButton(
                onPressed: _joinGroup,
                child: Text('Join Group'),
              ),
              SizedBox(
                  height:
                      20), // Adding space between join button and members list
            ],
            Text(
              'Members:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 5),
            Center(
              child: FutureBuilder<List<String>>(
                future: GroupService().getGroupMembers(widget.group.groupId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Column(
                      children: snapshot.data!.map((userId) {
                        return ListTile(
                          title: Text(userId),
                          // Display remove button if the current user is the group leader
                          trailing: _isGroupLeader
                              ? IconButton(
                                  icon: Icon(Icons.remove_circle),
                                  color: Colors.red,
                                  onPressed: () {
                                    _removeUserFromGroup(userId);
                                  },
                                )
                              : null,
                        );
                      }).toList(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
