//
//  LoadingController.swift
//  iPoke
//
//  Created by Yan Alejandro on 05/06/23.
//

import UIKit
import Lottie

class LoadingController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configLottie()
        configContraitns()
    }
    
    private let animationView: LottieAnimationView = {
        let lottieAnimationView = LottieAnimationView(name: "pokeball")
        lottieAnimationView.translatesAutoresizingMaskIntoConstraints = false
//        lottieAnimationView.backgroundColor = UIColor(red: 52/255, green: 144/255, blue: 220/255, alpha: 1.0)
        return lottieAnimationView
    }()
    
    private func configLottie() {
        let vc = LoginViewController()
        let numberOfLoops: Float = 2
        view.addSubview(animationView)
        
        animationView.frame = view.bounds
        animationView.center = view.center
        animationView.loopMode = .repeat(numberOfLoops)
        animationView.alpha = 1
        
        animationView.play { _ in
            UIView.animate(withDuration: 0.5, animations: {
                self.animationView.alpha = 0
            }, completion: { _ in
                self.navigationController?.pushViewController(vc, animated: true)
            })
        }
    }
    
    private func configContraitns() {
        NSLayoutConstraint.activate([
            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -11),
            animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 9),
            animationView.heightAnchor.constraint(equalToConstant: 55),
            animationView.widthAnchor.constraint(equalToConstant: 55),
        ])
    }
    
}
