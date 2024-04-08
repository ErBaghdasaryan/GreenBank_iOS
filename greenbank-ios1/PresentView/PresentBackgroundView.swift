//
//  PresentBackgroundView.swift
//  greenbank-ios1
//
//  Created by Hovo Ohanyan on 17.01.24.
//

import UIKit

final class BackgroundView: UIView {
    var cycleViewFirst = UIView()
    var cycleViewSecond = UIView()
    var cycleViewThird = UIView()
    var blurEffectView = UIVisualEffectView()
    
    init() {
        super.init(frame: .zero)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.backgroundColor = .white
        
        let colorFirst = UIColor(red: 0.42, green: 0.82, blue: 0.81, alpha: 1)
        let colorSecond = UIColor(red: 0.32, green: 0.84, blue: 0.62, alpha: 1)
        
        self.addSubview(cycleViewSecond)
        self.addSubview(cycleViewFirst)
        self.addSubview(cycleViewThird)
        
        cycleViewFirst.center.x = 100
        cycleViewFirst.center.y = 40
        cycleViewFirst.frame.size = CGSize(width: 160, height: 203)
        cycleViewFirst.backgroundColor = colorFirst
        cycleViewFirst.layer.cornerRadius = self.cycleViewFirst.frame.size.width / 2
        
        cycleViewSecond.center.x = 250
        cycleViewSecond.center.y = 400
        cycleViewSecond.frame.size = CGSize(width: 180, height: 220)
        cycleViewSecond.backgroundColor = colorSecond
        cycleViewSecond.layer.cornerRadius = self.cycleViewFirst.frame.size.width / 2
        
        cycleViewThird.center.x = 10
        cycleViewThird.center.y = 400
        cycleViewThird.frame.size = CGSize(width: 165, height: 210)
        cycleViewThird.backgroundColor = colorSecond
        cycleViewThird.layer.cornerRadius = self.cycleViewFirst.frame.size.width / 2
        
        addBlurEffect(to: self)
    }
    
    func addBlurEffect(to view: UIView) {
        // Create a UIBlurEffect
        let blurEffect = UIBlurEffect(style: .light) // You can use .extraLight, .dark, or .extraDark as well
        
        // Create a UIVisualEffectView with the blur effect
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        // Set the frame of the blur view to match the view you want to blur
        blurEffectView.frame = self.bounds
        
        // Add the blur view as a subview to the original view
        self.addSubview(blurEffectView)
    }
    
    func makeAnimation(width: Int, height: Int) {
        makeAnimationFirst(width: width, height: height)
        makeAnimationSecond(width: width, height: height)
        makeAnimationThird(width: width, height: height)
    }
    
    private func makeAnimationFirst(width: Int, height: Int) {
        let x = Int.random(in: 0...width / 2)
        let y = Int.random(in: 0...height / 2)
        
        UIView.animate(withDuration: 2.5) {
            self.cycleViewFirst.alpha = 1
            self.cycleViewFirst.center = CGPoint(x: x, y: y)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.makeAnimationFirst(width: width, height: width)
        }
    }
    
    private func makeAnimationSecond(width: Int, height: Int) {
        let deltaX = (width / 2) + ((width / 2) / 4)
        let deltaY = (height / 2) + (height / 2) / 2

        let x = Int.random(in: deltaX...width)
        let y = Int.random(in: deltaY...height)
        
        UIView.animate(withDuration: 2) {
            self.cycleViewSecond.alpha = 1
            self.cycleViewSecond.center = CGPoint(x: x, y: y)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            self.makeAnimationSecond(width: width, height: width)
        }
    }
    
    private func makeAnimationThird(width: Int, height: Int) {
        let deltaY = (height / 2) + (height / 2) / 2
        
        let x = Int.random(in: 0...width)
        let y = Int.random(in: deltaY...height)
        
        UIView.animate(withDuration: 7) {
            self.cycleViewThird.alpha = 1
            self.cycleViewThird.center = CGPoint(x: x, y: y)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
            self.makeAnimationThird(width: width, height: height)
        }
    }
}
