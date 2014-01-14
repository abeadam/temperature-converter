//
//  TemperatureConverterViewController.h
//  temperatureConverter
//
//  Created by Abraham Adam on 1/11/14.
//  Copyright (c) 2014 Abraham Adam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TemperatureConverterViewController : UIViewController <UITextFieldDelegate>
@property (nonatomic, strong) IBOutlet UITextField *fahrenheitTextField;
@property (nonatomic, strong) IBOutlet UITextField *celsiusTextField;

- (IBAction)calculateEnd;

@end
