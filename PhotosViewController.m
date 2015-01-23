//
//  PhotosViewController.m
//  PicFeed11
//
//  Created by Xiangyu Zhang on 1/22/15.
//  Copyright (c) 2015 Yahoo!. All rights reserved.
//

#import "PhotosViewController.h"

#import "PhotoTableViewCell.h"

@interface PhotosViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *PhotoTableView;

@end

@implementation PhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.PhotoTableView.dataSource = self;
    
    self.PhotoTableView.delegate = self;
    self.PhotoTableView.rowHeight = 320;
    [self.PhotoTableView registerNib:[UINib nibWithNibName:@"PhotoTableViewCell" bundle:nil] forCellReuseIdentifier:@"PhotoTableViewCell"];
    
    // Do any additional setup after loading the view from its nib.
    NSURL *url = [NSURL URLWithString:@"https://api.instagram.com/v1/media/popular?client_id=52f24631dcf04da4b9984ccb848c3a34"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        NSLog(@"response: %@", responseDictionary);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PhotoTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"PhotoTableViewCell" forIndexPath:indexPath];
    //UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    //cell.textLabel.text = [NSString stringWithFormat:@"This is row %ld", indexPath.row];
    return cell;
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
