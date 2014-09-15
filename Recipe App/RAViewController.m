//
//  RAViewController.m
//  Recipe App
//
//  Created by Taylor Mott on 9.11.14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "RAViewController.h"
#import "RATableViewDatasource.h"
#import "RADetailViewController.h"

static NSString const * CELL = @"Cell";

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
    
    self.recipeTableView.delegate = self;
    [self.view addSubview:self.recipeTableView];
    
    //tell tableview waht type of cell we are registering
    [self.recipeTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:(NSString *)CELL];
    
    
    // Do any additional setup after loading the view.
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
    headerView.backgroundColor = [UIColor whiteColor];
    
    UIImageView *headerImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 35)];
    headerImage.image = [UIImage imageNamed:@"recipe-com.jpg"];
    headerImage.contentMode = UIViewContentModeLeft;
    [headerView addSubview:headerImage];

    return headerView;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    RADetailViewController *raDetailVC = [RADetailViewController new];
    raDetailVC.indexPathSelected = indexPath;
    [self.navigationController pushViewController:raDetailVC animated:YES];
}

//Set height of cells
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
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
