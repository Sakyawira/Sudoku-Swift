//
//  main.swift
//  Sudoku
//
//  Created by Sakyawira Ruslim on 6/03/20.
//  Copyright © 2020 Sakyawira Ruslim. All rights reserved.
//

import Foundation

var sudoku = Sudoku();

sudoku.generate_solvable_grid();

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
        if let row = Int(readLine()!){
            print(row);
        }
        else{
            print("Please input a number between 0 - 8 !");
            continue;
        }
       
        // Column
        if let column = Int(readLine()!){
                print(column);
            }
            else{
                print("Please input a number between 0 - 8 !");
                continue;
            }
        continue_s = readLine()!;
    } while(continue_s != nil)
}
