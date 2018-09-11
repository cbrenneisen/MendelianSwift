//
//  BioSequence.swift
//  BioSwift
//
//  Created by Carlos Brenneisen on 01/30/17.
//  Copyright © 2017 CarlosBrenneisen. All rights reserved.

import Foundation

public protocol BioSequence: Hashable {

    associatedtype Base: Nucleobase
    
    var sequence: [Base] { get }
    var sequenceString: String { get }
    
    var id: String? { get set }

    init(id: String?, sequence: [Base])
}

// MARK: - Hashable Conformance
public extension BioSequence {
    
    /**
     The hash value of the sequence
    */
    public var hashValue: Int {
        return sequenceString.hashValue
    }
    
    public static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.sequenceString == rhs.sequenceString
    }
}

//MARK: - Initializers
public extension BioSequence {
    
    /**
     Create a new sequence object
     - parameter sequence: a series of valid elements that make up the sequence
     */
    public init(sequence: [Base]) {
        self.init(id: nil, sequence: sequence)
    }
    
    //MARK: Failable
    
    /**
     Create a sequence from a raw string. Returns nil if the string is invalid
     - parameter id: the idenfitifer of the sequence
     - parameter sequence: the series of characters representing the sequence
     */
    public init?(id: String?, sequence: String) {
        guard let seq = Base.sequence(from: sequence) else {
            return nil
        }
        
        self.init(id: id, sequence: seq)
    }
    
    /**
     Create a sequence from a raw string. Returns nil if the string is invalid
     - parameter sequence: the series of characters representing the sequence
     */
    public init?(sequence: String){
        self.init(id: nil, sequence: sequence)
    }
    
    /**
     Create a sequence from a raw text file
     - parameter contentsOfFile: The path of the file
    */
    public init?(contentsOfFile file: String){
        
        //let bundle = Bundle.main
        let path = Bundle.main.path(forResource: file, ofType: "txt")!
        
        guard let string = String(fromFile: path) else{
            print("Error creating sequence from file \(file)")
            return nil
        }
        self.init(id: nil, sequence: string)
    }
}

//MARK: - Subscripts
public extension BioSequence {
    
    /**
     Returns the base at the given position
     - parameter index: the position of the desired base
     */
    subscript (index: Int) -> Base {
        return sequence[index]
    }
    
    /**
     Returns the bases at the specified range
     - parameter range: the range specifying the desired indices
     */
    subscript (range: CountableRange<Int>) -> [Base] {
        return Array(sequence[range.lowerBound..<range.upperBound])
    }
}

//MARK: - Computed Properties
public extension BioSequence {
    
    /**
     Raw string value of the sequence
    */
    public var sequenceString: String {
        return sequence.map{ $0.string }.reduce("", +)
    }
    
    /**
     The length of the sequence
    */
    public var length: Int {
        return self.sequence.count
    }
    
    /**
     Returns the count of all bases in the DNA object
     */
    public var baseCount: [Base: Int] {
        return sequence.reduce(into: [Base: Int]()){
            $0[$1, default: 0] += 1
        }
    }
}

//MARK: - Functions
public extension BioSequence {
    
    /**
        Returns the starting index of all instances of the sub sequence
    */
    public func motifs(of subSeq: Self) -> [Int] {
        var locations: [Int] = []
        
        (0...(length-1)-subSeq.length).forEach(){ i in
    
            var match = true
            
            for (j, base2) in subSeq.sequence.enumerated() {
                // - make sure the bases are equal
                guard self[i+j] == base2 else {
                    match = false
                    break
                }
            }
            if match {
                locations.append(i)
            }
        }
        return locations
    }
    
//
//    //returns the subsequence starting with 'start' and ending with (and including) 'end'
//    public func getSubSequence(start: Int, end: Int) -> String {
//        let range = Range(start...end)
//        let startIndex = index(from: range.lowerBound)
//        let endIndex = index(from: range.upperBound)
//        return String(self.sequenceString[startIndex..<endIndex])
//    }

//    //helper function for the above
//    private func index(from: Int) -> String.Index {
//        return self.sequenceString.index(self.sequenceString.startIndex, offsetBy: from)
//    }
    
    /**
     
    */
    public static func isValid(sequence: String) -> Bool {
        // go through every character and confirm that they can be converted
        for letter in sequence {
            if Base(from: letter) == nil {
                return false
            }
        }
        return true
    }
}


