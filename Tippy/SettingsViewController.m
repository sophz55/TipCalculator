//
//  SettingsViewController.m
//  Tippy
//
//  Created by Sophia Zheng on 6/26/18.
//  Copyright © 2018 Sophia Zheng. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet UISlider *numSlider;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
// Do any additional setup after loading the view.
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
- (IBAction)onPeopleEdit:(id)sender {
    int num = self.numSlider.value;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:num forKey:@"default_num_people"];
    [defaults synchronize];
    self.numLabel.text = [NSString stringWithFormat:@"%d", num];
}

@end
