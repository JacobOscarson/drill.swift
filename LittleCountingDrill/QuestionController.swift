//
//  QuestionController.swift
//  LittleCountingDrill
//
//  Created by Jacob Oscarson on 2016-12-07.
//
// MIT License
//
// Copyright (c) 2016 Jacob Oscarson

// Permission is hereby granted, free of charge, to any person
// obtaining a copy of this software and associated documentation
// files (the "Software"), to deal in the Software without
// restriction, including without limitation the rights to use, copy,
// modify, merge, publish, distribute, sublicense, and/or sell copies
// of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
// BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
// ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import UIKit

class QuestionController: UIViewController {
  var exercises : Exercises?
  var answer = -1
  var correct = 0, incorrect = 0

  @IBOutlet weak var aLabel: UILabel!
  @IBOutlet weak var bLabel: UILabel!
  @IBOutlet weak var signLabel: UILabel!
  @IBOutlet weak var answerField: UITextField!
  @IBOutlet weak var correctsLabel: UILabel!
  @IBOutlet weak var incorrectsLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func viewWillAppear(_ animated: Bool) {
    self.advance()
  }

  func advance() {
    if self.exercises!.remaining > 0 {
      (self.aLabel.text!, self.bLabel.text!, self.signLabel.text!,
       self.answer) = self.exercises!.next()!
    } else {
      NSLog("TBD: FINISH")
    }
    self.renderState()
    self.answerField.becomeFirstResponder()
  }

  func renderState() {
    (self.correctsLabel.text, self.incorrectsLabel.text,
     self.answerField.text) = ("\(self.correct) rätt",
                               "\(self.incorrect) fel",
                               "")
  }

  @IBAction func gotAnswer(_ sender: Any) {
    if self.answerField.text != "" {
      self.takeAnswer(Int(self.answerField!.text!)!)
    }
  }

  func takeAnswer(_ answer: Int) {
    if answer == self.answer {
      self.wasCorrect()
    } else {
      self.wasIncorrect()
    }
    self.renderState()
    self.advance()
  }

  func wasCorrect() {
    self.correct += 1
    self.performSegue(withIdentifier: "correctSegue", sender: nil)
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if(segue.identifier == "incorrectSegue") {
      let wrongCtrl = (segue.destination as! IncorrectController)
      let (a, sign, b) = (self.aLabel.text!,
                          self.signLabel.text!,
                          self.bLabel.text!)
      wrongCtrl.expression = "\(a) \(sign) \(b) = "
      wrongCtrl.answer = String(self.answer)
    }
  }

  func wasIncorrect() {
    self.incorrect += 1
    self.performSegue(withIdentifier: "incorrectSegue", sender: nil)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}
