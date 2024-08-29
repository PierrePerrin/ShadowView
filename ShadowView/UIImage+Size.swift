import CoreGraphics
import CoreImage
import Metal
import UIKit

extension UIImage {
    /// Resize the image to a certain percentage
    ///
    /// - Parameter percentage: Percentage value
    /// - Returns: UIImage(Optional)
    func resized(withPercentage percentage: CGFloat) -> UIImage? {
        return resized(toSize: size.scaled(by: percentage))
    }

    /// Resize the image to a certain width, maintaining aspect ratio
    ///
    /// - Parameter width: Desired width
    /// - Returns: UIImage(Optional)
    func resized(toWidth width: CGFloat) -> UIImage? {
        let height = CGFloat(ceil(width / size.width * size.height))
        return resized(toSize: CGSize(width: width, height: height))
    }

    /// Apply a Gaussian blur to the image using Metal GPU acceleration
    ///
    /// - Parameter blurRadius: The blur radius
    /// - Returns: UIImage(Optional)
    func applyBlur(blurRadius: CGFloat) -> UIImage? {
        guard let ciImage = CIImage(image: self) else { return nil }
        guard let filter = CIFilter(name: "CIGaussianBlur") else { return nil }

        filter.setValue(ciImage, forKey: kCIInputImageKey)
        filter.setValue(blurRadius, forKey: kCIInputRadiusKey)

        // Create a Metal-backed CIContext for GPU acceleration
        guard let device = MTLCreateSystemDefaultDevice() else { return nil }
        let context = CIContext(mtlDevice: device)

        guard let output = filter.outputImage else { return nil }
        guard let cgImage = context.createCGImage(output, from: ciImage.extent) else { return nil }

        return UIImage(cgImage: cgImage)
    }

    /// General method for resizing an image to a specific size
    ///
    /// - Parameter size: Target size
    /// - Returns: UIImage(Optional)
    private func resized(toSize size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: size))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}

extension CGSize {
    /// Generates a new size that is this size scaled by a certain percentage
    ///
    /// - Parameter percentage: The percentage to scale to
    /// - Returns: A new CGSize instance by scaling self by the given percentage
    func scaled(by percentage: CGFloat) -> CGSize {
        return CGSize(width: width * percentage, height: height * percentage)
    }
}
