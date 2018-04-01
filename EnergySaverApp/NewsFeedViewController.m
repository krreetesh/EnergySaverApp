//
//  NewsFeedViewController.m
//  EnergySaverApp
//
//  Created by Admin on 30/11/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "NewsFeedViewController.h"
#import "People.h"

@interface NewsFeedViewController ()

@end

@implementation NewsFeedViewController
{
    NSMutableArray *local_players;
}

@synthesize players;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //INTEGRATE DATABASE HERE!!!
    
    local_players = [NSMutableArray arrayWithCapacity:20];
    
    People *player = [[People alloc] init];                     // Dummy data - cell 1
    player.name = @"Pranjal Pathak";
    player.age = @"24";
    player.points = @"85";
    player.typeofenergy = @"Electricity, Gas";
    player.unitsconsumed=@"40 Units";
    player.rank = @"11";
    player.rating = 4;
    [local_players addObject:player];
    
    player = [[People alloc] init];                             // Dummy data - cell 2
    player.name = @"Phani Praveen";
    player.age = @"25";
    player.points = @"77";
    player.typeofenergy = @"Electricity, Gas";
    player.unitsconsumed=@"56 Units";
    player.rank = @"109";
    player.rating = 3;
    [local_players addObject:player];
    
    player = [[People alloc] init];                             // Dummy data - cell 3
    player.age = @"23";
    player.name = @"Pooja Pandey";
    player.points = @"75";
    player.typeofenergy = @"Electricity, Gas, Petrol";
    player.unitsconsumed=@"68 Units";
    player.rank = @"42";
    player.rating = 4;
    [local_players addObject:player];
    
    player = [[People alloc] init];                             // Dummy data - cell 4
    player.age = @"24";
    player.name = @"Ramesh";
    player.points = @"50";
    player.typeofenergy = @"Electricity, Petrol";
    player.unitsconsumed=@"49 Units";
    player.rank = @"77";
    player.rating = 3;
    [local_players addObject:player];
    
    players = local_players;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


// CUSTOM TABLE VIEW - Prototype CELLS :

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.players count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProfileCell"];        // ID used for every Prototype Cell
    
    People *player = (self.players)[indexPath.row];
    
    UIImageView *profileImageView = (UIImageView *)[cell viewWithTag:100];
    profileImageView.image = [UIImage imageNamed:@"FbProfilePhoto.jpg"];                        // Integrate Here the GMAIL PHOTO!
    
    UILabel *nameLabel = (UILabel *)[cell viewWithTag:101];
    nameLabel.text = player.name;
    
    UILabel *ageLabel = (UILabel *)[cell viewWithTag:102];
    ageLabel.text = player.age;
    
    UIImageView *ratingImageView = (UIImageView *)[cell viewWithTag:103];                       // Integrate Here the Rating Image!
    ratingImageView.image = [self imageForRating:player.rating];
    
    UILabel *rankLabel = (UILabel *)[cell viewWithTag:104];
    rankLabel.text = player.rank;
    
    UILabel *energyLabel = (UILabel *)[cell viewWithTag:105];
    energyLabel.text = player.typeofenergy;
    
    UILabel *unitLabel = (UILabel *)[cell viewWithTag:106];
    unitLabel.text = player.unitsconsumed;
    
    UILabel *pointsLabel = (UILabel *)[cell viewWithTag:107];
    pointsLabel.text = player.points;
    
    return cell;
}

- (UIImage *)imageForRating:(int)rating                                 // Method for the Rating Image
{
    switch (rating)
    {
        case 1: return [UIImage imageNamed:@"1StarSmall"];
        case 2: return [UIImage imageNamed:@"2StarsSmall"];
        case 3: return [UIImage imageNamed:@"3StarsSmall"];
        case 4: return [UIImage imageNamed:@"4StarsSmall"];
        case 5: return [UIImage imageNamed:@"5StarsSmall"];
    }
    return nil;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
