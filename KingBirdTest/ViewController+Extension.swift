//
//  ViewController+Extension.swift
//  KingBirdTest
//
//  Created by User on 14.02.2021.
//
import UIKit
import SimpleImageViewer

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource,
                          UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return viewModel.photo.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell",
                                                      for: indexPath) as! ViewCell
        cell.setupCell(urlStrng: viewModel.photo[indexPath.row].imgSrc)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let elements : CGFloat = 3
        let width = Constants.width * (elements + 1)
        let totwith = view.frame.width - width
        let adwanced = totwith / elements
        return CGSize(width: adwanced, height: adwanced)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: Constants.prop, left: Constants.prop,
                            bottom: Constants.prop, right: Constants.prop)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        Constants.prop
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        Constants.prop
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ViewCell
        let images = cell.image
        let conf = ImageViewerConfiguration { (image) in
            image.image = images?.image
        }
        let imageVC = ImageViewerController(configuration: conf)
        present(imageVC, animated: true, completion: nil)
    }
    
    
    
   
}
