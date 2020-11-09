//
//  RNImagePicker.swift
//  TestRN
//
//  Created by Raden on 9/November/20.
//

import Foundation
import UIKit

@objc(RNImagePicker) class RNImagePicker : NSObject {
  @objc func openImagePicker(){
    DispatchQueue.main.async {
        let rootViewController = UIApplication.shared.delegate?.window?!.rootViewController
      
        let vc = UIStoryboard(name: "RNImagePicker", bundle: nil).instantiateInitialViewController()!
        vc.modalPresentationStyle = .fullScreen
        rootViewController?.present(vc, animated: true, completion: nil)
    }
  
  }
}
