//  This file was automatically generated and should not be edited.

import Apollo

public final class AllPostsQuery: GraphQLQuery {
  public static let operationString =
    "query AllPosts {\n  posts {\n    __typename\n    ...PostDetails\n  }\n}"

  public static var requestString: String { return operationString.appending(PostDetails.fragmentString) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("posts", type: .nonNull(.list(.nonNull(.object(Post.selections))))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(posts: [Post]) {
      self.init(snapshot: ["__typename": "Query", "posts": posts.map { (value: Post) -> Snapshot in value.snapshot }])
    }

    public var posts: [Post] {
      get {
        return (snapshot["posts"] as! [Snapshot]).map { (value: Snapshot) -> Post in Post(snapshot: value) }
      }
      set {
        snapshot.updateValue(newValue.map { (value: Post) -> Snapshot in value.snapshot }, forKey: "posts")
      }
    }

    public struct Post: GraphQLSelectionSet {
      public static let possibleTypes = ["Post"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(Int.self))),
        GraphQLField("title", type: .scalar(String.self)),
        GraphQLField("votes", type: .scalar(Int.self)),
        GraphQLField("author", type: .object(Author.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: Int, title: String? = nil, votes: Int? = nil, author: Author? = nil) {
        self.init(snapshot: ["__typename": "Post", "id": id, "title": title, "votes": votes, "author": author.flatMap { (value: Author) -> Snapshot in value.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return snapshot["id"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var title: String? {
        get {
          return snapshot["title"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var votes: Int? {
        get {
          return snapshot["votes"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "votes")
        }
      }

      public var author: Author? {
        get {
          return (snapshot["author"] as? Snapshot).flatMap { Author(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "author")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var postDetails: PostDetails {
          get {
            return PostDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct Author: GraphQLSelectionSet {
        public static let possibleTypes = ["Author"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("firstName", type: .scalar(String.self)),
          GraphQLField("lastName", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(firstName: String? = nil, lastName: String? = nil) {
          self.init(snapshot: ["__typename": "Author", "firstName": firstName, "lastName": lastName])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var firstName: String? {
          get {
            return snapshot["firstName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "firstName")
          }
        }

        public var lastName: String? {
          get {
            return snapshot["lastName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "lastName")
          }
        }
      }
    }
  }
}

public final class UpvotePostMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpvotePost($postId: Int!) {\n  upvotePost(postId: $postId) {\n    __typename\n    id\n    votes\n  }\n}"

  public var postId: Int

  public init(postId: Int) {
    self.postId = postId
  }

  public var variables: GraphQLMap? {
    return ["postId": postId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("upvotePost", arguments: ["postId": GraphQLVariable("postId")], type: .object(UpvotePost.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(upvotePost: UpvotePost? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "upvotePost": upvotePost.flatMap { (value: UpvotePost) -> Snapshot in value.snapshot }])
    }

    public var upvotePost: UpvotePost? {
      get {
        return (snapshot["upvotePost"] as? Snapshot).flatMap { UpvotePost(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "upvotePost")
      }
    }

    public struct UpvotePost: GraphQLSelectionSet {
      public static let possibleTypes = ["Post"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(Int.self))),
        GraphQLField("votes", type: .scalar(Int.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: Int, votes: Int? = nil) {
        self.init(snapshot: ["__typename": "Post", "id": id, "votes": votes])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return snapshot["id"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var votes: Int? {
        get {
          return snapshot["votes"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "votes")
        }
      }
    }
  }
}

public struct PostDetails: GraphQLFragment {
  public static let fragmentString =
    "fragment PostDetails on Post {\n  __typename\n  id\n  title\n  votes\n  author {\n    __typename\n    firstName\n    lastName\n  }\n}"

  public static let possibleTypes = ["Post"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(Int.self))),
    GraphQLField("title", type: .scalar(String.self)),
    GraphQLField("votes", type: .scalar(Int.self)),
    GraphQLField("author", type: .object(Author.selections)),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: Int, title: String? = nil, votes: Int? = nil, author: Author? = nil) {
    self.init(snapshot: ["__typename": "Post", "id": id, "title": title, "votes": votes, "author": author.flatMap { (value: Author) -> Snapshot in value.snapshot }])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: Int {
    get {
      return snapshot["id"]! as! Int
    }
    set {
      snapshot.updateValue(newValue, forKey: "id")
    }
  }

  public var title: String? {
    get {
      return snapshot["title"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "title")
    }
  }

  public var votes: Int? {
    get {
      return snapshot["votes"] as? Int
    }
    set {
      snapshot.updateValue(newValue, forKey: "votes")
    }
  }

  public var author: Author? {
    get {
      return (snapshot["author"] as? Snapshot).flatMap { Author(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "author")
    }
  }

  public struct Author: GraphQLSelectionSet {
    public static let possibleTypes = ["Author"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("firstName", type: .scalar(String.self)),
      GraphQLField("lastName", type: .scalar(String.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(firstName: String? = nil, lastName: String? = nil) {
      self.init(snapshot: ["__typename": "Author", "firstName": firstName, "lastName": lastName])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var firstName: String? {
      get {
        return snapshot["firstName"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "firstName")
      }
    }

    public var lastName: String? {
      get {
        return snapshot["lastName"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "lastName")
      }
    }
  }
}