//
//  ViewController.m
//  TemperatureConverter
//
//  Created by Richard Lee on 8/9/15.
//  Copyright (c) 2015 weimed. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *celsiusTextField;
@property (weak, nonatomic) IBOutlet UITextField *fahrenheitTextField;
@property (weak, nonatomic) IBOutlet UILabel *enclosureLabel;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;

- (IBAction)convertButton:(id)sender;
@end

@implementation ViewController

NSNumberFormatter *formatter;

- (void)viewDidLoad {
    [super viewDidLoad];

    // Formatter initialization
    formatter = [NSNumberFormatter new];
    [formatter setNumberStyle: NSNumberFormatterCurrencyStyle];
    [formatter setLenient:YES];
    [formatter setGeneratesDecimalNumbers:YES];
    
    // Set the editor as the first focus
    [self.celsiusTextField becomeFirstResponder];
    
    // Set the second text field read only
    self.fahrenheitTextField.userInteractionEnabled = NO;

    self.convertButton.layer.borderWidth = 1.0f;
    self.convertButton.layer.borderColor = [UIColor blueColor].CGColor;
    self.convertButton.layer.cornerRadius = 4.0f;
    
    self.enclosureLabel.layer.borderWidth = 1.0f;
    self.enclosureLabel.layer.borderColor = [UIColor blueColor].CGColor;
    self.enclosureLabel.layer.cornerRadius = 4.0f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)convertButton:(id)sender {
    float celsius = [[formatter numberFromString:self.celsiusTextField.text] floatValue];
    float fahrenheit = celsius * 1.8 + 32;
    self.fahrenheitTextField.text = [NSString stringWithFormat:@"%0.1f", fahrenheit];
}
@end
