//
//  FastaServiceTests.swift
//  MendelianSwift
//
//  Created by Carlos Brenneisen on 3/4/17.
//  Copyright © 2017 carlosbrenneisen. All rights reserved.
//

import XCTest
@testable import MendelianSwift

class FastaServiceTests: XCTestCase {
    
    var fasta1Sequences: [String] = []
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    
        let dna1 = "CGTAGTCTTGAAAGTTGCCTTTAGAAGCGCATTCATGAGTGGTGGCTCCCACGTCAATTT" +
                   "TGCAAGCGACGTGGAGGGTGATAGGTCGCCGAGGATCTACAACACTTCTCATAATATTAA" +
                   "CGGCCCGCATCCTAGAGCCTTCGATGCTCACGTTAAATAGGAGCGTCAATCTAGAGGCGG" +
                   "TAAGCGCGCAACCAGCATTCAGGCTTATCGTAGTACTCTAGTATAGCTCGTCGATCTCGT" +
                   "AGCGATTCCTTAGGCGGCTGGCCACCCGAATGGCCCTTTAGTGCTTTGGGCGTCATTACG" +
                   "GTAACAAAGGGTGGGACGTTAATACCCCATGTCCAGCTTGTGATCTATGCCGTAGATAGA" +
                   "ACAAACTTGAGTCTGGAAAGTACCCCCCTGTTTCTATGAAAATGGGGTAGGAATACGTAA" +
                   "AGTATAGACCATAGTCACTCCGATAATTATCATAGCAGTCGTAACACGGTGTACGACGCT" +
                   "CCTCAGTACTATAGTGTCACGCTCATGACGCATGAAACAACTCTGCTCGCCACTAGCATC" +
                   "ACCGGCGTGCCAACGGGATACGTTATTTCTAACAGACTTCTGACCCGCTAGCTTCTCGCT" +
                   "ACATCGTCCCCTGTGGAAAGCGGCGTGCACTATGCACCTAGCCAATTAGCGAAACCTAAC" +
                   "AGGTTAACTTAGACTACTACCTTCCAGCGCCAATATAAACTTGCGCTCATACACACACAC" +
                   "AGTTTTCAGGAATGTTCCGCCCTTCTGTGTTGAACCGAAAAGGGAAACAAATCAGGTAAG" +
                   "GTGACCAGTAGGAAGTCACTTGCCAG"
        fasta1Sequences.append(dna1)

        let dna2 = "TTAATCCACATCTATCGAAGGCTCTTACTCTGCGGTTAGAGCCGTATTTACGCTGGGCCG" +
                   "AAAGGTAAACTTTGGTAATCACAGCTGTGTGTAACCGGCAGCTTCTGGTCACCGTCCACG" +
                   "CATCTTCGTATTACACGGAGGTTGACGTGGTAGATATCCTCCGCTTAAGGCGACAGCCCG" +
                   "GGTCATCGGGGTTTAAACAACCGAAACATCGGGCGCGCGTTGACTCCGCCTGTTTTTCCT" +
                   "CGCTTGATTCATCCTCAGTCGTGTCCAAAGGCGGATGCCGCTAAGCGAGGCACACAGGGT" +
                   "CGATGCCTATTTATGGCACCGCATGCAATCATCAGGCCTGATGAGGGATACGGAGAAGAC" +
                   "ACATAGACATACTGCAGGTGCCGAACGTCGCGGTACATGCCTGGTGGTGACCGTCGATGT" +
                   "GGGTGTCCCTCATTCGGAAGGCCGGCTTTAAGGGGCTGTGGGTAAGGATGTGCACAATCA" +
                   "CAGTTTTAGTTGCGCCTGGACAAAGCGCGACCAAGAGTACTTTGTGATTATCAGGAGTAG" +
                   "AGGCTTTCTATTATTGCTTGTACTCCCCAAAAAGCTTCATACGTGTAGGCCGCCTGAGTC" +
                   "TTACGTAGGGTAACGCGTTGATGTCATTTGGATCAGTGTGAGGTATATCGTAAGGAGCTG" +
                   "CTCAAACTGCACCCCTGTCCATTCGCGAGGCCTTTTCGCGAGGGGCCTGCCTTATCACGC" +
                   "TATGCGTAGACTCCTGCCTGGTAGCGCCAGACGCATAAAATATCGAAGCCTCGTTAAGAG" +
                   "TCGCCTGTCGTCCGCCGGCTAGTAGCGGCACACCTGTCCTACTAGGTAAGCATTCCTCCA" +
                   "CGCTGCGTGGTCCACTGTTCAGTTTCTCGGCAAATAACCTAGTTTACACCTAAACCCTTC" +
                   "TAAACATGATACCCCATCAACTCATAAGTTTCCGGGTCCGCGATCCATCGTAGACTTAAC" +
                   "TATTGCGCGTTTGAGATACCCAATTGA"
        fasta1Sequences.append(dna2)
      
