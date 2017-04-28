//
//  Hook.h
//  CodePart
//
//  Created by lxx on 2016/11/9.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hook : NSObject
+(void)hookClass:(Class)cls originSEL:(SEL)originSel  newSEL:(SEL)newSel;
@end
