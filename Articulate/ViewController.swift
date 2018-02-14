//
//  ViewController.swift
//  Articulate
//
//  Created by Willie Johnson on 2/13/18.
//  Copyright © 2018 Willie Johnson. All rights reserved.
//

import UIKit
import SafariServices

typealias URLList = [URL?]

class ViewController: UIViewController {
  /// Displays urls to articles.
  @IBOutlet weak var tableView: UITableView!
  /// Urls
  var urls: URLList?

  override func viewDidLoad() {
    super.viewDidLoad()
    urls = [
      URL(string: "https://developer.apple.com/documentation/safariservices/sfsafariviewcontroller"), // Test normal page.
      URL(string: "https://developer.apple.com/documentation/webkit/wkwebview"),
      URL(string: "http://www.karenx.com/blog/how-to-become-a-designer-without-going-to-design-school/"), // Test page with video.
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
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let urls = urls, let url = urls[indexPath.row] {
      let config = SFSafariViewController.Configuration()
      config.entersReaderIfAvailable = true

      let safarivc = SFSafariViewController(url: url, configuration: config)
      navigationController?.pushViewController(safarivc, animated: true)
    }
  }
}

