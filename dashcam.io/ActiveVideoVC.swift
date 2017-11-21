//
//  ActiveVideoVC.swift
//  dashcam.io
//
//  Created by Farhan Rahman on 11/20/17.
//  Copyright © 2017 Farhan Rahman. All rights reserved.
//

import UIKit
import AVFoundation


class ActiveVideoVC: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    
    //Some prerequisites for the camera.
    let captureSession = AVCaptureSession();
    var previewLayer: CALayer!
    var captureDevice: AVCaptureDevice!
    var takePhoto = false
    
    
    //Camera view to see the video being recorded.
    @IBOutlet weak var cameraView: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareCamera()
    }
    
    //Function to prepare the camera.
    func prepareCamera(){
        
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
        
        let availableDevices = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: AVMediaType.video, position: .back).devices 
            captureDevice = availableDevices.first
            beginSession()
        
    
    }
    
    //Function that begins the session that starts taking the camera input.
    func beginSession(){
        do {
            let captureDeviceInput = try AVCaptureDeviceInput(device: captureDevice)
            
            captureSession.addInput(captureDeviceInput)
            
        }catch {
            print(error.localizedDescription)
        }
        
        
    //Send the preview layer to the UIView.
    let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        
        //Set the previewLayer with the captured data.
        self.previewLayer = previewLayer
        
        //Add the sublayer to the main view layer.
        self.view.layer.addSublayer(self.previewLayer)
        
        //Setup the preview layer with the frame.
        self.previewLayer.frame = CGRect(x: UIScreen.main.bounds.size.width / 2,y: UIScreen.main.bounds.size.height / 2 ,width: 330, height: 330)
        
        
        
       // cameraView.layer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        
      //      self.previewLayer.frame = cameraView.layer.frame
        
            captureSession.startRunning()
            
            let dataOutput = AVCaptureVideoDataOutput()
            dataOutput.videoSettings = [((kCVPixelBufferPixelFormatTypeKey as NSString) as String):NSNumber(value:kCVPixelFormatType_32BGRA)]
            
            dataOutput.alwaysDiscardsLateVideoFrames = true
            
            if captureSession.canAddOutput(dataOutput) {
                captureSession.addOutput(dataOutput)
            }
            
            captureSession.commitConfiguration()
            
            
            let queue = DispatchQueue(label: "allentesting")
            dataOutput.setSampleBufferDelegate(self, queue: queue)
            
            
            
        
    }
    
    
//    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputSampleBuffer sampleBuffer: CMSampleBuffer!, from connection: AVCaptureConnection!) {
//
//        if takePhoto {
//            takePhoto = false
//
//            if let image = self.getImageFromSampleBuffer(buffer: sampleBuffer) {
//
//                let tensorflowVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PhotoVC") as! TensorflowVC
//
//                tensorflowVC.takenPhoto = image
//
//                DispatchQueue.main.async {
//                    self.present(tensorflowVC, animated: true, completion: {
//                        self.stopCaptureSession()
//                    })
//
//                }
//            }
//
//
//        }
//
//    }
//
//
//    func getImageFromSampleBuffer (buffer:CMSampleBuffer) -> UIImage? {
//        if let pixelBuffer = CMSampleBufferGetImageBuffer(buffer) {
//            let ciImage = CIImage(cvPixelBuffer: pixelBuffer)
//            let context = CIContext()
//
//            let imageRect = CGRect(x: 0, y: 0, width: CVPixelBufferGetWidth(pixelBuffer), height: CVPixelBufferGetHeight(pixelBuffer))
//
//            if let image = context.createCGImage(ciImage, from: imageRect) {
//                return UIImage(cgImage: image, scale: UIScreen.main.scale, orientation: .right)
//            }
//
//        }
//
//        return nil
//    }
//
//    func stopCaptureSession () {
//        self.captureSession.stopRunning()
//
//        if let inputs = captureSession.inputs as? [AVCaptureDeviceInput] {
//            for input in inputs {
//                self.captureSession.removeInput(input)
//            }
//        }
//
//    }
//
    

    //When the pause button is clicked.
    @IBAction func pauseButtonClicked(_ sender: UIButton) {
    }
    
    //Done Button is clicked.
    @IBAction func doneButtonClicked(_ sender: UIButton) {
        
        /*
            Future Goal - Save the video to the users database.
        */
        
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "mainVC") as! MainAppVC
        self.present(newViewController, animated: true, completion: nil)
        
    }
    

}
