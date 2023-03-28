//
//  MovieTableViewCell.swift
//  TestforAutodoc
//
//  Created by Raiden Yamato on 23.03.2023.
//

import UIKit
import Combine

class CarTableViewCell: UITableViewCell, NibProvidable, ReusableView {
    
    @IBOutlet private var title: UILabel!
    @IBOutlet private var publishedDate: UILabel!
    @IBOutlet private var carDescription: UILabel!
    @IBOutlet private var carImage: UIImageView!
    private var cancellable: AnyCancellable?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cancelImageLoading()
    }
    
    func bind(to viewModel: CarViewModel) {
        cancelImageLoading()
        title.text = viewModel.title
        publishedDate.text = viewModel.publishedDate
        carDescription.text = viewModel.description
        cancellable = viewModel.image.sink(receiveValue: { [unowned self] image in
            self.showImage(image:image)
        })
    }
    
    private func showImage(image: UIImage?) {
        cancelImageLoading()
        UIView.transition(
            with: self.carImage,
            duration: 0.3,
            options: [.curveEaseOut, .transitionCrossDissolve],
            animations: {
                self.carImage.image = image
            })
    }
    
    private func cancelImageLoading() {
        carImage.image = nil
        cancellable?.cancel()
    }
    
    
    
}


