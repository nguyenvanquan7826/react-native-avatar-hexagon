//
//  Switch.swift
//  TestLib
//
//  Created by mac 2018 on 8/6/20.
//

import Foundation
@objc(AvatarHexagon)
class AvatarHexagon: RCTViewManager {

  override func view() -> UIView! {
    return ImageMaskView()
  }

  override static func requiresMainQueueSetup() -> Bool {
    return true
  }
}
