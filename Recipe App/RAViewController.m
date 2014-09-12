//
//  RAViewController.m
//  Recipe App
//
//  Created by Taylor Mott on 9.11.14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "RAViewController.h"

@interface RAViewController ()

@property (strong, nonatomic) UITableView * recipeTableView;

@end

@implementation RAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Taylor's Best Recipes";
    
    self.recipeTableView = [[UITableView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.recipeTableView];
    
    
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

@end
