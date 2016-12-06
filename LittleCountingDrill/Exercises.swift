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
  // Would could have conceptually benefited from generators

  var remaining: Int = 10
  var shouldPreferSub: Bool = false

  init(_ amount:Int, preferSub: Bool) {
    self.remaining = amount
    self.shouldPreferSub = preferSub
  }

  func next() -> (String,String,String,Int)? {
    if remaining == 0 {
      return nil
    } else {
      defer { remaining -= 1 }
      return ("a", "b", "+", 10)
    }
  }
}
