//
//  RAViewController.m
//  Recipe App
//
//  Created by Taylor Mott on 9.11.14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "RAViewController.h"
#import "RATableViewDatasource.h"

@interface RAViewController ()

@property (strong, nonatomic) UITableView *recipeTableView;
@property (strong, nonatomic) RATableViewDatasource *dataSource;

@end

@implementation RAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Taylor's Best Recipes";
    
    self.dataSource = [RATableViewDatasource new];
    
    self.recipeTableView = [[UITableView alloc] initWithFrame:self.view.frame];
    self.recipeTableView.dataSource = self.dataSource;
    [self.view addSubview:self.recipeTableView];
    
    //tell tableview waht type of cell we are registering
    [self.recipeTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    
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
