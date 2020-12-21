//
//  ImagetoCode.swift
//  CodeOnTheGo
//
//  Created by Andreas Ink on 11/26/20.
//

import SwiftUI
import Vision
import CoreImage
import CoreImage.CIFilterBuiltins
import AVFoundation
struct ImagetoCode: View {
    
    @State var points : String = ""
    @State var preProcessImage: UIImage?
    @State var contouredImage: UIImage?
    @State var share = false
    @State var data: Data?
    @State var path: URL?
    @State var ranges = [CGPoint(x: 0, y: 0)]
 
    @State var xPoints = [Float]()
    @State var yPoints = [Float]()
    @State var i = 0
    @State var i2 = 0
    @State var componets = [Componets]()
    var body: some View {
        
        VStack{
            
            Text("Contours: \(points)")

            Image("test")
            .resizable()
            .scaledToFit()
                
            if let image = preProcessImage{
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            }
                
                
            if let image = contouredImage{
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            }

            Button("Detect Contours", action: {
                detectVisionContours()
                share = true
            })
        }
        
    }
    
    func shareButton() {
           

    }

    
    
    
    
    
    public func drawContours(contoursObservation: VNContoursObservation, sourceImage: CGImage) -> UIImage {
        let size = CGSize(width: sourceImage.width, height: sourceImage.height)
        let renderer = UIGraphicsImageRenderer(size: size)
        
        let renderedImage = renderer.image { (context) in
        let renderingContext = context.cgContext

        let flipVertical = CGAffineTransform(a: 1, b: 0, c: 0, d: -1, tx: 0, ty: size.height)
        renderingContext.concatenate(flipVertical)

            
           
           
        renderingContext.draw(sourceImage, in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
           
        renderingContext.scaleBy(x: size.width, y: size.height)
        renderingContext.setLineWidth(5.0 / CGFloat(size.width))
        let redUIColor = UIColor.red
        renderingContext.setStrokeColor(redUIColor.cgColor)
        renderingContext.addPath(contoursObservation.normalizedPath)
        renderingContext.strokePath()
            
            
        }
        
        return renderedImage
    }
    
    
    func detectVisionContours(){
        
        let context = CIContext()
        if let sourceImage = UIImage.init(named: "btn")
        {
            var inputImage = CIImage.init(cgImage: sourceImage.cgImage!)
            inputImage.cgImage?.colorSpace
            let contourRequest = VNDetectContoursRequest.init()
            contourRequest.revision = VNDetectContourRequestRevision1
            contourRequest.contrastAdjustment = 1.0
            contourRequest.detectDarkOnLight = true
            
            contourRequest.maximumImageDimension = 512
            
            do {
                    let noiseReductionFilter = CIFilter.gaussianBlur()
                    noiseReductionFilter.radius = 0.5
                    noiseReductionFilter.inputImage = inputImage

                    let blackAndWhite = CustomFilter()
                    blackAndWhite.inputImage = noiseReductionFilter.outputImage!
                    let filteredImage = blackAndWhite.outputImage!
//                    let monochromeFilter = CIFilter.colorControls()
//                    monochromeFilter.inputImage = noiseReductionFilter.outputImage!
//                    monochromeFilter.contrast = 20.0
//                    monochromeFilter.brightness = 4
//                    monochromeFilter.saturation = 50
//                    let filteredImage = monochromeFilter.outputImage!


                    inputImage = filteredImage
                    if let cgimg = context.createCGImage(filteredImage, from: filteredImage.extent) {
                        self.preProcessImage = UIImage(cgImage: cgimg)
                    }
                }

            let requestHandler = VNImageRequestHandler.init(ciImage: inputImage, options: [:])

            try! requestHandler.perform([contourRequest])
            let contoursObservation = contourRequest.results?.first as! VNContoursObservation
            do {
               
                let c = try contoursObservation.contour(at: 3)
                    
                        var unionOfSalientRegions = CGRect(x: 0, y: 0, width: 0, height: 0)
                unionOfSalientRegions = unionOfSalientRegions.union(c.normalizedPath.boundingBox)
                       
                          
                        
         
            
                if let ciimage = preProcessImage?.ciImage
            {
                let salientRect = VNImageRectForNormalizedRect(unionOfSalientRegions,
                                                               Int(ciimage.extent.size.width),
                                                               Int(ciimage.extent.size.height))
                let croppedImage = ciimage.cropped(to: salientRect)
                preProcessImage = UIImage(ciImage: croppedImage)
            }
                
                
            } catch {
                
            }
            var mailString = NSMutableString()
            mailString.append("X,Y\n")
            path = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("Test") as URL?
            let fileName = "btn.csv"
            let path = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName)
            var csvText = "X,Y\n"
            do {
                let c = try contoursObservation.topLevelContours.first!
                do {
                let ch = try c.childContour(at: 1)
                    
                           // for ch3 in ch2.childContours {
                                for n in ch.normalizedPoints {
                                i2 += 1
                                    print(i2)
                                  
                    xPoints.append(n.x)
                    yPoints.append(n.y)
                                
                                    
                   // }
                            
                        }
                    if xPoints.isEmpty {
                        
                    } else {
                   
                    }
                    i2 += 1
                
            } catch {
                
            }
                
                
            } catch {
                
            }
            do {
                
                
                   
                        for n in try contoursObservation.contour(at: 1).normalizedPoints {
                            csvText += "\(n.x),\(n.y)\n"
                //xPoints.append(n.x)
               // yPoints.append(n.y)
                        }
                           // let rangeX = xPoints.last ?? 0  - xPoints.first!
                            //let rangeY = yPoints.last ?? 0  - yPoints.first!
                               
                         
                                
                                
                   
          
                   // ranges.append(CGPoint(x: Double(xPoints.max() ?? 0) , y:  Double(yPoints.max() ?? 0) ))
                   
                       // you now have the actual rectangle for the image
                       // on which you can base your scale calculations

                    //VNGeometryUtils.boundingCircle(for: VNContour)
                    
                if let  v = UIImage.init(named: "btn")
                {
                    if ranges.count > 3 {
                     //   print( ranges[3].y)
                    //preProcessImage? = cropImage(sourceImage, toRect: CGRect(x: ranges[3].x, y: ranges[3].y, width: CGFloat(Double(rangeX * 1000)), height: CGFloat(rangeY * 1000)), viewWidth: sourceImage.size.width, viewHeight: sourceImage.size.height)!
                    }
                    //preProcessImage? = UIImage(ciImage: (sourceImage.ciImage?.clamped(to: CGRect(x: ranges.last!.x, y: ranges.last!.y, width: CGFloat(Double(rangeX * 100)), height: CGFloat(Double(rangeY * 100))))))
                    
                   // preProcessImage? = UIImage(cgImage: ((preProcessImage?.cgImage?.cropped(to: CGRect(x: ranges.last!.x, y: ranges.last!.y, width: CGFloat(Double(rangeX * 100)), height: CGFloat(rangeY * 100))))))
                   // preProcessImage? = cropToBounds(image: sourceImage, width: Double(rangeX * 1000), height: Double(rangeY * 1000), posX: ranges.last!.x, posY: ranges.last!.y)
                    if ranges.count > 3 {
                       // preProcessImage? = cropToBounds(image: sourceImage, width: Double(rangeX * 100), height: Double(rangeY * 100), posX: ranges[2].x, posY: ranges[2].y)
                    }
                }
                
                
                
                do {
                    try csvText.write(to: path!, atomically: true, encoding: String.Encoding.utf8)
                } catch {
                    print("Failed to create file")
                    print("\(error)")
               // }
                print(path ?? "not found")
                }
                var filesToShare = [Any]()
                filesToShare.append(path!)

                let av = UIActivityViewController(activityItems: filesToShare, applicationActivities: nil)

                UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)

                share.toggle()
            } catch {
                
            }
          
            
           

        } else {
            self.points = "Could not load image"
        }
    
    }
    func cropImage(_ inputImage: UIImage, toRect cropRect: CGRect, viewWidth: CGFloat, viewHeight: CGFloat) -> UIImage?
    {
        let imageViewScale = max(inputImage.size.width / viewWidth,
                                 inputImage.size.height / viewHeight)

        // Scale cropRect to handle images larger than shown-on-screen size
        let cropZone = CGRect(x:cropRect.origin.x * imageViewScale,
                              y:cropRect.origin.y * imageViewScale,
                              width:cropRect.size.width * imageViewScale,
                              height:cropRect.size.height * imageViewScale)

        // Perform cropping in Core Graphics
        guard let cutImageRef: CGImage = inputImage.cgImage?.cropping(to:cropZone)
        else {
            return nil
        }

        // Return image to UIImage
        let croppedImage: UIImage = UIImage(cgImage: cutImageRef)
        return croppedImage
    }
    
    func cropToBounds(image: UIImage, width: Double, height: Double, posX: CGFloat, posY: CGFloat) -> UIImage {

            let cgimage = image.cgImage!
            let contextImage: UIImage = UIImage(cgImage: cgimage)
            let contextSize: CGSize = contextImage.size
            var posX: CGFloat = 0.0
            var posY: CGFloat = 0.0
            var cgwidth: CGFloat = CGFloat(width)
            var cgheight: CGFloat = CGFloat(height)

            // See what size is longer and create the center off of that
          
            

            let rect: CGRect = CGRect(x: posX, y: posY, width: cgwidth, height: cgheight)

            // Create bitmap image from context using the rect
            let imageRef: CGImage = cgimage.cropping(to: rect)!

            // Create a new image based on the imageRef and rotate back to the original orientation
            let image: UIImage = UIImage(cgImage: imageRef, scale: image.scale, orientation: image.imageOrientation)

            return image
        }
    

