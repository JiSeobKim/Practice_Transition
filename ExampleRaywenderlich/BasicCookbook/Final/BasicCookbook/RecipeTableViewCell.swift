/// Copyright (c) 2019 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit

// MARK: - UITableViewCell

class RecipeTableViewCell: UITableViewCell {
  @IBOutlet var shadowView: UIView!
  @IBOutlet var containerView: UIView!
  @IBOutlet var recipeImageView: UIImageView!
  @IBOutlet var nameLabel: UILabel!
  
  var recipe: Recipe? {
    didSet {
      recipeImageView.image = recipe?.image
      nameLabel.text = recipe?.name
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    shadowView.layer.backgroundColor = UIColor.clear.cgColor
    shadowView.layer.shadowColor = UIColor.black.cgColor
    shadowView.layer.shadowOffset = CGSize(width: 0, height: 2.5)
    shadowView.layer.shadowOpacity = 0.2
    shadowView.layer.shadowRadius = 10
    
    containerView.backgroundColor = .white
    containerView.layer.cornerRadius = 15.0
    containerView.layer.masksToBounds = true
  }
}

// MARK: - Bounce Animation

extension RecipeTableViewCell {
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    animate(isHighlighted: true)
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesEnded(touches, with: event)
    animate(isHighlighted: false)
  }
  
  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesCancelled(touches, with: event)
    animate(isHighlighted: false)
  }
  
  private func animate(isHighlighted: Bool, completion: ((Bool) -> Void)? = nil) {
    let animationOptions: UIView.AnimationOptions = [.allowUserInteraction]
    if isHighlighted {
      UIView.animate(
        withDuration: 0.5,
        delay: 0,
        usingSpringWithDamping: 1,
        initialSpringVelocity: 0,
        options: animationOptions, animations: {
          self.transform = .init(scaleX: 0.95, y: 0.95)
      }, completion: completion)
    } else {
      UIView.animate(
        withDuration: 0.5,
        delay: 0,
        usingSpringWithDamping: 1,
        initialSpringVelocity: 0,
        options: animationOptions, animations: {
          self.transform = .identity
      }, completion: completion)
    }
  }
}
