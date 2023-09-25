import UIKit

extension UIImage {
    func resizeToDataSize(_ dataSize: Int) -> UIImage? {
        guard let imageData = self.pngData(), imageData.count > dataSize else { return self }
        
        let percent = CGFloat(imageData.count) / CGFloat(dataSize)
        let newWidth = self.size.width / (percent * 1.1)
        let scale = newWidth / self.size.width
        let newHeight = self.size.height * scale
        
        let newSize = CGSize(width: newWidth, height: newHeight)
        
        let renderer = UIGraphicsImageRenderer(size: newSize)
        let newImage = renderer.image { context in self.draw(in: CGRect(origin: .zero, size: newSize)) }
        
        return newImage
    }
}
