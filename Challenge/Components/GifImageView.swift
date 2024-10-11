//
//  GifImageView.swift
//  Challenge
//
//  Created by Yeshua Lagac on 10/11/24.
//

import SwiftUI
import UIKit

struct GIFImageView: UIViewRepresentable {
    let gifName: String

    func makeUIView(context: Context) -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }

    func updateUIView(_ uiView: UIImageView, context: Context) {
        // Load the GIF using UIImage (assumes it's stored locally)
        if let gifPath = Bundle.main.path(forResource: gifName, ofType: "gif"),
           let gifData = NSData(contentsOfFile: gifPath) {
            let gif = UIImage.gifImageWithData(gifData as Data)
            uiView.image = gif
        }
    }
}

extension UIImage {
    // Helper function to create a GIF from data
    public class func gifImageWithData(_ data: Data) -> UIImage? {
        guard let source = CGImageSourceCreateWithData(data as CFData, nil) else {
            return nil
        }

        var images: [UIImage] = []
        let count = CGImageSourceGetCount(source)
        for i in 0..<count {
            if let cgImage = CGImageSourceCreateImageAtIndex(source, i, nil) {
                images.append(UIImage(cgImage: cgImage))
            }
        }

        return UIImage.animatedImage(with: images, duration: Double(count) / 24.0)
    }
}
