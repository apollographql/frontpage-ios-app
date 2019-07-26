import UIKit
import Apollo

class PostTableViewCell: UITableViewCell {
  var postId: Int?
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var bylineLabel: UILabel!
  @IBOutlet weak var votesLabel: UILabel!
  
  func configure(with post: PostDetails) {
    postId = post.id
    
    titleLabel?.text = post.title
    bylineLabel?.text = byline(for: post)
    votesLabel?.text = "\(post.votes ?? 0) votes"
  }
  
  @IBAction func upvote() {
    guard let postId = postId else { return }
    
    apollo.perform(mutation: UpvotePostMutation(postId: postId)) { result in
      switch result {
      case .success:
        break
      case .failure(let error):
        NSLog("Error while attempting to upvote post: \(error.localizedDescription)")
      }
    }
  }
}

// We can define helper methods that take the generated data types as arguments

func byline(for post: PostDetails) -> String? {
  if let author = post.author {
    return "by \(author.fullName)"
  } else {
    return nil
  }
}

// We can also extend the generated data types to add convenience properties and methods

extension PostDetails.Author {
  var fullName: String {
    return [firstName, lastName].compactMap { $0 }.joined(separator: " ")
  }
}
