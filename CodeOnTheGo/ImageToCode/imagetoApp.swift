//
//  imagetoApp.swift
//  CodeOnTheGo
//
//  Created by Andreas Ink on 11/27/20.
//

import SwiftUI
import Vision
import CoreImage
import CoreImage.CIFilterBuiltins
import AVFoundation
struct ImagetoApp: View {
    
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
            print(renderingContext.boundingBoxOfPath.minX)
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
        if let sourceImage = UIImage.init(named: "test")
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
               
             
            var mailString = NSMutableString()
            mailString.append("X,Y\n")
            path = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("Test") as URL?
            let fileName = "cicle.csv"
            let path = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName)
            var csvText = "X,Y\n"
            
            do {
                for i in 0...3 {
                    for c in  contoursObservation.topLevelContours {
                
                   
                        let ch =  c.childContours
                        for c in ch {
                            for n in c.normalizedPoints {
                            csvText += "\(n.x),\(n.y)\n"
                xPoints.append(n.x)
                yPoints.append(n.y)
                        }
                         
                
                
                    }
                }
                }
                    
            
            
        
               
                do {
                  
                      
                  
                   let ciImage = CIImage(cgImage: UIImage(named: "test")!.cgImage!)
                    let croppedImage = ciImage.cropped(to:  try contoursObservation.contour(at: 1).normalizedPath.boundingBoxOfPath)
                    preProcessImage = UIImage(ciImage: croppedImage)
                } catch {
                    
                }
                
            self.points  = String(contoursObservation.contourCount)
            self.contouredImage = drawContours(contoursObservation: contoursObservation, sourceImage: sourceImage.cgImage!)
                var predictions = [""]
                var b = 0
                var s = 0
                for x in xPoints {
                  
                        let model = ImagetoAppML()
                        do {
                           
                            let prediction = try model.prediction(input: ImagetoAppMLInput(X: Double(x), Y: Double(yPoints[i2])))
                           
                            if prediction.Type_ == "Spacer" {
                                if predictions.last! != "Spacer" {
                                print("Spacer")
                                    b = 0
                                }
                            }
                            if prediction.Type_ == "Button" {
                                if b > 261 {
                                    b += 1
                                if predictions.last! != "Button" {
                               
                                   
                                print("Button")
                            }
                                }
                            }
                            predictions.append(prediction.Type_)
                        } catch {
                            print("ooof")
                        }
                    i2 += 1
                }
        }
       
    
    }
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
