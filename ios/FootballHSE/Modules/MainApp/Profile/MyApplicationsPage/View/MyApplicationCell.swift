//
//  MyApplicationCell.swift
//  FootballHSE
//
//  Created by Ekaterina Shtanko on 21.04.2023.
//

import UIKit

class MyApplicationCell: UITableViewCell {

    static let identifier = String(describing: MyApplicationCell.self)

    @IBOutlet weak var rolesCollectionView: UICollectionView!
    @IBOutlet weak var tournaments: UILabel!

    private var roles: [PlayerPosition] = [] {
        didSet {
            rolesCollectionView.reloadData()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        layer.cornerRadius = 12
        clipsToBounds = true

        rolesCollectionView.register(
            UINib(nibName: String(describing: BubbleCell.self), bundle: nil),
            forCellWithReuseIdentifier: BubbleCell.identifier
        )
        rolesCollectionView.dataSource = self
        rolesCollectionView.delegate = self
        rolesCollectionView.showsHorizontalScrollIndicator = false
    }

    func configure(tournaments: String, roles: [PlayerPosition]) {
        self.tournaments.text = tournaments
        self.roles = roles
    }
}

extension MyApplicationCell: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        rolesCollectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension MyApplicationCell: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        roles.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = rolesCollectionView.dequeueReusableCell(
            withReuseIdentifier: BubbleCell.identifier,
            for: indexPath)
        let role = roles[indexPath.row]
        guard let searchCell = cell as? BubbleCell else {
            return cell
        }
        searchCell.configure(content: role.getStringValue())
        return searchCell
    }
}
