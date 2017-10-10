//
//  ViewController.m
//  ZKDrawTouchView
//
//  Created by pang on 2017/6/6.
//  Copyright © 2017年 zk. All rights reserved.
//

#import "ViewController.h"
#import "ZKDrawTouchView.h"

@interface ViewController ()
{

}
@property (weak, nonatomic) IBOutlet UISlider *RSlider;
@property (weak, nonatomic) IBOutlet UISlider *GSlider;
@property (weak, nonatomic) IBOutlet UISlider *BSlider;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.drawView = [[ZKDrawTouchView alloc]initWithFrame:self.contentView.bounds];
    [self.contentView addSubview:self.drawView];
    self.contentView.clipsToBounds = YES;
    
    
    [self setupColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.drawView.frame = self.contentView.bounds;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setupColor {
     self.drawView.currentLineColor = [UIColor colorWithRed:self.RSlider.value/255.f green:self.GSlider.value/255.f blue:self.GSlider.value/255.f alpha:1];
}

- (IBAction)clearScreen:(id)sender {
    [self.drawView clearScreen];
}

- (IBAction)revoke:(id)sender {
    [self.drawView revoke];
}

- (IBAction)save:(id)sender {
    UIImageWriteToSavedPhotosAlbum([self.drawView imageWithDraw], self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
    
}

- (void)image: (UIImage *) image didFinishSavingWithError: (NSError *) error contextInfo:(void *) contextInfo{
    NSString *msg = nil ;
    
    if(error != NULL){
        msg = @"保存图片失败" ;
    }else{
        msg = @"保存图片成功" ;
    }
    
    [[[UIAlertView alloc] initWithTitle:@"保存图片结果提示" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil] show];
}

- (IBAction)changeWidth:(UISlider *)sender {
    
}

- (IBAction)changeR:(UISlider *)sender {
    [self setupColor];
}

- (IBAction)changeG:(UISlider *)sender {
    [self setupColor];
}

- (IBAction)changeB:(UISlider *)sender {
    [self setupColor];
}

@end
