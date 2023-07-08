//
//  BioViewController.swift
//  iPoke
//
//  Created by Yan Alejandro on 21/03/23.
//

import UIKit

class BioViewController: UIViewController {
    
    var bioScreen: BioScreen?
    var bioCollectionScreen: BioCollectionViewCellScreen?
    
    var data: Pokemon?
    
    var dadosParaTelaB: [Pokedex] = []
    
    override func loadView() {
        bioScreen = BioScreen()
        view = bioScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        bioScreen?.delegate(delegate: self)
//        bioScreen?.configCollectionViewProtocol(delegate: self, dataSource: self)
        configSetupBioScreen()
    }
    
    func configSetupBioScreen() {
        if let imageUrl = URL(string: data?.imageUrl ?? "") {
            DispatchQueue.global().async {
                if let imageData = try? Data(contentsOf: imageUrl),
                   let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        // Atribua a imagem ao componente UIImageView
                        self.bioScreen?.pokemonImageView.image =  image
                    }
                }
            }
        }
        bioScreen?.fundoBioImageView.image = UIImage(named: data?.primaryType.lowercased() ?? "")
        bioScreen?.titleNamePokeBio.text = data?.name
        bioScreen?.primaryTypeImage.image = UIImage(named: data?.primaryType ?? "")
        bioScreen?.secundaryTypeImage.image = UIImage(named: data?.secondaryType ?? "")
        bioScreen?.statusBioButton.backgroundColor = UIColor(named: data?.primaryType ?? "")
    }
}

//extension BioViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell: BioCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: BioCollectionViewCell.identifier, for: indexPath) as? BioCollectionViewCell
//        cell?.setupCell(data: listPokemon[indexPath.row])
//        return cell ?? UICollectionViewCell()
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.width, height: view.frame.height)
//    }
//
//}

extension BioViewController: BioScreenDelegate {
    func tappedFavoriteButton(data: Pokedex) {
        print("favorit")
    }
    
    func tappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
}

