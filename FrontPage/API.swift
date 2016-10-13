//  This file was automatically generated and should not be edited.

import Apollo

public final class AllPostsQuery: GraphQLQuery {
  public static let operationDefinition =
    "query AllPosts {" +
    "  posts {" +
    "    ...PostDetails" +
    "  }" +
    "}"
  public static let queryDocument = operationDefinition.appending(PostDetails.fragmentDefinition)

  public struct Data: GraphQLMapConvertible {
    public let posts: [Post]

    public init(map: GraphQLMap) throws {
      posts = try map.list(forKey: "posts")
    }

    public struct Post: GraphQLMapConvertible {
      public let __typename = "Post"

      public let fragments: Fragments

      public init(map: GraphQLMap) throws {
        let postDetails = try PostDetails(map: map)
        fragments = Fragments(postDetails: postDetails)
      }

      public struct Fragments {
        public let postDetails: PostDetails
      }
    }
  }
}

public final class UpvotePostMutation: GraphQLMutation {
  public static let operationDefinition =
    "mutation UpvotePost($postId: Int!) {" +
    "  upvotePost(postId: $postId) {" +
    "    ...PostDetails" +
    "  }" +
    "}"
  public static let queryDocument = operationDefinition.appending(PostDetails.fragmentDefinition)

  public let postId: Int

  public init(postId: Int) {
    self.postId = postId
  }

  public var variables: GraphQLMap? {
    return ["postId": postId]
  }

  public struct Data: GraphQLMapConvertible {
    public let upvotePost: UpvotePost?

    public init(map: GraphQLMap) throws {
      upvotePost = try map.optionalValue(forKey: "upvotePost")
    }

    public struct UpvotePost: GraphQLMapConvertible {
      public let __typename = "Post"

      public let fragments: Fragments

      public init(map: GraphQLMap) throws {
        let postDetails = try PostDetails(map: map)
        fragments = Fragments(postDetails: postDetails)
      }

      public struct Fragments {
        public let postDetails: PostDetails
      }
    }
  }
}

public struct PostDetails: GraphQLNamedFragment {
  public static let fragmentDefinition =
    "fragment PostDetails on Post {" +
    "  id" +
    "  title" +
    "  votes" +
    "  author {" +
    "    firstName" +
    "    lastName" +
    "  }" +
    "}"

  public static let possibleTypes = ["Post"]

  public let __typename = "Post"
  public let id: Int
  public let title: String?
  public let votes: Int?
  public let author: Author?

  public init(map: GraphQLMap) throws {
    id = try map.value(forKey: "id")
    title = try map.optionalValue(forKey: "title")
    votes = try map.optionalValue(forKey: "votes")
    author = try map.optionalValue(forKey: "author")
  }

  public struct Author: GraphQLMapConvertible {
    public let __typename = "Author"
    public let firstName: String?
    public let lastName: String?

    public init(map: GraphQLMap) throws {
      firstName = try map.optionalValue(forKey: "firstName")
      lastName = try map.optionalValue(forKey: "lastName")
    }
  }
}