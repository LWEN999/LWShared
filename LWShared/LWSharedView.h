//
//  LWSharedView.h
//  LWShared
//
//  Created by bagtree on 16/11/24.
//  Copyright © 2016年 wen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LWSharedView;
@protocol LWSharedViewDelegate <NSObject>

-(void)sharedView:(LWSharedView *)sharedV didClickedItem:(NSInteger)index;
@end

@interface LWSharedView : UIView

@property (nonatomic, weak) id<LWSharedViewDelegate> delegate;

+(void)show:(id<LWSharedViewDelegate>)delegate;

@end
