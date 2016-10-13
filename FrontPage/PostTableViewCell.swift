// Copyright (c) 2016 Meteor Development Group, Inc.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

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
    
    apollo.perform(mutation: UpvotePostMutation(postId: postId)) { (result, error) in
      if let error = error {
        NSLog("Error while attempting to upvote post: \(error.localizedDescription)")
        return
      }
      
      guard let upvotePost = result?.data?.upvotePost else {
        NSLog("Missing result after upvoting post")
        return
      }
      
      self.configure(with: upvotePost.fragments.postDetails)
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
    return [firstName, lastName].flatMap { $0 }.joined(separator: " ")
  }
}
