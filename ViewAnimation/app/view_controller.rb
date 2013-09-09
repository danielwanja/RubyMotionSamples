class ViewController < UIViewController

  def viewDidLoad
      # w = WhiteController.new
      # g = GreenController.new
      # b = BlueController.new

      # w.view.frame = [[0, 0], [200, 100]]
      # g.view.frame = [[0, 100], [100, 200]]
      # b.view.frame = [[0, 1000], [100, 200]]

      # self.addChildViewController(w)
      # self.addChildViewController(g)
      # self.addChildViewController(b)

      v1 = UIView.alloc.initWithFrame([[0, 0], [200, 100]])
      v1.backgroundColor = UIColor.redColor

      v2 = UIView.alloc.initWithFrame([[0, 0], [200, 100]])
      v2.backgroundColor = UIColor.blueColor

      v3 = UIView.alloc.initWithFrame([[0, 0], [200, 100]])
      v3.backgroundColor = UIColor.greenColor

      self.view << v1
      self.view << v2
      self.view << v3

      v2.delta_to([0, 100])
      v3.delta_to([0, 200])

      0.5.second.later do
        v1.shake
      end
      1.0.second.later do
        v2.shake
      end
      1.5.second.later do
        v3.shake
      end

      # v3.fade_out { |view|
      #   puts "removed:#{view}"
      #   # v3.removeFromSuperview
      # }



      # bar = UISegmentedControl.bar(["one", "ah-two-whoo", "thr-r-r-ree"])
      # self.view << ba1
      # self.view << ba2
      # self.view << bar
      # table = UITableView.alloc.initWithFrame([[0, 0], [200, 300]], style: :plain.uitableviewstyle)
      # self.view << table
      # table.shake offset: 20, repeat: 10, duration: 4, keypath: 'transform.translation.y'

      # bar.frame + SugarCube::CoreGraphics::Point(10, 200)
      # bar.shake

      # bar.delta_to([0, 320])

      # table.fade_out(0.5, delay: 0,
      #                   options: UIViewAnimationOptionCurveLinear,
      #                   opacity: 0.5) { |view|
      #   # view.removeFromSuperview
      # }
  end

  def shouldAutorotateToInterfaceOrientation(o)
    true
  end

end