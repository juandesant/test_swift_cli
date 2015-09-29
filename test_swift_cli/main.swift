//
//  main.swift
//  test_swift_cli
//
//  Created by Santander-Vela, Juande on 17/09/2015.
//  Copyright © 2015 Santander-Vela, Juande. All rights reserved.
//

import Foundation

var arguments = Process.arguments.generate()
var flagA = false
var valB: Int = 0

while let arg = arguments.next() {
    print("Parsing \(arg)")
    switch arg {
        case "-a":
            flagA = !flagA
        case "-b":
            print("Getting value for -b")
            let valBarg = arguments.next()
            valB = Int(valBarg!)!
            print("Setting \(valBarg)")
        default:
            continue;
    }
}

for pArg in Process.arguments {
    print(pArg)
}

if flagA {
    print("Flag A was set")
} else {
    print("Flag A was not set")
}

if valB != 0 {
    print("B was set as \(valB)")
}