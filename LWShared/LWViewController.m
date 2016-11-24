//
//  LWViewController.m
//  LWShared
//
//  Created by bagtree on 16/11/24.
//  Copyright © 2016年 wen. All rights reserved.
//

#import "LWViewController.h"
#import "LWSharedView.h"
@interface LWViewController ()<LWSharedViewDelegate>

@end

@implementation LWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - UI事件
- (IBAction)sharedBtnClicked:(id)sender {
    [LWSharedView show:self];
}


#pragma mark - sharedViewDelegate
-(void)sharedView:(LWSharedView *)sharedV didClickedItem:(NSInteger)index
{
    NSLog(@"按钮被点击 %ld",index);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
