//
//  DetailViewController.swift
//  ViewerFlags
//
//  Created by Juliano Santos on 2/6/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var selectImage: String?
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageLoad = selectImage {
            imageView.image = UIImage(named: imageLoad)
            imageView.layer.borderWidth = 1
            imageView.layer.borderColor = UIColor.black.cgColor
        }
        
        title = selectedImage!
        navigationItem.largeTitleDisplayMode = .never
        
        // add button in bar
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

    
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }

        // invoque action share
        let vc = UIActivityViewController(activityItems: [image, " - \(selectedImage!)"], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}
