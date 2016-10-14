import UIKit
import Apollo

class PostListViewController: UITableViewController {
  var posts: [AllPostsQuery.Data.Post]? {
    didSet {
      tableView.reloadData()
    }
  }

  // MARK: - View lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 64
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    loadData()
  }

  // MARK: - Data loading

  func loadData() {
    apollo.fetch(query: AllPostsQuery()) { (result, error) in
      if let error = error {
        NSLog("Error while fetching query: \(error.localizedDescription)")
        return
      }

      self.posts = result?.data?.posts
    }
  }

  // MARK: - UITableViewDataSource

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return posts?.count ?? 0
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? PostTableViewCell else {
      fatalError("Could not dequeue PostTableViewCell")
    }

    guard let post = posts?[indexPath.row] else {
      fatalError("Could not find post at row \(indexPath.row)")
    }

    cell.configure(with: post.fragments.postDetails)

    return cell
  }
}
