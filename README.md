# Apollo iOS Hello World app

This is a simple example Apollo iOS app.

## Installation

This project requires the latest version of Xcode, which you can install from the [Mac App Store](https://itunes.apple.com/en/app/xcode/id497799835?mt=12).

To clone the Git repository to your local machine, including submodules:

```sh
git clone --recursive https://github.com/apollographql/frontpage-ios-app.git
```

### Server

This app talks to the frontpage example server, available here: https://github.com/apollographql/frontpage-server. Follow the instructions there and start the server before running the iOS app. (You can find the equivalent React app [here](https://github.com/apollographql/frontpage-react-app) if you want to run them side by side.)

## Starting the app

You can then open `FrontPage.xcodeproj` and press the run button to run the app. It should load a list of posts and display their titles, authors and number of votes in a table view. You can also upvote posts.

If you want to run on a device, change `localhost` to your machine's local IP address in `AppDelegate.swift`.

This is a very basic app, but it does demonstrate how you can hook up GraphQL query results to your UI. The code in `PostListViewController.swift` fetches data based on a GraphQL query defined in `PostListViewController.graphql`. That query refers to a fragment defined in `PostTableViewCell.graphql`, which nicely illustrates how you can describe your data needs next to the UI component that uses them.

Building the target will run `apollo-codegen` against all `.graphql` files in your project and generate query-specific result types in `API.swift`.

Try commenting out (GraphQL uses `#` for comments) a post's `title` and rebuild the target. You should get a compile-time error because the code in our view controller accesses `post.title`. The type system guarantees at compile-time that the data we access from our code is actually specified as part of the query.

`apollo-codegen` also validates GraphQL query documents against the schema, and Xcode will show validation errors inline. Try adding an `email` field under `author` for instance, and rebuild to show the errors.

![Xcode](/Screenshots/Xcode.png)
