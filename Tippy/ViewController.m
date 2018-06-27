//
//  ViewController.m
//  Tippy
//
//  Created by Sophia Zheng on 6/26/18.
//  Copyright © 2018 Sophia Zheng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *perTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UIView *billView;
@property (weak, nonatomic) IBOutlet UISlider *tipSlider;
@property (weak, nonatomic) IBOutlet UIView *sliderView;
@property (weak, nonatomic) IBOutlet UILabel *percentLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    NSLog(@"hello");
    [self.view endEditing:YES];
}

- (IBAction)onEdit:(id)sender {
    double bill = [self.billField.text doubleValue];
    double tipPercentage;
    
    if (self.tipControl.selectedSegmentIndex != 3) {
        [self.sliderView setHidden:YES];
        NSArray *percentages = @[@(0.15), @(0.2), @(0.25)];
        tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    } else {
        [self.sliderView setHidden:NO];
        tipPercentage = self.tipSlider.value;
        int percent = tipPercentage * 100;
        self.percentLabel.text = [NSString stringWithFormat:@"%d", percent];
    }
    
    double tip = tipPercentage * bill;
    double total = bill + tip;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int numPeople = [defaults integerForKey:@"default_num_people"];
    if (numPeople == NULL) {
        numPeople = 1;
    }
    
    double perTotal = total / numPeople;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
    self.perTotalLabel.text = [NSString stringWithFormat:@"$%.2f", perTotal];
}

- (IBAction)onEditingBegin:(id)sender {
    CGRect newFrame = self.billView.frame;
    newFrame.origin.y += 30;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.billView.frame = newFrame;
    }];
}

- (IBAction)onEditingEnd:(id)sender {
    CGRect newFrame = self.billView.frame;
    newFrame.origin.y -= 30;
    
    [UIView animateWithDuration:0.2 animations:^{
      self.billView.frame = newFrame;
    }];
}


@end
