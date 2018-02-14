//
//  ViewController.swift
//  Articulate
//
//  Created by Willie Johnson on 2/13/18.
//  Copyright © 2018 Willie Johnson. All rights reserved.
//

import UIKit

typealias URLList = [URL?]?

class ViewController: UIViewController {
  /// Displays urls to articles.
  @IBOutlet weak var tableView: UITableView!
  /// Urls
  var urls: URLList

  override func viewDidLoad() {
    super.viewDidLoad()
    urls = [
      URL(string: "https://developer.apple.com/documentation/safariservices/sfsafariviewcontroller"), // Test normal page.
      URL(string: "https://developer.apple.com/documentation/webkit/wkwebview"),
      URL(string: "https://www.youtube.com/watch?v=mJl68R5z1vI"), // Test page with video.
    ]

    tableView.dataSource = self
    tableView.delegate = self
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let urls = urls else { return 0 }
    return urls.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    if let urls = urls, let url = urls[indexPath.row] {
      cell.textLabel?.text = url.absoluteString
    }
    return cell
  }
}

extension ViewController: UITableViewDelegate {

}

