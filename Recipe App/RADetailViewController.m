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
static CGFloat fontSize = 14;
static CGFloat navBarHeight = 64;
static CGFloat descriptionHeight = 75;
static CGFloat ingredientTitleLabelHeight = 30;
//static CGFloat percentWidthForIngredientVolume = .20;
//static CGFloat percentWidthForIngredient = .80;

@interface RADetailViewController ()

@property (strong, nonatomic) RATableViewDatasource *dataSource;
@property (        nonatomic) CGFloat bottomOfContent;
@property (strong, nonatomic) UILabel *recipeDescription;

@end

@implementation RADetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGFloat frameWidthWithMargin = self.view.frame.size.width - (2 * margin);
    
    self.bottomOfContent = navBarHeight;
    
    self.view.backgroundColor = [UIColor purpleColor];
    self.title = [RARecipes titleAtIndex:self.indexPathSelected.row];
    
    
    //RECIPE DESRIPTION
    self.recipeDescription = [[UILabel alloc] initWithFrame:CGRectMake(margin, self.bottomOfContent, frameWidthWithMargin, descriptionHeight)];
    self.recipeDescription.text = [RARecipes descriptionAtIndex:self.indexPathSelected.row];
    self.recipeDescription.font = [UIFont systemFontOfSize:fontSize];
    self.recipeDescription.numberOfLines = 0;
    self.recipeDescription.lineBreakMode = NSLineBreakByWordWrapping;
    [self.view addSubview:self.recipeDescription];
    self.bottomOfContent += descriptionHeight;
    
    
    //Title Label -- INGREDIENTS
    UILabel *ingredientsTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin, self.bottomOfContent, frameWidthWithMargin, ingredientTitleLabelHeight)];
    ingredientsTitleLabel.text = @"Ingredients";
    ingredientsTitleLabel.font = [UIFont boldSystemFontOfSize:fontSize];
    [self.view addSubview:ingredientsTitleLabel];
    
    
    
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
