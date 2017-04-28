//
//  Hook.m
//  CodePart
//
//  Created by lxx on 2016/11/9.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "Hook.h"
#import <objc/runtime.h>
@implementation Hook
+(void)hookClass:(Class)cls originSEL:(SEL)originSel  newSEL:(SEL)newSel
{
    Method  originMethod = class_getInstanceMethod(cls, originSel);
    Method  newMethod = class_getInstanceMethod(cls, newSel);
    BOOL isAdd = class_addMethod(cls, originSel,
                                 method_getImplementation(newMethod),
                                 method_getTypeEncoding(newMethod));
    
    if(isAdd)
    {
        class_replaceMethod(cls,
                            newSel,
                            method_getImplementation(originMethod),
                            method_getTypeEncoding(originMethod));
        
    }
    else
    {
        method_exchangeImplementations(originMethod, newMethod);
    }
}
@end
