# Contacts Playground

## Table of contents
* [Project structure](#project-structure)
* [Project requirements](#project-requirements)
* [Project dependencies](#project-dependencies)

## Project structure

- XCWorkspace
  - ContactsPlayground XCodeProj
    - Assets
      - Files
        - contacts.json###### New Contact
    - Utilities
      - FileSystem.swift
      - Storage.swift
    - Scenes
      - Edit Contact
        - EditContactController.swift
        - EditContactViewModel.swift
    - New Contact
      - NewContactController.swift
      - NewContactViewModel.swift
    - Contacts List
      - ContactsListController.swift
      - ContactsListViewModel.swift
    - Models
      - Contacts
        - Contact.swift
    - AppDelegate.swift
    - Main.Storyboard
    - Assets.xcassets
    - LaunchScreen.Storyboard
    - Info.plist
  - Pods XCodeProj

## Project requirements

- Xcode 10.2 +
- iOS 12 +
- Swift 5 +

## Project dependencies

- [RxSwift](https://github.com/ReactiveX/RxSwift). Swift implementation for the Reactive Programming Paradigm.
- [RxCocoa](https://github.com/ReactiveX/RxSwift/tree/master/RxCocoa). Swift implementation for the Reactive Programming Paradigm.
- [RealmSwift](https://realm.io/docs/swift/latest). Storage alternative to CoreData.
- [IQKeyboardManager](https://github.com/hackiftekhar/IQKeyboardManager). Library that prevent issues of keyboard sliding up and cover UITextField/UITextView.

- To install dependencies, execute "pod install" from a terminal, on the root folder of the project.
