//
//  ViewController.swift
//  Photo_TEST1
//
//  Created by KFCC on 2015/06/07.
//  Copyright (c) 2015年 KFCC. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var pathLabel: UILabel!
    
    var imagePickerController: UIImagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info:[NSObject : AnyObject]) {
        
        var image: UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        var url: NSURL = info[UIImagePickerControllerReferenceURL] as! NSURL
        let fetchresult: PHFetchResult = PHAsset.fetchAssetsWithALAssetURLs([url], options: nil)
        let asset: PHAsset = fetchresult.firstObject as! PHAsset
                
        dateLabel.text = asset.creationDate.description
        imageView.image = image
        
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func Button() {
        imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imagePickerController.delegate = self
        
        self .presentViewController(imagePickerController, animated: true, completion: nil)
    }
}