        let dna3 = "AGGCTTTTGGTCTGGTGCTCGGTGGCATTATCCATCAGAGAGAGAGATAAGGGGCGCGTA" +
                   "CCGAGGGATTCAGTATCTAAACGTTGTCCAACGACACTGAGAAGAGTAACGGCCTTTGGG" +
                   "CCTGACCGGTATGCCGCCTTTGACCACTCGCGACTACGTAATGGTGCGATAGGTCCTAAC" +
                   "GTGGTGGGCTAAACACATTGGATCTGATGACATTTAGGTGATTGGGGATGGATCCGCATC" +
                   "TTTAGCGACAGCCAGTTCAGCCTGCAACCCTCCCGACGCATCCTCAGAGACACGTGAACC" +
                   "TTCAACCGTAAGAAGCGTGCCAGCGATACACGGTACCGATATGTGCGCTATACCTTCACG" +
                   "CTATTAGCTCATATAGACTGGTCGGTTTGTTAAAGCATGAAACTTCTGCGGGTTAGGGCA" +
                   "AGGCCGCGCGTCGCAAGCTAGGTCCATCCTGGAAAACACCACGCAATCAACAACGTATGA" +
                   "TCAGATCACGCAGACTCCCCTATCTTCACCAAGGGTGAAGCTGGTTGTCCATAGGATCGA" +
                   "AAGGATTACGGTCTACTCCGTTCTTATGCCGAAATCTTGCATGCGAGCGATAGAGTTCGC" +
                   "CTACCAACAGTGGTAGACGGAACCGCCCGGGCCTTCATATGCTCCCTCAATTCTATATTG" +
                   "ACAATTGGGACAGTTTCAATCATAAAGGTAGCCCCGCTGTGCATTGCACAAGGCTGGATT" +
                   "TAGCATCGTCGTGGGGAGGTTCTCTGTATGCTTTTATAAGTTGCACTGGCAGCATGTAGA" +
                   "CACTACTCTAATAACATCAAGCATAACGACGGGTAAGACCTGGAAGTGGATCGAAAGGCA" +
                   "TGTTCGTTCACCG"
        fasta1Sequences.append(dna3)
        
