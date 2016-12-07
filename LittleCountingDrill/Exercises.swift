//
//  Exercises.swift
//  LittleCountingDrill
//
//  Created by Jacob Oscarson on 2016-12-06.
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

class Exercises : Sequence, IteratorProtocol {
  // Could have conceptually benefited from generators

  var amount: Int
  var remaining: Int = 10
  var harder: Bool = false

  init(_ amount:Int, preferHard: Bool) {
    (self.amount, self.remaining) = (amount, amount)
    self.harder = preferHard
  }

  func clone() -> Exercises {
    return Exercises(self.amount, preferHard: self.harder)
  }

  func randint(start: Int, to end: Int) -> Int {
    return Int(arc4random_uniform(UInt32(end - start + 1))) + start
  }

  func next() -> (String,String,String,Int)? {
    func val() -> Int { return self.randint(start: 1, to: 15) }
    func coin() -> Bool { return Bool(self.randint(start: 0, to: 1) == 1) }

    if remaining == 0 {
      return nil
    } else {
      defer { remaining -= 1 }

      var (a,b) = (val(), val())
      var difficulty = [true, true]
      if self.harder {
        let subtract = coin()
        difficulty = [subtract, subtract]
      } else {
        difficulty = [coin(), coin()]
      }

      var sign: String, answer: Int
      if a - b > 0 && difficulty[0] {
        sign = "-"
        answer = a - b
      } else if b - a > 0 && difficulty[1] {
        sign = "-"
        swap(&a, &b)
        answer = a - b
      } else {
        sign = "+"
        if coin() {
          swap(&a, &b)
        }
        answer = a + b
      }

      return (String(a), String(b), sign, answer)
    }
  }
}
