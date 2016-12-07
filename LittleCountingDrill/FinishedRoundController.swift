//
//  FinishedRoundController.swift
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

import Foundation
import UIKit

class FinishedRoundController: UIViewController {
  var correct = 0, incorrect = 0, total = 0
  var exercises: Exercises?

  @IBOutlet weak var correctLabel: UILabel!
  @IBOutlet weak var incorrectLabel: UILabel!
  @IBOutlet weak var totalLabel: UILabel!

  @IBAction func doRerun(_ sender: Any) {
    self.performSegue(withIdentifier: "rerunSegue",
                      sender:nil)
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if(segue.identifier == "rerunSegue") {
      let qController = (segue.destination as! QuestionController)
      qController.exercises = self.exercises!.clone()
    }
  }

  override func viewWillAppear(_ animated: Bool) {
    self.correctLabel.text = "\(self.exercises!.correct) rätt"
    self.incorrectLabel.text = "\(self.exercises!.incorrect) fel"
    self.totalLabel.text = String(self.exercises!.amount)
  }
}
