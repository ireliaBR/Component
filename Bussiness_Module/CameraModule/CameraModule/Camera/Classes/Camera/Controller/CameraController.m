//
//  CameraController.m
//  CameraModule
//
//  Created by 范冬冬 on 2018/4/23.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "CameraController.h"

// 系统库头文件


// 第三方库头文件
#import <GPUImage/GPUImage.h>
#import <CommonModule/CameraShowAnimate.h>

// 自定义模块的头文件
#import "CameraPrefixHeader.h"
#import "BeautifulFilterView.h"

@interface CameraController ()<BeautifulFilterViewDelegate
>

@property(nonatomic,strong)GPUImageView *imageView;
@property(nonatomic,strong)GPUImageStillCamera *stillCamera;
//@property(nonatomic,strong)GPUImageFilterGroup *filterGroup;
@property(nonatomic,strong)GPUImageOutput<GPUImageInput> *currentFilter;

@property(nonatomic,strong)UIView *contentView;
@property(nonatomic,strong)UIButton *cancelBtn;
@property(nonatomic,strong)UIButton *photoBtn;
@property(nonatomic,strong)UIButton *sizeBtn;
@property(nonatomic,strong)UIButton *moreBtn;
@property(nonatomic,strong)UIButton *transformBtn;
@property(nonatomic,strong)UIButton *cameraBtn;
@property(nonatomic,strong)UIButton *filterBtn;
@property(nonatomic,strong)UIImageView *focusImageView;
@property(nonatomic,strong)BeautifulFilterView *beautifulView;
@property(nonatomic,strong)UIButton *beautifulBtn;

@property(nonatomic,strong)NSMutableArray<GPUImageFilter*> *filters;

@end

@implementation CameraController
#pragma mark - Lifecycle
-(void)viewDidLoad
{
    [super viewDidLoad];
    [self initUI];
    [self initCamera];
    [self addGenstureRecognizer];
    
//    self.transitioningDelegate = self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.stillCamera startCameraCapture];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.stillCamera stopCameraCapture];
}

