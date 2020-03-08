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
    print("Input your values!");
}