        let dna4 = "CTTCCTTATCGAGGTAACGGGACTTAACACATACTTACGAGTTACGATCGCACTAGGCAT" +
                   "AGAACTACCACTATTAACCTACAAGTATAGGGTTCGTGCCGGAGCCTCAAAGAGTCAATC" +
                   "TTCTTATTTAAAGTCATCGAAGCTGCACGATCCTCATGCACGGCACATTCGTCGTGGGCC" +
                   "TTACCGCATTAGATGGGCGCACGCGTAGATATCATCAAGATGTAGGGATCGTACTGGCAG" +
                   "GGTCATGTACAGGTAGCAATGAATAAACACAGTCAGAGCTAGACGATGGTGTAATTTCCC" +
                   "ACCGTACTTCCCGGGTCTGCGTGAAGGCCCTATAACCCTCTACTGGAATACACCACTAGT" +
                   "TGGTCAAGGCATCCCATGCATATCCCTACTCGAAAATCTGTGTACTCGCATCGTTACATT" +
                   "TCACCTGAATGGCTCTCAATTACGGTGTGAGGTACCCGCTCGCAGTTTGAGGACAATATC" +
                   "CTCTGATTGACCAATTCAGTTTGAAGATGAACGGCGATAGGAGTCTAGCAATCCCGGCGA" +
                   "TCGCTGCTGGTTTTCGGCTCTGAAACCGTTGTACAATAGCCTTTTACTGAAGCCGCCTGT" +
                   "AATCAAACATCATACTTTGCACATGTCTCCCCTTTTTTGCTTGGCCGTTTGAGACCCGCC" +
                   "GCACTATAGTTCAGTCTCAAGGTCCAGTGCACGTGGTGATTCGTGCTCACCCTTAGTTGG" +
                   "CTGCTTTGTAACGCTCTGGAGTCGTCCCGGCCCGTTTGAGACCGGCTTAACTAGTTTTTC" +
                   "TCATGCATCTTTAGACCTTTGAAAGAAGTCACCTCTTTTCTTGTCTAGTATAAAGGGGAT" +
                   "CAAGTCTCAAGGATGGCATTTCAAGAGAACGCCGTTTCAGGTCCGGTTGACAAGCCGCAA" +
                   "TCAACGACGGCACGCGGTCCGCTGATACTTCGGAT"
        fasta1Sequences.append(dna4)
        
        let dna5 = "CAAAGGCGCCGCATCATTTACCATATATGAGTTCAGCTTGCTACCGCTTTTAAGCCTCCT" +
                   "TAATCGTTCATTCCAGCGAACAGCTGTCGTCTTTGTTTCAGCCGCGTCAGAGATGGCTGT" +
                   "ACGCTACCTATAGTGCCACAGAACTAACGTTTATAGCATACATCTCGTGCTGTATATATT" +
                   "GGGGGAAGCCAGACTTCCGGAAAATGCAATAGTCTGAACCACCGGGTGTCCAAGGGCCTC" +
                   "ACCATTTGGAGACCATTCAGCGTTTAACATGATCTTGTCAAGGGCGCTTTCTTCAGGCTA" +
                   "AATATATTCCGACAGTAGCATGAGGACAACCCCCGCAAAACAAAGTTCACTGGCGCGGAC" +
                   "GTGCAGATGTATGGGTGCAATATAGGGAGCGAGGGGGGGTGCACTTGTTCAGCTGTTTAC" +
                   "ACGATGGGGCGCGGTACCTTGCCCCCGATCGGAGAACACTTGATCGCAAGGTAGCGCTGC" +
                   "GTCGTCTTTATCCCTCATAAATAAACCGACGCGTTCCTAGTAGACTCGGTAGGCAAGCTT" +
                   "AGTGGGCACTATTACAACGTCCGATACAGGCCTGGCGGTCAATGTAGTTAGGACAGGCGA" +
                   "CCTACGACCCCCGTTAGTTTTGGGTGTCCGCCTTGTCCACGCCTAAAAATAAGTAGTTCA" +
                   "ATCGTTTAAGCGTACATAAGGCTGGAGACCACCCAACAAACTCCTCACCCACAGGAGGTG" +
                   "AACTGGTTGTCGGCGCCCGGACGAAAAGAGACCCGTAATGAAGTGGTCCCTTATCCAGCG" +
                   "CTACCAATAAGTATATATTAGCTAGCCGAGGCCGTGCGAAGCCTTGTGGGATGGTCTCAG" +
                   "TATTGAAGAGGCATTCTATGAATGTATCGTCTCTATCTTCAATGACGATCCAAGCGATGT" +
                   "GGGTGCGAAGAGATCATCCCCGGGTCGATCGACAAGGTTTGCACGTGCCAGATCATGGTT" +
                   "CGCTTTTCGCAAG"
        fasta1Sequences.append(dna5)