-(void)dealloc
{
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - Custom Accessors
-(UIView *)contentView {
    if (!_contentView) {
        _contentView = [UIView new];
        [self.view addSubview:_contentView];
        [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }
    return _contentView;
}

-(UIButton *)cameraBtn {
    if (!_cameraBtn) {
        _cameraBtn = [UIButton new];
        [_cameraBtn setImage:UIImageNamed(icon_camera_camera) forState:UIControlStateNormal];
        [self.view addSubview:_cameraBtn];
        [_cameraBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.bottom.equalTo(self.view).offset(-38);
        }];
        
        [_cameraBtn addTarget:self action:@selector(cameraBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cameraBtn;
}

-(UIButton *)cancelBtn {
    if (!_cancelBtn) {
        _cancelBtn = [UIButton new];
        [_cancelBtn setImage:UIImageNamed(icon_camera_cancel) forState:UIControlStateNormal];
        [self.view addSubview:_cancelBtn];
        
        [_cancelBtn addTarget:self action:@selector(cancelBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelBtn;
}

-(UIButton *)photoBtn
{
    if (!_photoBtn) {
        _photoBtn = [UIButton new];
        [_photoBtn setImage:UIImageNamed(icon_camera_image) forState:UIControlStateNormal];
        [self.view addSubview:_photoBtn];
        
        [_photoBtn addTarget:self action:@selector(photoBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _photoBtn;
}

-(UIButton *)sizeBtn
{
    if (!_sizeBtn) {
        _sizeBtn = [UIButton new];
        [_sizeBtn setImage:UIImageNamed(icon_camera_size) forState:UIControlStateNormal];
        [self.view addSubview:_sizeBtn];
        
        [_sizeBtn addTarget:self action:@selector(sizeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sizeBtn;
}

-(UIButton *)moreBtn
{
    if (!_moreBtn) {
        _moreBtn = [UIButton new];
        [_moreBtn setImage:UIImageNamed(icon_camera_more) forState:UIControlStateNormal];
        [self.view addSubview:_moreBtn];
        
        [_moreBtn addTarget:self action:@selector(moreBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _moreBtn;
}

-(UIButton *)transformBtn
{
    if (!_transformBtn) {
        _transformBtn = [UIButton new];
        [_transformBtn setImage:UIImageNamed(icon_camera_transform) forState:UIControlStateNormal];
        [self.view addSubview:_transformBtn];
        
        [_transformBtn addTarget:self action:@selector(transformBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _transformBtn;
}

-(UIImageView *)focusImageView
{
    if (!_focusImageView) {
        _focusImageView = [[UIImageView alloc] initWithImage:UIImageNamed(icon_camera_focus)];
        [self.contentView addSubview:_focusImageView];
        [_focusImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.contentView);
        }];
        
        _focusImageView.alpha = 0.0;
    }
    return _focusImageView;
}

-(BeautifulFilterView *)beautifulView
{
    if (!_beautifulView) {
        _beautifulView = [BeautifulFilterView new];
        _beautifulView.delegate = self;
        [self.view insertSubview:_beautifulView belowSubview:self.cameraBtn];
        [_beautifulView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.view);
            make.top.equalTo(self.view.mas_bottom);
        }];
    }
    return _beautifulView;
}

-(UIButton *)beautifulBtn
{
    if (!_beautifulBtn) {
        _beautifulBtn = [UIButton new];
        [_beautifulBtn setImage:UIImageNamed(icon_camera_filter) forState:UIControlStateNormal];
        [self.view addSubview:_beautifulBtn];
        [_beautifulBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.cameraBtn);
            make.right.equalTo(self.view).offset(-20);
        }];
        
        [_beautifulBtn addTarget:self action:@selector(beautifulBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _beautifulBtn;
}

-(GPUImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[GPUImageView alloc] init];
        [self.contentView addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }
    return _imageView;
}

-(GPUImageStillCamera *)stillCamera
{
    if (!_stillCamera) {
        _stillCamera = [[GPUImageStillCamera alloc] initWithSessionPreset:AVCaptureSessionPreset1280x720 cameraPosition:AVCaptureDevicePositionBack];
        _stillCamera.outputImageOrientation = UIInterfaceOrientationPortrait;
    }
    return _stillCamera;
}

-(NSMutableArray<GPUImageFilter *> *)filters
{
    if (!_filters) {
        _filters = [[NSMutableArray alloc] init];
    }
    return _filters;
}

#pragma mark - IBActions
- (void)tapScreen:(UITapGestureRecognizer *) tapGesture
{
    if (self.beautifulBtn.alpha == 0.0) {
        [UIView animateWithDuration:0.3 animations:^{
            self.beautifulBtn.alpha = 1.0;
            self.beautifulBtn.transform = CGAffineTransformIdentity;
            self.cameraBtn.transform = CGAffineTransformIdentity;
            self.beautifulView.transform = CGAffineTransformIdentity;
        }];
        return;
    }
    
}

-(void)cameraBtnClick:(UIButton*)btn
{
    [self.stillCamera capturePhotoAsPNGProcessedUpToFilter:self.currentFilter withCompletionHandler:^(NSData *processedPNG, NSError *error) {
        if (error) {
            [[[UIAlertView alloc] initWithTitle:@"提示" message:@"拍照失败" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles:nil, nil] show];
            return;
        }
        
        UIImage *image = [UIImage imageWithData:processedPNG];
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
        [[[UIAlertView alloc] initWithTitle:@"提示" message:@"已保存到系统相册中" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles:nil, nil] show];
    }];
}

-(void)cancelBtnClick:(UIButton*)btn
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)photoBtnClick:(UIButton*)btn
{
    UIImagePickerController *pickerCtrl = [[UIImagePickerController alloc] init];
    pickerCtrl.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:pickerCtrl animated:YES completion:nil];
}

-(void)sizeBtnClick:(UIButton*)btn
{
    
}

-(void)moreBtnClick:(UIButton*)btn
{
    AVCaptureDevice *device = self.stillCamera.inputCamera;
    
    //修改前必须先锁定
    [device lockForConfiguration:nil];
    
    //必须判定是否有闪光灯，否则如果没有闪光灯会崩溃
    if ([device hasFlash]) {
        
        if (device.flashMode == AVCaptureFlashModeOff) {
            device.flashMode = AVCaptureFlashModeOn;
            device.torchMode = AVCaptureTorchModeOn;
        } else if (device.flashMode == AVCaptureFlashModeOn) {
            device.flashMode = AVCaptureFlashModeOff;
            device.torchMode = AVCaptureTorchModeOff;
        }
        
    }
    [device unlockForConfiguration];
}

-(void)transformBtnClick:(UIButton*)btn
{
    [self.stillCamera rotateCamera];
    
}

-(void)beautifulBtnClick:(UIButton*)btn
{
    CGAffineTransform scale = CGAffineTransformScale(self.cameraBtn.transform, 0.5, 0.5);
    CGAffineTransform translate = CGAffineTransformTranslate(self.cameraBtn.transform, 0, 30);
    
    [UIView animateWithDuration:0.3 animations:^{
        self.beautifulBtn.alpha = 0.0;
        self.beautifulBtn.transform = CGAffineTransformTranslate(self.beautifulBtn.transform, 0, 30);
        self.cameraBtn.transform = CGAffineTransformConcat(scale, translate);
        self.beautifulView.transform = CGAffineTransformTranslate(self.beautifulView.transform, 0, -180);
    }];
}

#pragma mark - Public


#pragma mark - Private
-(void)initUI
{
    [self contentView];
    [self cancelBtn];
    [self photoBtn];
    [self sizeBtn];
    [self moreBtn];
    [self transformBtn];
    [self cameraBtn];
    [self filterBtn];
    [self focusImageView];
    [self beautifulBtn];
    
    NSArray<UIButton *> *btns = @[self.cancelBtn, self.photoBtn, self.sizeBtn, self.moreBtn, self.transformBtn];
    [btns mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(30);
    }];
    [btns mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:30 leadSpacing:25 tailSpacing:25];
}

-(void)initCamera
{
    [self imageView];
    [self stillCamera];
    [self.stillCamera addTarget:self.imageView];
    
}

//添加点击手势，点按时聚焦
- (void)addGenstureRecognizer{
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapScreen:)];
    [self.contentView addGestureRecognizer:tapGesture];
}

//设置聚焦光标位置
- (void)setFocusCursorWithPoint:(CGPoint)point{
    
    self.focusImageView.center = point;
    self.focusImageView.transform = CGAffineTransformMakeScale(1.5, 1.5);
    self.focusImageView.alpha = 1.0;
    [UIView animateWithDuration:1.0 animations:^{
        self.focusImageView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        self.focusImageView.alpha=0;
    }];
}

#pragma mark - Protocol conformance
#pragma mark - BeautifulViewDelegate
-(void)beautifulFilterViewSelectedBtn:(BeautifulFilterView *)view filter:(GPUImageOutput<GPUImageInput> *)filter
{
    self.currentFilter = filter;
    [self.stillCamera removeAllTargets];
    [self.stillCamera addTarget:self.currentFilter];
    [self.currentFilter addTarget:self.imageView];
}

-(void)beautifulFilterViewCancelBtn:(BeautifulFilterView *)view filter:(GPUImageOutput<GPUImageInput> *)filter
{
    self.currentFilter = nil;
    [self.stillCamera removeAllTargets];
    [self.stillCamera addTarget:self.imageView];
}

#pragma mark - UIViewControllerTransitioningDelegate

@end
