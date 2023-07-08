//
//  PokedexCollectionViewCell.swift
//  iPoke
//
//  Created by Yan Alejandro on 21/03/23.
//

import UIKit

class PokedexCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "PokedexCollectionViewCell"
    var data: [Pokedex] = []
    
    var controller = PokedexViewController()
    
    let pokedexCollectionViewCellScreen: PokedexCollectionViewCellScreen = PokedexCollectionViewCellScreen()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        addSubview()
        configConstraints()
    }
        
    private func setupViews() {
        // Configure a exibição do celular aqui (por exemplo, adicione subvisualizações e defina restrições)
        addSubview(pokedexCollectionViewCellScreen)
        pokedexCollectionViewCellScreen.frame = bounds
        pokedexCollectionViewCellScreen.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    public func setupCell(data: Pokemon) {
        if let imageUrl = URL(string: data.imageUrl) {
            DispatchQueue.global().async {
                if let imageData = try? Data(contentsOf: imageUrl),
                   let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        // Atribua a imagem ao componente UIImageView
                        self.pokedexCollectionViewCellScreen.pokemonImage.image = image
                    }
                }
            }
        }
        pokedexCollectionViewCellScreen.backgroundImage.image = UIImage(named: data.primaryType.lowercased())
        pokedexCollectionViewCellScreen.numberPokeLabel.text = String(describing: data.id)
        pokedexCollectionViewCellScreen.nameLabel.text = data.name
        pokedexCollectionViewCellScreen.typePrimaryImage.image = UIImage(named: data.primaryType)
        pokedexCollectionViewCellScreen.typeSecundaryImage.image = UIImage(named: data.secondaryType ?? "")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
        pokedexCollectionViewCellScreen.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(pokedexCollectionViewCellScreen)
    }
    
    public func dataCollection(data: [Pokedex]) {
        self.data = data
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            pokedexCollectionViewCellScreen.topAnchor.constraint(equalTo: topAnchor),
            pokedexCollectionViewCellScreen.leadingAnchor.constraint(equalTo: leadingAnchor),
            pokedexCollectionViewCellScreen.trailingAnchor.constraint(equalTo: trailingAnchor),
            pokedexCollectionViewCellScreen.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
