//
//  Camera.swift
//  ML
//
//  Created by Andreas Ink on 11/20/20.
//

import SwiftUI

import AVFoundation
import UIKit
import Vision
import CoreML
import FirebaseStorage
import Alamofire
class CameraVC: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {

    private var detectPlayerRequest = VNDetectHumanBodyPoseRequest()
    /// - Tag: MLModelSetup
   
  
  
    
    var data = Data()
    
    var urlString = URL(string: "")
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!

    private let videoDataOutput = AVCaptureVideoDataOutput()
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        captureSession = AVCaptureSession()
       
        guard var videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        let videoInput: AVCaptureDeviceInput
      
      //  videoCaptureDevice = getFrontCamera()!
            
                    
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch { return }

        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        }
        
        self.videoDataOutput.videoSettings = [(kCVPixelBufferPixelFormatTypeKey as NSString) : NSNumber(value: kCVPixelFormatType_32BGRA)] as [String : Any]
        
        self.videoDataOutput.alwaysDiscardsLateVideoFrames = true
        self.videoDataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "camera_frame_processing_queue"))
        self.captureSession.addOutput(self.videoDataOutput)
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = self.view.frame
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer)

        captureSession.startRunning()
    }
    func getFrontCamera() -> AVCaptureDevice?{
        let videoDevices = AVCaptureDevice.devices(for: AVMediaType.video)


        for device in videoDevices{
              let device = device as! AVCaptureDevice
            if device.position == AVCaptureDevice.Position.front {
                  return device
              }
          }
          return nil
      }
    func captureOutput(
        _ output: AVCaptureOutput,
        didOutput sampleBuffer: CMSampleBuffer,
        from connection: AVCaptureConnection) {
        
        guard let frame = CMSampleBufferGetImageBuffer(sampleBuffer) else {
            debugPrint("unable to get image from sample buffer")
            return
        }
        let requestHandler = VNImageRequestHandler(cvPixelBuffer: frame)
        // Create a new request to recognize a human body pose.
       // var request = VNDetectHumanBodyPoseRequest(completionHandler: bodyPoseHandler)
        let visionHandler = VNImageRequestHandler(cmSampleBuffer: sampleBuffer, options: [:])
        do {
            // Perform the body pose-detection request.
            //try requestHandler.perform([request])
        } catch {
            print("Unable to perform the request: \(error).")
        }
        self.updateClassifications(in: frame)
       // detectPlayerRequest = VNDetectHumanBodyPoseRequest(completionHandler: bodyPoseHandler)
  
       
    }
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.videoDataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "camera_frame_processing_queue"))
        
        if captureSession?.isRunning == false {
            captureSession.startRunning()
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if captureSession?.isRunning == true {
            captureSession.stopRunning()
        }
    }

    func updateClassifications(in image: CVPixelBuffer) {

       
    }
    
    func processClassifications(for request: VNRequest, error: Error?) {
        DispatchQueue.main.async {
            guard let results = request.results else {
                return
            }
            let classifications = results as! [VNClassificationObservation]
        
            if !classifications.isEmpty {
               
                    let identifier = classifications.first?.identifier ?? ""
                    print("Classification: Identifier \(identifier) Confidence \(classifications.first!.confidence)")
               
                    
                
            }
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
}

struct CustomCameraRepresentable: UIViewControllerRepresentable {
    
  
   
    
    func makeUIViewController(context: Context) -> CameraVC {
        let controller = CameraVC()
        //controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ cameraViewController: CameraVC, context: Context) {}
    
   
}
var predictions = ""
