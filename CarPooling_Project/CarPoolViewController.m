//
//  CarPoolViewController.m
//  CarPooling_Project
//
//  Created by 马远征 on 14-5-27.
//  Copyright (c) 2014年 马远征. All rights reserved.
//

#import "CarPoolViewController.h"

@interface CarPoolViewController ()

@end

@implementation CarPoolViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
       self.title = @"我的拼车";
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    UIView *contentView = [[UIView alloc]initWithFrame:[[UIScreen mainScreen]applicationFrame]];
    contentView.backgroundColor = [UIColor whiteColor];
    self.view = contentView;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