        let dna6 = "TGGGCTGTACATGATACTTATTTGCGATCTCGCGCATCTGACAGTTCCAGTGCACAGAAA" +
                   "CACCTCAGCTCTATGTAGTCTACCATCTCCACTTTCTGCCGGTAGATGTTGTGCTTTGTA" +
                   "GGCACATACCGCCTAGTAAAACCTCCCTACCGCATTTTAGGATGCATGTTGACTCAGGTC" +
                   "GGTTTGATCCACTCATTAGTTACCAATGCTTCAGGTATTTCTCCTTTAGTGTAACCTAGC" +
                   "TGGGTATTCAAAGAGCCATGTGCTCGTATTACTTGTTCCATCTAGTAATTCTCGAGGCGA" +
                   "CTCTATAGACTACGGGAGGATTTGCAGCCATGGTGAACTCTCGAGCAATTAATTATACTT" +
                   "AGTGTGTTCGAGAGAGGGCAGACTCAACCCTGACGTGCATAAACAGTGGGATGCACCGTA" +
                   "CGGAACACAATATGGACCATTTTGTTTACTTAAAGGCTACTGCCGTTTCTGCATCTTACC" +
                   "CGTGTACGGCCGCAGACATTAGCCCTTGCGTCATGGGGACCCTATACTGGCGGTACTATC" +
                   "CCAGGAAATACATCCAGCTCTAGTATGTTCGAACAGTAACCTACTCTAAATACCTCTCAT" +
                   "GTTAACGCGTGTGTGTCACGTGGCTTCGGATGCTCGAACACCCCCTCGGGTCTGAAGCGG" +
                   "GGCGCGACTAGTTCGTCGCTCTCAATAAGGGCCGGTACTTTCCAGGATAGGGAAATCAGA" +
                   "TTTATTAATGCACCCGCCCTGGAAACAGTGCCTTAGTTATGCCGCTACTCCAAATCGACG" +
                   "TACGTCGCTCACACTCCACTAGTTTCATCGAATCGCCGCCTGAAACGGCCTCCAGTAAGA" +
                   "CTCGGACAGACGCACGGATCTAGGATGTCCTC"
        fasta1Sequences.append(dna6)
        
        let dna7 = "TGAGGCGCACGCGTGTGTGGGCTAGAGGTATCACTACGACAACTGGGATGGGAATCGCTC" +
                   "AGCCGCGTCTACATGTCCTGGTCAGATCAGACCGTCGTATCGGGCTGTGAACGAGTGTAA" +
                   "GAGGCACATATGACGCAGCATTATGACTCTCGGCCTCAATCCGCACACTTACACACATTA" +
                   "AAATGACCCACTTGAGCTTGTAGGGTGTGACACACGTGACGTTCGTGGACGTACAGCCGT" +
                   "AGAGACTGCAATGCGTTTAGTTCGTGTGGAGATCCTCTAGACCACTGGTGTCCGTACCTT" +
                   "CAGCTCGAAATTTCAGACTATTGCTCCTTGATGTGTAAAGGTTGGATCTGCAATCGAGAA" +
                   "TGACTAGATATCCAGGTATGATAGGCTTAGTTCCCATTCGTTCACCGATCTCGGGTAGTT" +
                   "ACTGGTGGAAAGTTAAAGGGTTTTCGCCGCAATGCAGCAGCTCAAACCAAAAACTCAATG" +
                   "CGGGCAGGGACGAAGACGGAGTATTAAACTCTCGCCACCGCAGATCCATGCCGCGTCGTC" +
                   "GTATCTGTAAGCTAATCCTGGATCTCGCATTACATAAATTTTTATTATCGATTAAGGTGC" +
                   "CTGAGGTTGGTGTTGAGGTCGCACTCCCACCACCCAGCTATTATCTGTACTGCAGAGAGG" +
                   "ATTTTCAAGCTAAAGGCATGTACGTTCGCAATTGAAGACAATTCTGGGGGCTGCCGTAGC" +
                   "CGATACGTTAATTCTGTCACATTAAGTATCTATTCGTATCCTCGGTGCATGGCTATATGG" +
                   "TGAGGCTTGGACACGTTTAATATTCCTGGCTCAAAC"
        fasta1Sequences.append(dna7)
        