class CustomFilter: CIFilter {
    var inputImage: CIImage?
    
    override public var outputImage: CIImage! {
        get {
            if let inputImage = self.inputImage {
                let args = [inputImage as AnyObject]
                
                let callback: CIKernelROICallback = {
                (index, rect) in
                    return rect.insetBy(dx: -1, dy: -1)
                }
                
                return createCustomKernel().apply(extent: inputImage.extent, roiCallback: callback, arguments: args)
            } else {
                return nil
            }
        }
    }

    
    func createCustomKernel() -> CIKernel {
            return CIColorKernel(source:
                "kernel vec4 replaceWithBlackOrWhite(__sample s) {" +
                    "if (s.r > 0.25 && s.g > 0.25 && s.b > 0.25) {" +
                    "    return vec4(0.0,0.0,0.0,1.0);" +
                    "} else {" +
                    "    return vec4(1.0,1.0,1.0,1.0);" +
                    "}" +
                "}"
                )!
           
        }
}

}
extension UIImage {
    func getPixelColor(pos: CGPoint) -> UIColor {

        let pixelData = self.cgImage!.dataProvider!.data
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)

        let pixelInfo: Int = ((Int(self.size.width) * Int(pos.y)) + Int(pos.x)) * 4

        let r = CGFloat(data[pixelInfo]) / CGFloat(255.0)
        let g = CGFloat(data[pixelInfo+1]) / CGFloat(255.0)
        let b = CGFloat(data[pixelInfo+2]) / CGFloat(255.0)
        let a = CGFloat(data[pixelInfo+3]) / CGFloat(255.0)

        return UIColor(red: r, green: g, blue: b, alpha: a)
    }

}
