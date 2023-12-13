# Assemblage

- [About the Project](https://github.com/AceLake/Assemblage-Flutter#about-the-project)
- [Project Requirements](https://github.com/AceLake/Assemblage-Flutter#project-requirements)

# About the Project

## ABSTRACT

What Is Assemblage? The whole basis for the app is in Matthew 18:20 where we are called to assemble to rejoice in the presence of God. Assemblage is a platform used to bring people together to study God's word, not only to understand Him further but to strengthen our relationship with him while at the same time strengthening our relationship with the body of Christ. Everyone should be able to easily find and join a Bible study group. 

Assemblage is a Bible study group management software where a user can create or join a Bible study group where they can be in touch with others in the group. Different features make it easy to find a group as well as stay in touch with the group. One of these features is a group messaging system which allows essay communication between group members to keep everyone on the same page. It will also have a feature that will use Google Maps to find Bible study near you. Not all groups need to be publicly visible. Only groups that want to be seen can be seen and the groups who want to stay private can stay private and the group location won't be shown. Events will also be shown on the home page so if you want to go above and beyond you can help spread the love of God.

Why did I want to make this app? I found out that joining a Bible study group was a lot harder and daunting than I thought you would either have to go through a church or know people who are in a group already. This seemed way more difficult than it should be. Getting to know God and the body of Christ should be easy and Assemblage will make it easy.

## Project Overview and Project Objectives

### Problem and Background

From personal experience joining a Bible study group is way harder than it should be. My experience in finding a Bible study group was 100% God's doing. In the 2nd semester of my freshman year of college, I had no friends on campus I was alone I never went to church because I was too nervous to socialize with hundreds of people, but I still wanted to study the word with others. Around this time, I met up with only 2 other guys as a study group for a math class. One of them owned a motorcycle and drove it often. One night he invited me to a Bible study group 10 minutes in advance and I said yes. It turns out that some random guy put a sticky note on my friend's bike asking him to join which made him ask me to join last minute. So long story short it was a lot harder than it should be to join a Bible study group.

# Project Requirements

## Functional and Non-Functional Requirements
- [This is the link to the requirements spreadsheet](https://docs.google.com/spreadsheets/d/12-eE0rKsRIRkCST4E56qvA3O3NXUvT5u/edit?usp=sharing&ouid=116486810360149009769&rtpof=true&sd=true)

## Technical Requirements

- Flutter
- Dart
- Visual Studio Code
- Firebase
- Android Studio
- Xcode

## Logical System Design
![image](https://github.com/AceLake/Assemblage-Flutter/assets/96988100/57efdee4-5e9f-47ed-903d-2b9e22794fad)

### Description

Dart serves as the primary programming language within the application with Flutter as its framework. For authentication, the login functionality relies on Firebase Authentication, which allows users to securely log in using their usernames and passwords.

For the data layer, Firebase will be used as the database of choice. The data access layer holds all of the essential CRUD (Create, Read, Update, Delete) operations within the application. This includes DAOs (Data Access Objects) for User, Group, and Message entities.

The Business layer holds the application's models and services used within the application.

The Presentation Layer contains both stateful and stateless widgets, serving as the core components that make up the app's user interface. The actual pages are framed by building these components together to produce a cohesive and visually pleasing appearance.

## Sitemap
![Assemblage Site Map drawio (1)](https://github.com/AceLake/Assemblage-Flutter/assets/96988100/6cc9b906-e596-4f17-ac66-e2fa8cd68c99)

### Description

- Green: all of the create operations in the application.
- Purple: all of the read operations in the application.
- Orange: all of the update operations in the application.
- Red: all of the delete operations in the application.
- Blue: all of the non-CRUD features. Usually, it’s a static page or an action not connected to the database.

When the application is initially launched, users will be seamlessly directed to the login page. If they are new to the platform, they can easily navigate to the registration page directly from the login page. Once users successfully log in or complete the registration process, they will be immediately redirected to the home page.

Throughout the application, excluding the login and registration pages, users have 5 common pages they can navigate to. At the bottom of the screen, a navigational bar provides access to 4 core pages of the app, ensuring easy and convenient navigation from any point within the application. Additionally, an app bar positioned at the top of the page allows users to access their profile information effortlessly.

## Widget layout design
### Description 
Purple: Stateless Widget 
<br>
Red: List Widget 
<br>
Green: List Item Widget
<br>
### Login
![image](https://github.com/AceLake/Assemblage-Flutter/assets/96988100/bdb6c372-9d04-43d7-affa-55b49bfecb42)

### Registration
![image](https://github.com/AceLake/Assemblage-Flutter/assets/96988100/4407c35a-5637-4666-be08-624fe1550582)

### Home
![image](https://github.com/AceLake/Assemblage-Flutter/assets/96988100/9e925574-e2b7-416a-a717-652b20349d61)

### Find a group
![image](https://github.com/AceLake/Assemblage-Flutter/assets/96988100/1bda5071-d8c1-411a-af6f-1d9de34e166f)

### Group Info
![image](https://github.com/AceLake/Assemblage-Flutter/assets/96988100/b55d7d8c-c398-4b05-b492-88f80dc11197)

### Your Groups
![image](https://github.com/AceLake/Assemblage-Flutter/assets/96988100/58d0d8af-d7b9-4199-bb4b-34cfe7dddcb1)





