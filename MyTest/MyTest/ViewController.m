//
//  ViewController.m
//  MyTest
//
//  Created by 崔兵兵 on 16/3/30.
//  Copyright © 2016年 医联通. All rights reserved.
//

#import "ViewController.h"
#import "CBTableViewCell.h"
#import "CBView.h"
#import "CBCustomView/CBCustomFunctionView.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, CBViewClickedDelegate, CBCustomFunctionViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic, strong) CBView *myView;
@property (strong, nonatomic) CBCustomFunctionView *customFuctionView;
@property (strong, nonatomic) NSMutableArray *arrayDatas;
@property (strong, nonatomic) NSMutableArray *arrayData1;

@end

@implementation ViewController

- (CBView *)myView
{
    if (!_myView) {
        _myView = [[[NSBundle mainBundle] loadNibNamed:@"CBView" owner:nil options:nil] lastObject];
        _myView.frame = CGRectMake(20, -50, 240, 50);
        _myView.delegate = self;
    }
    
    return _myView;
}

- (NSMutableArray *)arrayDatas
{
    if (!_arrayDatas) {
        _arrayDatas = [NSMutableArray arrayWithObjects:@"办理出院", @"添加血糖", @"修改住院", @"对他说", nil];
    }
    
    return _arrayDatas;
}

- (NSMutableArray *)arrayData1
{
    if (!_arrayData1) {
        _arrayData1 = [NSMutableArray arrayWithObjects:@"办理出院", @"继续会诊", nil];
    }
    
    return _arrayData1;
}

- (CBCustomFunctionView *)customFuctionView
{
    if (!_customFuctionView) {
        _customFuctionView = [[CBCustomFunctionView alloc] init];
        _customFuctionView.delegate = self;
    }
    
    return _customFuctionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self addLongPre];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addLongPre
{
    UILongPressGestureRecognizer *longPre = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressToDo:)];
    longPre.minimumPressDuration = 1.0;
    [self.myTableView addGestureRecognizer:longPre];
}

-(void)longPressToDo:(UILongPressGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateBegan) {
        
        [self removeFunctionView];
        
        CGPoint point = [gesture locationInView:self.myTableView];
        NSIndexPath *indexPath = [self.myTableView indexPathForRowAtPoint:point];
        
        CGRect rectInTableView = [self.myTableView rectForRowAtIndexPath:indexPath];
        CGRect rectInSuperView = [self.myTableView convertRect:rectInTableView toView:[self.myTableView superview]];
        
//        //  添加View
//        {
//            CGRect rect = self.myView.frame;
//            rect.origin.y = rectInSuperView.origin.y - 20;
//            self.myView.frame = rect;
//            
//            self.myView.indexPath = indexPath;
//            
//            [self.view addSubview:self.myView];
//        }
        
        //  添加自定义的View
        {
            if (indexPath.row % 2 == 0) {
                [self.customFuctionView createFunctionViewWithButtons:self.arrayDatas withView:self.customFuctionView];
            } else {
                [self.customFuctionView createFunctionViewWithButtons:self.arrayData1 withView:self.customFuctionView];
            }
            
            CGRect rect = self.customFuctionView.frame;
            rect.origin.x = 20;
            rect.origin.y = rectInSuperView.origin.y - 20;
            self.customFuctionView.frame = rect;
            
            self.customFuctionView.selectIndex = indexPath;
            [self.view addSubview:self.customFuctionView];
        }
        
    }
}

#pragma mark - UITableView Delegate and DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.00001f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CBTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cbCellIndex"];
    
    [cell setCellWithStringValue:[NSString stringWithFormat:@"%li", indexPath.row]];
//    __weak typeof(self) ws = self;
//    cell.SelectCellBlock = ^(NSIndexPath *selectIndex) {
//        [ws showFunctionViewWithIndex:selectIndex];
//    };
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    [self removeFunctionView];
    
    [self.myView removeFromSuperview];
    self.myView = nil;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.myView removeFromSuperview];
    self.myView = nil;
}

//#pragma mark - 显示并加载气泡
//- (void)showFunctionViewWithIndex:(NSIndexPath *)cellIndexPath
//{
//    
//    CGRect rectInTableView = [self.myTableView rectForRowAtIndexPath:cellIndexPath];
//    CGRect rectInSuperView = [self.myTableView convertRect:rectInTableView toView:[self.myTableView superview]];
//    
//    //  添加自定义的View
//    {
//        
//        [self.customFuctionView createFunctionViewWithButtons:self.arrayDatas withView:self.customFuctionView];
//        
//        CGRect rect = self.customFuctionView.frame;
//        rect.origin.x = 20;
//        rect.origin.y = rectInSuperView.origin.y - 20;
//        self.customFuctionView.frame = rect;
//        
//        self.customFuctionView.selectIndex = indexPath;
//        [self.view addSubview:self.customFuctionView];
//    }
//
//}

#pragma mark - myDelegate
- (void)didSelectRowWithIndexPath:(NSIndexPath *)index
{
    NSLog(@"------%@",[NSString stringWithFormat:@"----获取的是第%li个cell", index.row]);
    [self.myView removeFromSuperview];
    self.myView.delegate = nil;
    self.myView = nil;
}

#pragma mark - CBCustomFunctionViewDelegate
- (void)functionButtonClickedWithFunctionName:(NSString *)functionName withSelectIndex:(NSIndexPath *)selectIndex
{
    NSLog(@"------点击了第%li个cell上的%@按钮", selectIndex.row, functionName);
    
    [self removeFunctionView];
}

- (void)removeFunctionView
{
    [self.customFuctionView removeFromSuperview];
    self.customFuctionView.delegate = nil;
    self.customFuctionView = nil;
}

@end
