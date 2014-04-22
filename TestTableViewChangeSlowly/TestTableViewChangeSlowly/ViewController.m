//
//  ViewController.m
//  TestTableViewChangeSlowly
//
//  Created by Arthur Wang on 14-4-21.
//  Copyright (c) 2014年 Insigma HengTian Software Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>

@property (nonatomic, retain) UITableView *myTableView;
@property (nonatomic, retain) NSArray     *myDatabase;
@property (nonatomic, assign) CGRect      tableViewFrame;



- (void)changeTableViewFrame:(CGFloat)offset;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    _tableViewFrame = CGRectMake(0, 300, 320, 268);
    _myTableView = [[UITableView alloc] initWithFrame:_tableViewFrame];
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    
    [self.view addSubview:_myTableView];
    
    
    _myDatabase = @[@"aslfjlsjf", @"asjdfjalsjdfasdf", @"asdflasjdflasjdf", @"asdlfjasldfjlsjdf",@"aslfjlsjf", @"asjdfjalsjdfasdf", @"asdflasjdflasjdf", @"asdlfjasldfjlsjdf",@"aslfjlsjf", @"asjdfjalsjdfasdf", @"asdflasjdflasjdf", @"asdlfjasldfjlsjdf",@"aslfjlsjf", @"asjdfjalsjdfasdf", @"asdflasjdflasjdf", @"asdlfjasldfjlsjdf",@"aslfjlsjf", @"asjdfjalsjdfasdf", @"asdflasjdflasjdf", @"asdlfjasldfjlsjdf",@"aslfjlsjf", @"asjdfjalsjdfasdf", @"asdflasjdflasjdf", @"asdlfjasldfjlsjdf",@"aslfjlsjf", @"asjdfjalsjdfasdf", @"asdflasjdflasjdf", @"asdlfjasldfjlsjdf",@"aslfjlsjf", @"asjdfjalsjdfasdf", @"asdflasjdflasjdf", @"asdlfjasldfjlsjdf",@"aslfjlsjf", @"asjdfjalsjdfasdf", @"asdflasjdflasjdf", @"asdlfjasldfjlsjdf",@"aslfjlsjf", @"asjdfjalsjdfasdf", @"asdflasjdflasjdf", @"asdlfjasldfjlsjdf",@"aslfjlsjf", @"asjdfjalsjdfasdf", @"asdflasjdflasjdf", @"asdlfjasldfjlsjdf",@"aslfjlsjf", @"asjdfjalsjdfasdf", @"asdflasjdflasjdf", @"asdlfjasldfjlsjdf",@"aslfjlsjf", @"asjdfjalsjdfasdf", @"asdflasjdflasjdf", @"asdlfjasldfjlsjdf"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma  - mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_myDatabase count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *indentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    
    if ( nil == cell )
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
    }
    
    cell.textLabel.text = [_myDatabase objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma  - mark UITableViewDelegate

#pragma - mark UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self changeTableViewFrame:scrollView.contentOffset.y];
    
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    NSLog(@"scrollViewWillEndDragging");
    
}

#pragma mark parivate method
- (void)changeTableViewFrame:(CGFloat)offset
{
    CGRect frame = _tableViewFrame;
    frame.size.height += offset;
    frame.origin.y -= offset;
    [UIView animateWithDuration:0.1
                     animations:^{
                         NSLog(@"change the frame of table view.");
                         self.myTableView.frame = frame;
                     } completion:^(BOOL finished) {
                         NSLog(@"finished!!!");
                     }];
    
}


@end
