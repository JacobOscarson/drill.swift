//
//  IncorrectController.swift
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

class IncorrectController: AnswerController {
  var expression: String?, answer: String?

  @IBOutlet weak var expressionLabel: UILabel!
  @IBOutlet weak var answerLabel: UILabel!

  override func viewWillAppear(_ animated: Bool) {
    self.expressionLabel.text = self.expression
    self.answerLabel.text = self.answer
  }

  override func viewDidAppear(_ animated: Bool) {
    self.queueContinuation(4)
    // DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: {
        // self.navigationController?.popViewController(animated: true)
        // Put your code which should be executed with a delay here
    // })
  }
}
