//
//  RATableViewDatasource.m
//  Recipe App
//
//  Created by Taylor Mott on 9.11.14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "RATableViewDatasource.h"
#import "RARecipes.h"
#import "RAViewController.h"

@implementation RATableViewDatasource


//Required Method (1 of 2) for UITableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return [RARecipes count];
}

//Required Method (2 of 2) for UITableView
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.textLabel.text = [RARecipes titleAtIndex:indexPath.row];
    return cell;
}

//Set Section Headers
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Recipe.com";
}

- (NSArray *)titles
{
    NSInteger count = [RARecipes count];
    NSArray *recipeTitles = [[NSArray alloc] init];
    
    for (int i = 0; i < count; i++)
    {
        recipeTitles = [recipeTitles arrayByAddingObject:[[RARecipes recipeAtIndex:i] objectForKey:@"recipeTitle"]];
    }
    return recipeTitles;
}

- (NSString *)titleAtIndexPath:(NSIndexPath *)path {
    if (path.row < [self titles].count) {
        return [self titles][path.row];
    } else {
        return nil;
    }
}
@end
