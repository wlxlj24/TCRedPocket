//
//  RedpocketScrollView.m
//  yueta
//
//  Created by TailC on 2017/5/10.
//  Copyright © 2017年 chase. All rights reserved.
//

#import "TCRedpocketScrollView.h"

static NSString *const reuserID = @"RechargedUserID";

@interface TCRedpocketScrollView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSInteger currentIndex;

@end

@implementation TCRedpocketScrollView
- (void)dealloc{
    [self removeTimer];
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViewsWithFrame:frame];
    }
    return self;
}

-(void)setupViewsWithFrame:(CGRect)frame{
    
    self.backgroundColor = [UIColor colorWithRed:0.882 green:0.271 blue:0.271 alpha:1];
    
    self.tableView = [[UITableView alloc] initWithFrame:frame];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self addSubview:self.tableView];
    self.tableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:reuserID];
    self.tableView.userInteractionEnabled = NO;
    self.tableView.backgroundColor = [UIColor colorWithRed:0.882 green:0.271 blue:0.271 alpha:1];
}

- (NSTimer *)timer
{
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.04 target:self selector:@selector(scroll) userInfo:nil repeats:YES];
    }
    return _timer;
}

- (void)addTimer
{
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)removeTimer
{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)setDataArray:(NSArray<NSString *> *)dataArray
{
    _dataArray = dataArray;
    [self.tableView reloadData];
    
    [self addTimer];
}

- (void)scroll
{
    if (!self.dataArray.count) return;
    
    [self.tableView setContentOffset:CGPointMake(0, ++self.currentIndex)];
    
    CGFloat height = self.tableView.frame.size.height;
    CGFloat contentOffsetY = self.tableView.contentOffset.y;
    CGFloat bottomOffset = self.tableView.contentSize.height - contentOffsetY;
    if (bottomOffset <= height)
    {
        //在最底部
        self.currentIndex = 0;
    }
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuserID forIndexPath:indexPath];
    cell.textLabel.font = [UIFont systemFontOfSize:12];
    cell.backgroundColor = [UIColor colorWithRed:0.882 green:0.271 blue:0.271 alpha:1];
    
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 20;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self removeTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self addTimer];
}



@end
