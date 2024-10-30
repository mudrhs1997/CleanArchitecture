//
//  TableViewCell.swift
//  Presentation
//
//  Created by 정명곤 on 10/29/24.
//  Copyright © 2024 CleanArchitecture. All rights reserved.
//

import UIKit
import Domain

final class TableViewCell: UITableViewCell {
  static let identifier = "tableViewCell"

  var thumbnail: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()

  let titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setView()
    setLayout()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setup(movie: Movie) {
    self.titleLabel.text = movie.title
  }
}

extension TableViewCell {

  func setView() {
    self.addSubview(thumbnail)
    self.addSubview(titleLabel)
  }

  func setLayout() {
    thumbnail.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    thumbnail.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    thumbnail.widthAnchor.constraint(equalToConstant: 50).isActive = true
    thumbnail.heightAnchor.constraint(equalToConstant: 50).isActive = true

    titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    titleLabel.leadingAnchor.constraint(equalTo: thumbnail.trailingAnchor).isActive = true
    titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
  }

}
