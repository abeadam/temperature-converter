//
//  TemperatureConverterViewController.m
//  temperatureConverter
//
//  Created by Abraham Adam on 1/11/14.
//  Copyright (c) 2014 Abraham Adam. All rights reserved.
//

#import "TemperatureConverterViewController.h"

@interface TemperatureConverterViewController ()
- (IBAction)FahrenheitChange:(id)sender;
- (IBAction)CelsiusChange:(id)sender;
- (void)onDone;
@property NSString * lastChanged;
@end

@implementation TemperatureConverterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Temperature";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.fahrenheitTextField.text = @"";
    self.celsiusTextField.text = @"";
    self.fahrenheitTextField.delegate = self;
    self.celsiusTextField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) calculateEnd {
    [self.view endEditing:YES];
}

- (IBAction)FahrenheitChange:(id)sender {
    /*float fahrenheitAmount = [self.fahrenheitTextField.text floatValue];
    float celsiusAmount = (fahrenheitAmount-32)*(5.0/9.0);
    self.celsiusTextField.text = [NSString stringWithFormat:@"%0.2f", celsiusAmount];*/
    self.lastChanged = @"fahrenheit";
}

- (IBAction)CelsiusChange:(id)sender {
    /*float celsiusAmount = [self.celsiusTextField.text floatValue];
    float fahrenheitAmount =(9.0/5.0)*celsiusAmount+32;
    self.fahrenheitTextField.text = [NSString stringWithFormat:@"%0.2f", fahrenheitAmount];*/
    self.lastChanged = @"celsius";
}

-  (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Convert" style:UIBarButtonItemStyleBordered target:self action:@selector(onDone)];
    return YES;
}

- (void)onDone {
    if ([self.lastChanged isEqual:@"fahrenheit"]) {
        float fahrenheitAmount = [self.fahrenheitTextField.text floatValue];
        int celsiusAmount = (fahrenheitAmount-32)*(5.0/9.0);
        self.celsiusTextField.text = [NSString stringWithFormat:@"%d", celsiusAmount];
    } else if ([self.lastChanged isEqual:@"celsius"]){
        float celsiusAmount = [self.celsiusTextField.text floatValue];
        int fahrenheitAmount =(9.0/5.0)*celsiusAmount+32;
        self.fahrenheitTextField.text = [NSString stringWithFormat:@"%d", fahrenheitAmount];
    }
    [self calculateEnd];
}

- (IBAction)convert:(id)sender {
    [self onDone];
}
@end
