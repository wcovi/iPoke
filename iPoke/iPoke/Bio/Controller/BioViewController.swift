//
//  BioViewController.swift
//  iPoke
//
//  Created by Yan Alejandro on 21/03/23.
//

import UIKit

class BioViewController: UIViewController {
    
    var bioScreen: BioScreen?
    
    override func loadView() {
        bioScreen = BioScreen()
        view = bioScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        bioScreen?.delegate(delegate: self)
        bioScreen?.configCollectionViewProtocol(delegate: self, dataSource: self)
    }
}

extension BioViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: BioCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: BioCollectionViewCell.identifier, for: indexPath) as? BioCollectionViewCell
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: self.view.frame.height)
    }
    
}

extension BioViewController: BioScreenDelegate {
    func tappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
}

