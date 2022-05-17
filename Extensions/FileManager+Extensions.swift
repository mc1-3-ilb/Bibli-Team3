//
//  FileManager+Extensions.swift
//  mvvm-team03
//
//  Created by Nadia Ramadhani on 16/05/22.
//
import UIKit

let fileName = ""

extension FileManager {
    static var docDirURL: URL {
        return Self.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    func docExist(named docName: String) -> Bool {
        fileExists(atPath: Self.docDirURL.appendingPathComponent(docName).path)
    }
}
