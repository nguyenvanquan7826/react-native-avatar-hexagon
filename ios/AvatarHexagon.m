//
//  Switch.m
//  TestLib
//
//  Created by mac 2018 on 8/6/20.
//

#import "React/RCTViewManager.h"
@interface RCT_EXTERN_MODULE(AvatarHexagon, RCTViewManager)
RCT_EXPORT_VIEW_PROPERTY(imgUrl  , NSString)
RCT_EXPORT_VIEW_PROPERTY(maskUrl  , NSString)
RCT_EXPORT_VIEW_PROPERTY(width, int)
RCT_EXPORT_VIEW_PROPERTY(height  , int)
@end

