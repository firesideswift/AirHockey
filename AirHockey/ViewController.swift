import UIKit

class ViewController: UIViewController {

    var animator: UIDynamicAnimator!
    var topSnapBehavior: UISnapBehavior?
    var bottomSnapBehavior: UISnapBehavior?

    @IBOutlet weak var centerLine: UIView!
    @IBOutlet weak var topHalf: UIView!
    @IBOutlet weak var bottomHalf: UIView!
    @IBOutlet weak var topGoal: UIView!
    @IBOutlet weak var bottomGoal: UIView!
    @IBOutlet weak var topPaddle: UIView!
    @IBOutlet weak var bottomPaddle: UIView!
    @IBOutlet weak var puck: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        animator = UIDynamicAnimator(referenceView: view)

        let collisionBehavior = UICollisionBehavior(items: [puck, topPaddle, bottomPaddle])
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collisionBehavior)
    }

    @IBAction func userPannedTopHalf(_ sender: UIPanGestureRecognizer) {
        if topSnapBehavior != nil {
            animator.removeBehavior(topSnapBehavior!)
        }

        switch sender.state {
        case .began, .changed:
            topSnapBehavior = UISnapBehavior(item: topPaddle, snapTo: sender.location(in: view))
            animator.addBehavior(topSnapBehavior!)
        default:
            break
        }
    }

    @IBAction func userPannedBottomHalf(_ sender: UIPanGestureRecognizer) {
        if bottomSnapBehavior != nil {
            animator.removeBehavior(bottomSnapBehavior!)
        }

        switch sender.state {
        case .began, .changed:
            bottomSnapBehavior = UISnapBehavior(item: bottomPaddle, snapTo: sender.location(in: view))
            animator.addBehavior(bottomSnapBehavior!)
        default:
            break
        }
    }
}

