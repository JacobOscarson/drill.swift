# drill.swift

This iOS-app is a (fairly) direct port of a Python arithmetic program
I'm using to train my children in smaller numbers arithmetics (
[see here](https://github.com/JacobOscarson/wax-on-wax-off)).

It also serves the dual purpose as a work sample of my Swift coding
skills ;-)

Since it's targeted at my children (age 9 now), it's UI is in
Swedish:

   - _Antal övningar_ = number of exercises
   - _Mer subtraktion_ = higher amount of subtraction
   - _rätt_ = correct
   - _fel_ = incorrect
   - _Träna en gång till_ = same exercises again
   - _Träna på ett annat sätt_ = return to initial config screen

## Installation

It has no dependencies so running should be easy as long as you are
happy to watch it run in the simulator.

Ensure you have the latest XCode installed, then check out the project
from Git. Open the project `LittleCountingDrill.xcodeproj` in XCode
and run. Since this is an example project, I haven't bothered that
much with getting all device layouts completely right, so, for now,
I'd suggest you choose "iPhone SE" as your target device. I'll see if
I can be bothered in the future to tweak the Auto Layout settings a
little bit more and maybe just maybe I'll give it icons and release it
on the App Store.

Oviously, the same goes for i18n.
