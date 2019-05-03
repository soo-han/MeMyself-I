Group Project - README Template
===

# Turtly



## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
Turtly is an app where users can write out their thoughts and emotions anonymously and share it with the world without any concern for judgement. A place where users can “let it out” and help relieve their trapped mind. It is a space like a turtle’s shell where inside, you are safe from the harshness of outside world, thus the name Turtly. Users can create posts with texts, photos, and audio notes which can be publicized (public posts will be limited to text posts). While it is open to public, their profile information will be kept anonymous. Users can mark their posts, view previously created posts, as well as get feeds of other people’s public posts.

### App Evaluation
- **Category:** Health & Fitness / Lifestyle
- **Mobile:** This app would be primarily developed for mobile. It will have a mobile friendly layout with access to camera, audio, and location.
- **Story:** The app is unique in that it is not trying to be social. We want to be a place for relief from the avalanche of social-everything trend in apps, where you don’t have to be concerned about being politically correct, setting yourself up to social standards, or being judged; and just express your raw thoughts out loud.
- **Market:** We are targeting a niche market where we are trying to build a place where people can “un-social” for a moment in their lives. We believe that this niche market will serve a good amount of people who need a break from stressful moments from socialization.
- **Habit:** This app will be as simple as it can be and hassle free to encourage users to access it as often as possible. Our app should be a de-stressor, not add to it. An average user will mainly be creating by posting what is on their mind.
- **Scope:** We want a simple app with minimal features and deviate from anything that makes an app “social.” However, we want to add features such as pin-locks; audio; password change, etc. where we might encounter some challenges along the way. Our idea is clearly defined and we think it is an interesting idea to build.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

- [x] Users see the home screen and have options to sign in or sign up
<img src="https://i.imgur.com/FQzYAnO.gif" width=250>

- [x] Users can view the dashboard after log in and add post/photo
<img src="https://i.imgur.com/JHTF53u.gif" width=250>

- [x] Users can stay logged in and log out
<img src="https://i.imgur.com/a6n8SAh.gif" width=250>

- [ ] Users can access the dashboard, feed, and settings page after the log in
- [ ] Users can get feeds of posts from other users
- [ ] Users can mark their own special posts
- [ ] Users can set pin-lock, notification, camera, audio settings

**Optional Nice-to-have Stories**

- [ ] [Post filters - add categories for topics to view feeds under certain categories only]
- [ ] [Snap posts - allow public posts to be deleted automatically after certain period]

### 2. Screen Archetypes

* Login
* Users are prompted to sign in or sign up
* Register
* Upon selection the sign up button, user will be directed to the register page
* Users are prompted to enter their email address and password
* Notification Screen
* Upon logging in, dashboard is shown as the default page
* Dashboard displays a list of user’s notes along with add/edit/delete/post option
* Navigation tab is shown under the bottom
* Feeds Screen
* Shows latest public posts uploaded by other users
* Settings Screen
* Allows users to set pin-locks and notification settings

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Login
* Dashboard
* Feeds
* Settings

**Flow Navigation** (Screen to Screen)

* Sign up
* Register screen
* Sign in
* Dashboard
* Dashboard
* Add
* New note screen
* Dashboard
* Edit
* Edit note screen
* Dashboard
* Delete
* Confirm screen
* Dashboard
* Post
* Public note screen
* Feeds
* Posts from other users screen
* Feeds
* Post
* Public note screen
* Settings
* Settings screen
* Settings
* Setup pins
* Pin set up screen
* Settings
* Change password
* Change password screen
* Settings
* Log out
* Login screen
* Settings
* Delete account
* Delete account screen


## Wireframes

<img src="https://i.imgur.com/JgxC9WG.gif" width=250>


## Schema 
### Models
#### Login View

| Property      | Type     | Description |
| ------------- | -------- | ------------|
| userid      | string   | enter user id |
| password        | string | enter password |
| sign in         | pointer to dashboard     | displays dashboard |
| sign up       | pointer to register  | displays registration page |

#### Register

| Property      | Type     | Description |
| ------------- | -------- | ------------|
| email      | string   | enter email address |
| password        | string | enter password |
| confirm pw         | string     | confirm password |
| sign up       | pointer to confirm popup   | confirm sign up |

#### Dashboard

| Property      | Type     | Description |
| ------------- | -------- | ------------|
| post      | pointer to new post   | creates new post |
| edit        | pointer to post | update existing post |
| delete         | pointer to delete     | delete existing post |

#### Feed

| Property      | Type     | Description |
| ------------- | -------- | ------------|
| post      | pointer to new post   | create new post |

#### Setting

| Property      | Type     | Description |
| ------------- | -------- | ------------|
| pin      | pointer to pin popup   | set up pin |
| change password        | pointer to password | update password |
| log out         | pointer to login view     | displays login view |
| delete       | pointer to confirm popup   | delete account |

#### Post

| Property      | Type     | Description |
| ------------- | -------- | ------------|
| objectId      | string   | post id |
| title        | string | post title |
| createdAt         | date time     | date post created |
| updatedAt       | date time   | date post updated |
| comment | string   | add comments |
| camera    | file   | upload image |
| createdAt     | DateTime | date when post is created (default field) |
| updatedAt     | DateTime | date when post is last updated (default field) |
| audio | file | insert audio |

### Networking
#### List of network requests by screen
- Home Feed Screen
- (Read/GET) Query all posts where user is author
```swift
let query = PFQuery(className:"Post")
query.whereKey("author", equalTo: currentUser)
query.order(byDescending: "createdAt")
query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
if let error = error { 
print(error.localizedDescription)
} else if let posts = posts {
print("Successfully retrieved \(posts.count) posts.")
// TODO: Do something with posts...
}
}
```
- (Create/POST) Create a new comment on a post
```swift
let comment = PFObject(className: "Comments")

comment["text"] = text
comment["post"] = selectedPost
comment["author"] = PFUser.current()!

selectedPost.add(comment, forKey: "comments")

selectedPost.saveInBackground {(success, error) in
if success {
print("Comment saved")
} else{
print("Error saving comment")
}
}
- (Delete) Delete existing comment
```swift
gameScore.remove(forKey: "comment")
```
- Create Post Screen
- (Create/POST) Create a new post object
```swift
let query = PFQuery(className:"Posts")
query.includeKeys(["author", "comments", "comments.user"])
query.limit = 20

query.findObjectsInBackground{(posts,error) in
if posts != nil{
self.posts = posts!
self.tableView.reloadData()```
- Profile Screen
- (Read/GET) Query logged in user object
```swift
let query = PFQuery(className:"User")
query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
if let error = error {
// Log details of the failure
print(error.localizedDescription)
} else if let objects = objects {
// The find succeeded.
print("Successfully retrieved \(objects.count).")
// Do something with the found objects
for object in objects {
print(object.objectId as Any)
}
}
}

```
- (Update/PUT) Update user profile image
```swift
let query = PFQuery(className:"User")
query.getObjectInBackground(withId: "xWMyZEGZ") { (User: PFObject?, error: Error?) in
if let error = error {
print(error.localizedDescription)
} else if let User = User {
gameScore["profileImage"] = image
}
}```
