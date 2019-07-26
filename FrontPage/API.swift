//  This file was automatically generated and should not be edited.

import Apollo

public final class AllPostsQuery: GraphQLQuery {
  public let operationDefinition =
    "query AllPosts {\n  posts {\n    __typename\n    ...PostDetails\n  }\n}"

  public let operationName = "AllPosts"

  public var queryDocument: String { return operationDefinition.appending(PostDetails.fragmentDefinition) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("posts", type: .nonNull(.list(.nonNull(.object(Post.selections))))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(posts: [Post]) {
      self.init(unsafeResultMap: ["__typename": "Query", "posts": posts.map { (value: Post) -> ResultMap in value.resultMap }])
    }

    public var posts: [Post] {
      get {
        return (resultMap["posts"] as! [ResultMap]).map { (value: ResultMap) -> Post in Post(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Post) -> ResultMap in value.resultMap }, forKey: "posts")
      }
    }

    public struct Post: GraphQLSelectionSet {
      public static let possibleTypes = ["Post"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(PostDetails.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var postDetails: PostDetails {
          get {
            return PostDetails(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class UpvotePostMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation UpvotePost($postId: Int!) {\n  upvotePost(postId: $postId) {\n    __typename\n    id\n    votes\n  }\n}"

  public let operationName = "UpvotePost"

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

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(upvotePost: UpvotePost? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "upvotePost": upvotePost.flatMap { (value: UpvotePost) -> ResultMap in value.resultMap }])
    }

    public var upvotePost: UpvotePost? {
      get {
        return (resultMap["upvotePost"] as? ResultMap).flatMap { UpvotePost(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "upvotePost")
      }
    }

    public struct UpvotePost: GraphQLSelectionSet {
      public static let possibleTypes = ["Post"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(Int.self))),
        GraphQLField("votes", type: .scalar(Int.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, votes: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "Post", "id": id, "votes": votes])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var votes: Int? {
        get {
          return resultMap["votes"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "votes")
        }
      }
    }
  }
}

public struct PostDetails: GraphQLFragment {
  public static let fragmentDefinition =
    "fragment PostDetails on Post {\n  __typename\n  id\n  title\n  votes\n  author {\n    __typename\n    firstName\n    lastName\n  }\n}"

  public static let possibleTypes = ["Post"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(Int.self))),
    GraphQLField("title", type: .scalar(String.self)),
    GraphQLField("votes", type: .scalar(Int.self)),
    GraphQLField("author", type: .object(Author.selections)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: Int, title: String? = nil, votes: Int? = nil, author: Author? = nil) {
    self.init(unsafeResultMap: ["__typename": "Post", "id": id, "title": title, "votes": votes, "author": author.flatMap { (value: Author) -> ResultMap in value.resultMap }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: Int {
    get {
      return resultMap["id"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var title: String? {
    get {
      return resultMap["title"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "title")
    }
  }

  public var votes: Int? {
    get {
      return resultMap["votes"] as? Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "votes")
    }
  }

  public var author: Author? {
    get {
      return (resultMap["author"] as? ResultMap).flatMap { Author(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "author")
    }
  }

  public struct Author: GraphQLSelectionSet {
    public static let possibleTypes = ["Author"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("firstName", type: .scalar(String.self)),
      GraphQLField("lastName", type: .scalar(String.self)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(firstName: String? = nil, lastName: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Author", "firstName": firstName, "lastName": lastName])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var firstName: String? {
      get {
        return resultMap["firstName"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "firstName")
      }
    }

    public var lastName: String? {
      get {
        return resultMap["lastName"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "lastName")
      }
    }
  }
}
