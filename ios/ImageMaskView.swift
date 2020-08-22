//
//  SwitchView.swift
//  TestLib
//
//  Created by mac 2018 on 8/6/20.
//

import UIKit
extension UIImage {
    var isPortrait:  Bool    { size.height > size.width }
    var isLandscape: Bool    { size.width > size.height }
    var breadth:     CGFloat { min(size.width, size.height) }
    var breadthSize: CGSize  { .init(width: breadth, height: breadth) }
    func squared(isOpaque: Bool = false) -> UIImage? {
        guard let cgImage = cgImage?
            .cropping(to: .init(origin: .init(x: isLandscape ? ((size.width-size.height)/2).rounded(.down) : 0,
                                              y: isPortrait  ? ((size.height-size.width)/2).rounded(.down) : 0),
                                size: breadthSize)) else { return nil }


        if #available(iOS 10.0, *) {
            let format = imageRendererFormat
            format.opaque = isOpaque
                   return UIGraphicsImageRenderer(size: breadthSize, format: format).image { _ in
                       UIImage(cgImage: cgImage, scale: 1, orientation: imageOrientation)
                           .draw(in: .init(origin: .zero, size: breadthSize))
                   }

        } else {
            // Fallback on earlier versions
            return nil
        }

    }
}

class ImageMaskView: UIView {

    @objc var imgUrl: String = ""
    @objc var maskUrl: String = ""
    @objc var width: Int = 0
    @objc var height: Int = 0

    override func didSetProps(_ changedProps: [String]!) {
        addImage()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    func addImage() -> Void {
        for view in self.subviews {
            print("remove item")
            view.removeFromSuperview()
        }
        print("add image %d %d %s", width, height, imgUrl)
        self.addSubview(createImageHexagon(imageUrl: imgUrl,  w: width, h: height))
    }

    func createImageHexagon(imageUrl:String, w:Int, h:Int) -> UIImageView {
        if(imgUrl.isEmpty || maskUrl.isEmpty || w == 0 || h == 0) {
            return UIImageView();
        }

        let imageURL = URL(string:imgUrl)!
        let image = UIImage(data: try! Data(contentsOf: imageURL))!
        let imageView = UIImageView(image: image.squared())

        let maskURL = URL(string:maskUrl)!
        let mask: UIImage = UIImage(data: try! Data(contentsOf: maskURL))!
        let maskImageview = UIImageView(image: mask)

        imageView.frame = CGRect(x:0,y:0, width:w, height:h)
        imageView.mask = maskImageview
        maskImageview.contentMode = .scaleAspectFit
        maskImageview.frame = imageView.bounds

        return imageView
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init has not been implemented")
    }

    lazy var imageView : UIImageView = {
        let img = UIImageView()
        return img
    }()
}