        let dna8 = "ATTTTGGCGACCTAAGTTCGTGGGAATTAGCTTGTTGTCGGTGGTGGACGACGACATTCG" +
                   "TGGGTAGCTCTTCACCTGGAGATACAGGATTGTTTGCATAGGTAACACGAATATTCGAGT" +
                   "AACGGACCGCCGAGTAGCAACAAGCGGCACACGTGCCTCACGTGACACCGGTGACCTCGC" +
                   "CCGACCGTCCGTGCTGGATTTTTGAGAGTCCGTACGTGCAAGCTCTTATTGCCTCTACAC" +
                   "GCATCGCGCATTAGTTTATACACAGTAGTTCGAATGGGTCTACGAGTGCCAAAACCGCCA" +
                   "GCTGTCTCCTATGACAGCTACTATATATTCCCAATTACTGAAATAAGGTCCCCCACTATG" +
                   "CCATATCCGGCAGTAGATGCGAATCTGACATTAAGAATATGTTTACAGGTTGGAACACGC" +
                   "CATCCTGGTGGAGGCTTTACCAGCTCCGCGGGTACCCGGGGCATCCCTGGAATCAGTCGG" +
                   "CTGTTCATCCGTAGGCGTAACCCATTATGACTATTGCGCGCTGCATCGGAAGCTGGCGCC" +
                   "AAATTCACCCTCTTGTCTCCATTAGAGATTCAAACAATGGGACAGTAAAACCCTGCTTAG" +
                   "CCTTGTTGTGAGCTAACGAGTATCAAAACTTTGAGCGTGACTCTACCTTACACGCTTTCA" +
                   "CTTCGACGTTTCGCCTAATGCTCCCCGAAACTACCCCGTTGTTGAATACATATATGCCGC" +
                   "GTCTAGGAGGACGTAAAATAGGTCACTGGTCGAAATCCGAGGTCCTGTGGCTTGGCGGAT" +
                   "GAAATGAGGCGAACACTCTC"
        fasta1Sequences.append(dna8)
        
        let dna9 = "ATTCAGGCAGTATGATACCTCCCAGGTCTTTGTAATGTAGTATTTTGCTTGAGCCCTCGA" +
                   "CTGACTCTGGATATCGCAGTGCGGGGCACGAAGGGCTGGTCCGGTAGAAATCTGGTCTGT" +
                   "TCGGAGGCTGTAAACAACGGTTCGCCAGAGATAAGGGATGGATGCATCAAGATTCGAGGC" +
                   "CTGCTTAATTTTAAGACCCGGGGTCAAAACCCAAGCAGCTTGAAGGCCGTCGTCCCTCTA" +
                   "ATTCCGAGAAACCCGCCGCGCCCTGCGAACCCTCGTGAAATGCTGCTACGATTTGTCCAT" +
                   "TCGGAACAATTATACAAAACCTCCTCCAATAATGAATGTGGGAGACGGGACATTCGTGGC" +
                   "AATGCCGACGTAAGAACCCATCTTAACAACCAGCTATCTCGCACTCAAGTAGAATTGTAC" +
                   "CTCTAGAACGCTAAATGTAGAGGGGTATGGGGAGCTCTCGCCCGCTCGGGATAACTATAT" +
                   "TTACCAACCAACAGATTAGACCGCGTTTAGCTGGTTAAGGCGCACGAGGTTGAGGGTCTC" +
                   "GGGGCGCTAAGGCTGGCAACGGGAATACCGCAATTAAAGGGGGGCTATGAAGGCCGTCCT" +
                   "CGTAATCTCCGTCGTCACGACCTGCAACGAAGCAACAACATCTCCCACGTCCCGCAAAGG" +
                   "GCAGCGTGAAGGAAACCAACTATTCGGCCTACTTGACCGCCTTCATATCCGGGCACGTAC" +
                   "GGGTGGACATGACGTACACTTTGAATTTGTAGGATACCGCACCTCAGACTGCATGCCGTA" +
                   "TTGTTCACGATAGTGAAAACAGTAGTAAGTCTGGATTATACGTGGATTGAGATTTTGGCC" +
                   "TTAACTCTGTGCTAGGACTCGTACGAGAGCCAAGCCCTTCCACCCGTATCGGGTTGCGTC" +
                   "TGGTTACGATGTGCTGCACTCTAAACTAGCCGTGATACTTTTTT"
        fasta1Sequences.append(dna9)
        
