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

static CGFloat MARGIN = 15;                             //side margins
static CGFloat FONT_SIZE = 14;
static CGFloat NAV_BAR_HEIGHT = 64;
static CGFloat BUFFER = 5;
static CGFloat PERCENT_WIDTH_FOR_INGREDIENT_VOLUME = .25;
static CGFloat PERCENT_WIDTH_FOR_INGREDIENT = .75;      //should add up to 1.00
static NSString * const INGREDIENT_KEY = @"ingredientType";;
static NSString * const RECIPE_INGREDIENT_VOLUME_KEY = @"ingredientVolume";

@interface RADetailViewController ()

@property (strong, nonatomic) RATableViewDatasource *dataSource;
@property (        nonatomic) CGFloat bottomOfContent;
@property (strong, nonatomic) UILabel *recipeDescription;

@end

@implementation RADetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGFloat frameWidthWithMargin = self.view.frame.size.width - (2 * MARGIN);
    
    self.bottomOfContent = NAV_BAR_HEIGHT + BUFFER;
    
    //pastel purple
    self.view.backgroundColor = [UIColor colorWithRed:0.569 green:0.443 blue:0.639 alpha:1];
    
    self.title = [RARecipes titleAtIndex:self.indexPathSelected.row];
    
    //RECIPE DESRIPTION
    self.recipeDescription = [[UILabel alloc]initWithFrame:CGRectMake(MARGIN, self.bottomOfContent, frameWidthWithMargin, 20)];
    self.recipeDescription.numberOfLines = 0;
    self.recipeDescription.font = [UIFont systemFontOfSize:FONT_SIZE];
    self.recipeDescription.text = [RARecipes descriptionAtIndex:self.indexPathSelected.row];
    [self.recipeDescription sizeToFit];
    self.bottomOfContent += self.recipeDescription.frame.size.height;
    self.bottomOfContent += BUFFER;
    [self.view addSubview:self.recipeDescription];
    
    //Title Label -- INGREDIENTS
    UILabel *ingredientsTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(MARGIN, self.bottomOfContent, frameWidthWithMargin, 20)];
    ingredientsTitleLabel.font = [UIFont boldSystemFontOfSize:FONT_SIZE];
    ingredientsTitleLabel.text = @"Ingredients";
    [ingredientsTitleLabel sizeToFit];
    self.bottomOfContent += ingredientsTitleLabel.frame.size.height;
    self.bottomOfContent += BUFFER;
    [self.view addSubview:ingredientsTitleLabel];
    
    
    //Ingredients
    NSArray * ingredients = [RARecipes ingredientArrayAtIndex:self.indexPathSelected.row];
    for (int i = 0; i < ingredients.count; i++)
    {
        UILabel *quantityLabel = [[UILabel alloc] initWithFrame:CGRectMake(MARGIN, self.bottomOfContent, frameWidthWithMargin * PERCENT_WIDTH_FOR_INGREDIENT_VOLUME, 20)];
        quantityLabel.font = [UIFont systemFontOfSize:FONT_SIZE];
        quantityLabel.text = ingredients[i][RECIPE_INGREDIENT_VOLUME_KEY];
        [quantityLabel sizeToFit];
        CGFloat quantityHeight = quantityLabel.frame.size.height;
        [self.view addSubview:quantityLabel];
        
        UILabel *ingredientLabel = [[UILabel alloc] initWithFrame:CGRectMake(MARGIN + (frameWidthWithMargin * PERCENT_WIDTH_FOR_INGREDIENT_VOLUME) , self.bottomOfContent, frameWidthWithMargin * PERCENT_WIDTH_FOR_INGREDIENT, 20)];
        ingredientLabel.font = [UIFont italicSystemFontOfSize:FONT_SIZE];
        ingredientLabel.numberOfLines = 0;
        ingredientLabel.text = ingredients[i][INGREDIENT_KEY];
        [ingredientLabel sizeToFit];
        CGFloat ingredientHeight = ingredientLabel.frame.size.height;
        [self.view addSubview:ingredientLabel];
        
        if (ingredientHeight > quantityHeight)
        {
            self.bottomOfContent += ingredientHeight;
        }
        else
        {
            self.bottomOfContent += quantityHeight;
        }
        self.bottomOfContent += BUFFER;
    }
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
