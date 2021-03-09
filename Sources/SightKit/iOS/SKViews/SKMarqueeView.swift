//
//  JXMarqueeView.swift
//  DQGuess
//
//  Created by jiaxin on 2018/4/27.
//  Copyright © 2018年 jingbo. All rights reserved.
//

import UIKit

public protocol SKMarqueeViewCopyable {
    /// 如果视图里面有圆角、阴影等，仅通过NSKeyedArchiver、NSKeyedUnarchiver相关方法，会丢失对应信息。所以，这种特殊情况需要自定义返回。
    /// 重新拷贝一份目标视图。不能返回视图自己，需要重新创建一个实例。
    /// 第一种方案，实现required init?(coder aDecoder: NSCoder) 初始化器，返回一个新实例。参考CustomCopyView
    /// 第二种方案，重载func copyMarqueeView() -> UIView方法，返回一个新实例。参考CustomCopyView
    ///
    /// - Returns: new view
    func copyMarqueeView() -> UIView
}

extension UIView: SKMarqueeViewCopyable {
    @objc open func copyMarqueeView() -> UIView {
        //UIView是没有遵从拷贝协议的。可以通过UIView支持NSCoding协议，间接来复制一个视图
        let archivedData = NSKeyedArchiver.archivedData(withRootObject: self)
        let copyView = NSKeyedUnarchiver.unarchiveObject(with: archivedData) as! UIView
        return copyView
    }
}

public enum SKMarqueeType {
    case left
    case right
    case reverse
}


/** 跑马灯控件
 ## 使用示例
 ```
 let label = UILabel()
 label.textColor = UIColor.red
 label.font = UIFont.systemFont(ofSize: 30, weight: .medium)
 label.text = "abcdefghijklmnopqrstuvwxyz"
 
 let marqueeView = SKMarqueeView()
 marqueeView.contentView = label
 marqueeView.backgroundColor = UIColor.lightGray
 marqueeView.contentMargin = 50
 marqueeView.marqueeType = .left
 self.view.addSubview(marqueeView)
 */
public class SKMarqueeView: UIView {
    public var marqueeType: SKMarqueeType = .left
    public var contentMargin: CGFloat = 12                     //两个视图之间的间隔
    public var frameInterval: Int = 1                          //多少帧回调一次，一帧时间1/60秒
    public var pointsPerFrame: CGFloat = 0.5                   //每次回调移动多少点
    public var contentView: UIView? {
        didSet {
            self.setNeedsLayout()
        }
    }
    public var contentViewFrameConfigWhenCantMarquee: ((UIView)->())?    //当contentView的内容宽度没有超过显示宽度，无需开启跑马灯效果。这个时候contentView的size，默认是调用sizeToFit之后的尺寸。如果想要特殊配置，比如让contentView的size等于JXMarqueeView，就需要在该闭包自定义配置。
    private let boxView = UIView()
    private var marqueeDisplayLink: CADisplayLink?
    private var isReversing = false

    override open func willMove(toSuperview newSuperview: UIView?) {
        //当视图将被移除父视图的时候，newSuperview就为nil。在这个时候，停止掉CADisplayLink，断开循环引用，视图就可以被正确释放掉了。
        if newSuperview == nil {
            self.stopMarquee()
        }
    }

    public init() {
        super.init(frame: CGRect.zero)

        self.initializeViews()
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)

        self.initializeViews()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.initializeViews()
    }

    func initializeViews() {
        self.backgroundColor = UIColor.clear
        self.clipsToBounds = true

        boxView.backgroundColor = UIColor.clear
        self.addSubview(boxView)
    }

    override open func layoutSubviews() {
        super.layoutSubviews()

        guard let validContentView = contentView else {
            return
        }
        boxView.subviews.forEach {$0.removeFromSuperview() }

        //对于复杂的视图，需要自己重写contentView的sizeThatFits方法，返回正确的size
        validContentView.sizeToFit()
        boxView.addSubview(validContentView)

        if marqueeType == .reverse {
            boxView.frame = CGRect(x: 0, y: 0, width: validContentView.bounds.size.width, height: self.bounds.size.height)
        }else {
            boxView.frame = CGRect(x: 0, y: 0, width: validContentView.bounds.size.width*2 + contentMargin, height: self.bounds.size.height)
        }

        if validContentView.bounds.size.width > self.bounds.size.width {
            validContentView.frame = CGRect(x: 0, y: 0, width: validContentView.bounds.size.width, height: self.bounds.size.height)
            if marqueeType != .reverse {
                let otherContentView = validContentView.copyMarqueeView()
                otherContentView.frame = CGRect(x: validContentView.bounds.size.width + contentMargin, y: 0, width: validContentView.bounds.size.width, height: self.bounds.size.height)
                boxView.addSubview(otherContentView)
            }

            if self.bounds.size.width != 0 {
                self.startMarquee()
            }
        }else {
            if contentViewFrameConfigWhenCantMarquee != nil {
                contentViewFrameConfigWhenCantMarquee!(validContentView)
            }else {
                validContentView.frame = CGRect(x: 0, y: 0, width: validContentView.bounds.size.width, height: self.bounds.size.height)
            }
        }
    }

    //如果你的contentView的内容在初始化的时候，无法确定。需要通过网络等延迟获取，那么在内容赋值之后，在调用该方法即可。
    public func reloadData() {
        self.setNeedsLayout()
    }

    fileprivate func startMarquee() {
        self.stopMarquee()

        if marqueeType == .right {
            var frame = self.boxView.frame
            frame.origin.x = self.bounds.size.width - frame.size.width
            self.boxView.frame = frame
        }

        self.marqueeDisplayLink = CADisplayLink.init(target: self, selector: #selector(processMarquee))
        self.marqueeDisplayLink?.frameInterval = self.frameInterval
        self.marqueeDisplayLink?.add(to: RunLoop.main, forMode: RunLoop.Mode.common)
    }

   fileprivate  func stopMarquee()  {
        self.marqueeDisplayLink?.invalidate()
        self.marqueeDisplayLink = nil
    }

    @objc fileprivate func processMarquee() {
        var frame = self.boxView.frame

        switch marqueeType {
        case .left:
            let targetX = -(self.contentView!.bounds.size.width + self.contentMargin)
            if frame.origin.x <= targetX {
                frame.origin.x = 0
                self.boxView.frame = frame
            }else {
                frame.origin.x -= pointsPerFrame
                if frame.origin.x < targetX {
                    frame.origin.x = targetX
                }
                self.boxView.frame = frame
            }
        case .right:
            let targetX = self.bounds.size.width - self.contentView!.bounds.size.width
            if frame.origin.x >= targetX {
                frame.origin.x = self.bounds.size.width - self.boxView.bounds.size.width
                self.boxView.frame = frame
            }else {
                frame.origin.x += pointsPerFrame
                if frame.origin.x > targetX {
                    frame.origin.x = targetX
                }
                self.boxView.frame = frame
            }
        case .reverse:
            if isReversing {
                let targetX: CGFloat = 0
                if frame.origin.x > targetX {
                    frame.origin.x = 0
                    self.boxView.frame = frame
                    isReversing = false
                }else {
                    frame.origin.x += pointsPerFrame
                    if frame.origin.x > 0 {
                        frame.origin.x = 0
                        isReversing = false
                    }
                    self.boxView.frame = frame
                }
            }else {
                let targetX = self.bounds.size.width - self.boxView.bounds.size.width
                if frame.origin.x <= targetX {
                    isReversing = true
                }else {
                    frame.origin.x -= pointsPerFrame
                    if frame.origin.x < targetX {
                        frame.origin.x = targetX
                        isReversing = true
                    }
                    self.boxView.frame = frame
                }
            }
        }

    }

}