        let dna10 = "TCGTAAGCGTAAGGTTTGCTGCAATGATGAATTGTGTCCGTGTTTGATAACGGGTGTTTC" +
                    "TAGGTCCCTGGCCCGTGATATACCAAGCTAAGGCTGAAAATATGCCCAAGCTCCAAGTCC" +
                    "CTTTGCACAGCTCATGGGTGCCGAGGTATAAAGCCCCAAGCGTCCGACAGTTGTCGGTCC" +
                    "GAACCGGTTTAATCGACGTCTTGCTATTAAGGCTAACCAGCAGTCGCCCCTATCCGTGAC" +
                    "TATGCCGTGGCTGATGCTGGCCTATCGTTGGGTCCTAGTCGTAGCTTTAGTTATCTTTCC" +
                    "ATGATATCACGCCGAATTGGTTCATCCTAGTGGTTCCAATGCCAGCAGGTTCGAGCATAT" +
                    "CTCAGCATACGTGTCGCGCTGCACAACTTCCAGGCGAAATGTATTTTCCCGGCAACCTTC" +
                    "GGGATAATCGCTTACGTGATGATATGGACCGCTGCACCGTCCCGACGGAGGATCCTCTTT" +
                    "CATGTTACACCCACAGGAATAGTCTTAATAATCCGGAGTCGTCCGAGGGGTATCAAATGA" +
                    "GGCCACTTCCAATTATCTTGCTGTAGGGCAGGGACAAACACAATGTTACCCTTCTTTAAA" +
                    "GGTTTACAAACCTCTATATCCCGGAGAAAACACTAGATAAAATGGTAACCTCGATCGAGA" +
                    "GTCCCAACAATCAACGTACCCACCGCCCGCTGTTGGAACTCTACGGTGATTACAGCCTTG" +
                    "TGCTTGTTATGCATGTCGTACACCCCCTTTTCAGCGATATGTCGAAGTTGAATGCATCCT" +
                    "TATTTTTCGCGATGTCAGGTACTTGACTACTCAGGAGCGAGCACGTTGTTATCAAATTTG" +
                    "GAGTTTACACTCCGCGGAACGACGCCTGTATAAGAAGCCAGAATAGCTAATGGCGGTATG" +
                    "CTGACGATAATTCTCGA"
        fasta1Sequences.append(dna10)

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
        fasta1Sequences.removeAll(keepingCapacity: false)
    }
    
    func testFastaLocal() {
        
        //make sure files are read properly
        do {
            
            let testBundle = Bundle(for: type(of: self))
            guard let filePath = testBundle.path(forResource: "fasta1", ofType: "txt") else{
                XCTFail("Invalid Fasta File Path")
                return
            }
            
            let allDNA = try FastaService.loadDNA(fastaFilePath: filePath)
            XCTAssertEqual(allDNA.count, fasta1Sequences.count, "Did not extract all DNA sequences")
            
            for i in 0...allDNA.count-1{
                XCTAssertEqual(fasta1Sequences[i], allDNA[i].sequenceString, "Mismatched DNA at index \(i)")
            }
        }catch let error {
            XCTFail(error.localizedDescription)
        }
        
        //TODO: make sure an error is thrown for incorrect file paths
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
