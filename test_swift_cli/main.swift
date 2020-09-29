//
//  main.swift
//  test_swift_cli
//
//  Created by Santander-Vela, Juande on 17/09/2015.
//  Copyright © 2015 Santander-Vela, Juande. All rights reserved.
//

import Foundation
// 456789012345678901234567890123456789012345678901234567890123456789012
// Create a generator from Process.arguments, so that we can use it 
// inside the `while` loop, for obtaining the next argument for flags
// that provide a value
var arguments = CommandLine.arguments.makeIterator()

// We will use flagA as a flip-flop flag, and valB as an integer value
var flagA = false
var valB: Int = 0

// We use `while let arg` so that the while ends when there are no more
// arguments
while let arg = arguments.next() {
    print("Parsing \(arg)") // to see the process in the while loop
    switch arg {
        // we can use comparisons because the while let ensures
        // that arg is set, and cannot be nil
        case "-a":
            // we negate the value of flagA for each
            // occurence of -a as an argument
            flagA = !flagA
        case "-b":
            // In the case of the -b flag, we want
            // the value. We could check if -b was used 
            // before, but in this case the last value wins
            print("Getting value for -b")
            let valBarg = arguments.next()
            valB = Int(valBarg!)!
            print("Setting \(String(describing: valBarg))")
        default:
            // We hit this case for non understandable values
            // We could choose to exit instead.
            print("Argument \(arg) not processed")
            continue;
    }
}

// List all arguments (including the tool path, which will be the first argument)
for pArg in CommandLine.arguments {
    print(pArg)
}

// Show one message or the other
if flagA {
    print("Flag A was set")
} else {
    print("Flag A was not set")
}

// If valB is not 0, it was set
if valB != 0 {
    print("B was set as \(valB)")
}
