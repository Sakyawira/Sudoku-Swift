//
//  main.swift
//  Sudoku
//
//  Created by Sakyawira Ruslim on 6/03/20.
//  Copyright © 2020 Sakyawira Ruslim. All rights reserved.
//

import Foundation

var sudoku = Sudoku();

// sudoku.generate_solvable_grid();

print("Do you want to make your own grid?");
print("0 :  No, 1 : Yes");

if (readLine() == "0")
{
    print("Randomizing board...");
}
    
else
{
    var continue_s : String? = nil;
    repeat{
        print("Input the column you want to change");
        
        // Row
        var row : Int = 0;
        if let irow = Int(readLine()!){
            print(irow);
            row = irow;
        }
        else{
            print("Please input a number between 0 - 8 !");
            continue_s = nil;
            continue;
        }
        
        // Column
        var column : Int = 0;
        if let icolumn = Int(readLine()!){
            print(icolumn);
            column = icolumn;
        }
        else{
            print("Please input a number between 0 - 8 !");
            continue_s = nil;
            continue;
        }
        
        // Num
        var number : Int = 0;
        if let inumber = Int(readLine()!){
            print(inumber);
            number = inumber;
        }
        else{
            print("Please input a number between 0 - 8 !");
            continue_s = nil;
            continue;
        }
        
        if (sudoku.set_grid(Row: row, Col: column, Num: number))
        {
            print("Worked!");
        }
        else{
            continue_s = nil;
            continue;
        }
        
        continue_s = readLine()!;
    } while(continue_s != nil)
}