/*
 关于CADisplayLink的笔记
 https://snail-z.github.io/2017/03/17/CADisplayLink学习笔记/
 
 CADisplayLink相当于一个定时器，比起NSTimer，它可以确保系统渲染每一帧的时候我们的方法都被调用，从而保证了动画的流畅性。
 iOS设备的屏幕刷新频率是固定的，CADisplayLink在正常情况下会在每次刷新结束都被调用，精确度相当高。NSTimer的精确度相对显得较低；CADisplayLink使用场合相对专一，适合做UI的不停重绘，比如自定义动画引擎或者视频播放的渲染。NSTimer的使用范围要广泛的多，各种需要单次或者循环定时处理的任务都可以使用。

 相关属性

 preferredFramesPerSecond （iOS10用这个方法）
 标识每秒钟调用几次，比如每秒钟调用10次，那就是每0.1秒调用一次
 frameInterval（ios10被弃用）
 标识间隔多少帧调用一次selector方法。
 CADisplayLink的selector每秒调用次数 = 60 / frameInterval。
 苹果文档中还提到：如果应用不能及时提供显示帧，则应该降低帧率，可以通过增大 frameInterval 这一属性的值来降低动画帧率。frameInterval 默认值为 1，表示每帧都回调一次selector。在没有卡顿时，iOS 设备屏幕显示每秒刷新60次，意味着 frameInterval 为默认值时，每秒回调60次 selector，当frameInterval 改为2时，每秒回调30（60/2）次 selector。
 duration
 只读的CFTimeInterval值，提供每帧之间的时间，也就是屏幕每次刷新的时间。
 timestamp
 只读的CFTimeInterval值，表示屏幕显示的上一帧的时间戳，这个属性通常被target用来计算下一帧中应该显示的内容。
 paused
 通过设置paused属性为YES可以暂停selector调用，默认值NO
 注: CADisplayLink是不能被继承的

 使用CADisplayLink

 在应用中创建一个新的CADisplayLink 对象，把它添加到一个runloop中，并给他提供一个 target和select在屏幕刷新的时候调用。如下：

 - (void)startDisplayLink {
     if (self.displayLink == nil) {
         self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateLayout)];
         [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
     }
 }
 - (void)stopDisplayLink {
     // 结束一个CADisplayLink，应该调用 - invalidate 从runloop中删除并删除之前绑定的 target跟selector
     [self.displayLink invalidate];
     self.displayLink = nil;
 }
 -(void)updateLayout {
     // do something
 }
 CADisplaylink 与 NSTimer 类似，都可以以一定的时间间隔触发回调 selector，不同点在于 CADisplaylink 的时间间隔是与屏幕的刷新频率相关联的，这一点决定了 CADisplaylink 的应用多与显示有关。

 相关问题

 当scrollview / tableview滚动时CADisplayLink停止响应。
 要解决这个问题需要简单了解一下runloop的知识，runloop可以理解为cocoa下的一种消息循环机制，用来处理各种消息事件，我们在开发的时候并不需要手动去创建一个runloop，因为框架为我们创建了一个默认的runloop，通过[NSRunloop currentRunloop]可以得到一个当前线程下对应的runloop对象，不过需要注意的是不同的runloop之间消息的通知方式。在开启一个NSTimer或CADisplayLink实质上是在当前的runloop中注册了一个新的事件源，而当scrollView滚动的时候，当前的MainRunLoop是处于UITrackingRunLoopMode的模式下，在这个模式下是不会处理NSDefaultRunLoopMode的消息(因为RunLoop Mode不一样)，要想在scrollView滚动的同时也接受其它runloop的消息，就不能将Mode参数设置为NSDefaultRunLoopMode，而应该设置为NSRunLoopCommonModes。
 */
