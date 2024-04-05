import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messaging_app/components/nav_bar.dart';
import 'package:messaging_app/model/group.dart';
import 'package:messaging_app/pages/droup_details.dart';
import 'package:messaging_app/services/group/group_service.dart';
import 'package:flutter/material.dart';
import 'package:messaging_app/components/nav_bar.dart';
import 'package:messaging_app/model/group.dart';
import 'package:messaging_app/services/group/group_service.dart';

class SearchGroupsPage extends StatefulWidget {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  @override
  _SearchGroupsPageState createState() => _SearchGroupsPageState();
}

class _SearchGroupsPageState extends State<SearchGroupsPage> {
  int _currentIndex = 1; // Index for bottom navigation bar
  List<Group> _userGroups = []; // List to store user groups
  List<Group> _filteredGroups = []; // List to store filtered groups
  final GroupService _groupService = GroupService(); // Group service instance

  @override
  void initState() {
    super.initState();
    // Fetch user groups when the page initializes
    _fetchPublicGroups();
  }

  // Function to fetch user groups
  Future<void> _fetchPublicGroups() async {
    try {
      final user = widget._firebaseAuth.currentUser;
      if (user != null) {
        List<Group> userGroups = await _groupService.getPublicGroups();
        setState(() {
          _userGroups = userGroups;
          _filteredGroups = userGroups; // Initialize filtered groups with all user groups
        });
      } else {
        print('User is not authenticated.');
        // Handle the case where the user is not authenticated
      }
    } catch (e) {
      print('Error fetching user groups: $e');
      // Handle the error appropriately
    }
  }

  // Function to filter groups based on search query
  void _filterGroups(String query) {
    setState(() {
      _filteredGroups = _userGroups
          .where((group) => group.groupName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Public Groups'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _filterGroups,
              decoration: InputDecoration(
                labelText: 'Search Group',
                hintText: 'Enter group name',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredGroups.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Navigate to a new page when a group is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GroupDetailsPage(group: _filteredGroups[index]),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(_filteredGroups[index].groupName),
                    //subtitle: Text(_userGroups[index].groupAbout),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
