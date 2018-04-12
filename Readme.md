# Firebase Chat

![](https://firebase.google.com/images/usecases/new-features_1x.png)

iOs Swift 4 Chat made with Clean Architecture

All the backend is implemented with Firebase. You can find:

- Firebase Analytics
- Firebase Auth with email implementation (Authentication!)
- Firebase Real Time Database (Saving data)
- Firebase Cloud Storage (Saving images)
- Firebase Cloud Messaging (Push Notifications)
- Firebase Crashlytics (Crashes!)

I have also used: 

- Kingfisher (Downloading&Caching Images)
- MessageKit (Chat UI)

## Installation

I'm using Pods in this project. You don't need to install it, they are inside the repo

## Keep in mind

- Don't open __.xcodeproj__ file, open __xcworkspace__ instead. Otherwise, you will come across different compiling issues.
- Push notifications might not work on a iOs simulator 😅. Try using your own iPhone

## Cloud Functions

You can also find a Firebase Cloud Functions sending push notifications and updating data from a real time database write



