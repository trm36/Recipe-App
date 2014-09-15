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

static CGFloat const MARGIN = 15;                             //side margins
static CGFloat const FONT_SIZE = 14;
static CGFloat const BUFFER = 5;
static CGFloat const PERCENT_WIDTH_FOR_INGREDIENT_VOLUME = .25;
static CGFloat const PERCENT_WIDTH_FOR_INGREDIENT = .75;      //should add up to 1.00
static CGFloat const PERCENT_WIDTH_FOR_DIRECTION_NUMBER = .10;
static CGFloat const PERCENT_WIDTH_FOR_DIRECTION = .90;      //should add up to 1.00
static NSString * const INGREDIENT_KEY = @"ingredientType";;
static NSString * const RECIPE_INGREDIENT_VOLUME_KEY = @"ingredientVolume";

@interface RADetailViewController ()

@property (strong, nonatomic) RATableViewDatasource *dataSource;
@property (        nonatomic) CGFloat bottomOfContent;
@property (strong, nonatomic) UIScrollView *scrollView;

@end

@implementation RADetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGFloat frameWidthWithMargin = self.view.frame.size.width - (2 * MARGIN);
    
    self.bottomOfContent = MARGIN;
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    //default of two score views to start with
    [self.view addSubview:self.scrollView];
    
    //pastel purple
    self.view.backgroundColor = [UIColor colorWithRed:0.569 green:0.443 blue:0.639 alpha:1];
    
    self.title = [RARecipes titleAtIndex:self.indexPathSelected.row];
    
    //Image
    UIImageView *recipeImage = [[UIImageView alloc] initWithFrame:CGRectMake(MARGIN, self.bottomOfContent, frameWidthWithMargin, frameWidthWithMargin)]; //squarePhotos
    recipeImage.image = [UIImage imageNamed:[RARecipes imageTitleAtIndex:self.indexPathSelected.row]];
    recipeImage.contentMode = UIViewContentModeScaleAspectFit;
    self.bottomOfContent += recipeImage.frame.size.height;
    self.bottomOfContent += BUFFER;
    [self.scrollView addSubview:recipeImage];
    
    //RECIPE DESRIPTION
    UILabel *recipeDescription;
    recipeDescription = [[UILabel alloc]initWithFrame:CGRectMake(MARGIN, self.bottomOfContent, frameWidthWithMargin, 20)];
    recipeDescription.numberOfLines = 0;
    recipeDescription.font = [UIFont systemFontOfSize:FONT_SIZE];
    recipeDescription.text = [RARecipes descriptionAtIndex:self.indexPathSelected.row];
    [recipeDescription sizeToFit];
    self.bottomOfContent += recipeDescription.frame.size.height;
    self.bottomOfContent += BUFFER;
    [self.scrollView addSubview:recipeDescription];
    
    //Title Label -- INGREDIENTS
    UILabel *ingredientsTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(MARGIN, self.bottomOfContent, frameWidthWithMargin, 20)];
    ingredientsTitleLabel.font = [UIFont boldSystemFontOfSize:FONT_SIZE];
    ingredientsTitleLabel.text = @"Ingredients";
    [ingredientsTitleLabel sizeToFit];
    self.bottomOfContent += ingredientsTitleLabel.frame.size.height;
    self.bottomOfContent += BUFFER;
    [self.scrollView addSubview:ingredientsTitleLabel];
    
    
    //Ingredients
    NSArray * ingredients = [RARecipes ingredientArrayAtIndex:self.indexPathSelected.row];
    for (int i = 0; i < ingredients.count; i++)
    {
        UILabel *quantityLabel = [[UILabel alloc] initWithFrame:CGRectMake(MARGIN, self.bottomOfContent, frameWidthWithMargin * PERCENT_WIDTH_FOR_INGREDIENT_VOLUME, 20)];
        quantityLabel.font = [UIFont systemFontOfSize:FONT_SIZE];
        quantityLabel.text = ingredients[i][RECIPE_INGREDIENT_VOLUME_KEY];
        [quantityLabel sizeToFit];
        CGFloat quantityHeight = quantityLabel.frame.size.height;
        [self.scrollView addSubview:quantityLabel];
        
        UILabel *ingredientLabel = [[UILabel alloc] initWithFrame:CGRectMake(MARGIN + (frameWidthWithMargin * PERCENT_WIDTH_FOR_INGREDIENT_VOLUME) , self.bottomOfContent, frameWidthWithMargin * PERCENT_WIDTH_FOR_INGREDIENT, 20)];
        ingredientLabel.font = [UIFont italicSystemFontOfSize:FONT_SIZE];
        ingredientLabel.numberOfLines = 0;
        ingredientLabel.text = ingredients[i][INGREDIENT_KEY];
        [ingredientLabel sizeToFit];
        CGFloat ingredientHeight = ingredientLabel.frame.size.height;
        [self.scrollView addSubview:ingredientLabel];
        
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
    
    //Title Label -- DIRECTION
    UILabel *directionTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(MARGIN, self.bottomOfContent, frameWidthWithMargin, 20)];
    directionTitleLabel.font = [UIFont boldSystemFontOfSize:FONT_SIZE];
    directionTitleLabel.text = @"Directions";
    [directionTitleLabel sizeToFit];
    self.bottomOfContent += directionTitleLabel.frame.size.height;
    self.bottomOfContent += BUFFER;
    [self.scrollView addSubview:directionTitleLabel];
    
    NSArray *directions = [RARecipes directionsAtIndex:self.indexPathSelected.row];
    for (int i = 0; i < directions.count; i++)
    {
        UILabel *numberedList = [[UILabel alloc] initWithFrame:CGRectMake(MARGIN, self.bottomOfContent, frameWidthWithMargin * PERCENT_WIDTH_FOR_DIRECTION_NUMBER, 20)];
        numberedList.font = [UIFont systemFontOfSize:FONT_SIZE];
        //i+1 to start ingredients direction numbering at 1
        numberedList.text = [NSString stringWithFormat:@"%d.", i + 1];
        [numberedList sizeToFit];
        CGFloat numberedListHeight = numberedList.frame.size.height;
        [self.scrollView addSubview:numberedList];
        
        UILabel *directionText = [[UILabel alloc] initWithFrame:CGRectMake(MARGIN + (frameWidthWithMargin * PERCENT_WIDTH_FOR_DIRECTION_NUMBER), self.bottomOfContent, frameWidthWithMargin * PERCENT_WIDTH_FOR_DIRECTION, 20)];
        directionText.font = [UIFont systemFontOfSize:FONT_SIZE];
        directionText.numberOfLines = 0;
        directionText.text = directions[i];
        [directionText sizeToFit];
        CGFloat directionTextHeight = directionText.frame.size.height;
        [self.scrollView addSubview:directionText];
        
        if (directionTextHeight > numberedListHeight)
        {
            self.bottomOfContent += directionTextHeight;
        }
        else
        {
            self.bottomOfContent += numberedListHeight;
        }
        self.bottomOfContent += BUFFER;
    }
    
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.bottomOfContent);
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
