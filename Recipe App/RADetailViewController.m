//
//  RADetailViewController.m
//  Recipe App
//
//  Created by Taylor Mott on 9.13.14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "RADetailViewController.h"
#import "RARecipes.h"
#import "RATableViewDatasource.h"

static CGFloat margin = 15;                             //side margins

@interface RADetailViewController ()

@property (strong, nonatomic) RATableViewDatasource *dataSource;

@end

@implementation RADetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor purpleColor];
    self.title = [RARecipes titleAtIndex:self.indexPathSelected.row];
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
