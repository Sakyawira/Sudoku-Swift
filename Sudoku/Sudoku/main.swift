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
print("0 :  No, any other key : Yes");

if (readLine() == "0")
{
    print("Randomizing board...");
    sudoku.generate_solvable_grid();
}
    
else
{
    var continue_s : String? = nil;
    repeat{
        var row : Int = 0;
        var column : Int = 0;
        var number : Int = 0;
        
        // Row
        while (true)
        {
            print("Input the row you want to change (0 - 8)");
            if let irow = Int(readLine()!)
            {
                if irow >= 0 && irow < 9
                {
                    print(irow);
                    row = irow;
                    break;
                }
            }
            print("Please input a number between 0 - 8 !");
            continue_s = nil;
            continue;
        }
        
        // Column
        while (true)
        {
            print("Input the column you want to change (0 - 8)");
            if let icolumn = Int(readLine()!)
            {
                if icolumn >= 0 && icolumn < 9
                {
                    print(icolumn);
                    column = icolumn;
                    break;
                }
            }
            print("Please input a number between 0 - 8 !");
            continue_s = nil;
            continue;
        }
        
        // Num
        while (true)
        {
            print("Input the number you want (1 - 9)");
            if let inumber = Int(readLine()!)
            {
                if inumber >= 1 && inumber < 10
                {
                    print(inumber);
                    number = inumber;
                    break;
                }
            }
            print("Please input a number between 1 - 9 !");
            continue_s = nil;
            continue;
        }
        
        if (sudoku.set_grid(Row: row, Col: column, Num: number))
        {
            print("Worked!");
            sudoku.print_grid();
        }
        
        print("Enter 1 to continue, any other key if you want to input more values!")
        continue_s = readLine()!;
    } while(continue_s != "1")
    if (sudoku.solve_sudoku())
    {
        print("Sudoku solved!");
        sudoku.print_grid();
    }
    else
    {
        print("Unsolved!");
    }
}
