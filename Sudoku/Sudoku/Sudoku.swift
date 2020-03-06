//
//  Sudoku.swift
//  Sudoku
//
//  Created by Sakyawira Ruslim on 6/03/20.
//  Copyright © 2020 Sakyawira Ruslim. All rights reserved.
//

import Foundation

let N : Int = 9;
let UNASSIGNED = 0;

let myString : String = "hi";

let grid : [[Int]] = [  [1, 0, 0, 0, 0, 0, 0, 0, 0],
                        [0, 0, 0, 0, 0, 0, 0, 0, 0],
                        [0, 0, 0, 0, 0, 0, 0, 0, 0],
                        [0, 0, 0, 0, 0, 0, 0, 0, 0],
                        [0, 0, 0, 0, 0, 0, 0, 0, 0],
                        [0, 0, 0, 0, 0, 0, 0, 0, 0],
                        [0, 0, 0, 0, 0, 0, 0, 0, 0],
                        [0, 0, 0, 0, 0, 0, 0, 0, 0],
                        [0, 0, 0, 0, 0, 0, 0, 0, 0]];

func print_grid(grid:[[Int]])
{
    for x in 0..<grid.count{
        var line = "";
        for y in 0..<grid[x].count
        {
            line += String(grid[x][y]);
            line += "";
        }
        print(line);
    }
}

func find_unassigned_location( row : inout Int, col : inout Int) -> Bool
{
    for row in 0..<N
    {
        for col in 0..<N
        {
            if (grid[row][col] == UNASSIGNED)
            {
                return true;
            }
                
        }
            
    }
        
    return false;
}

func used_in_row(row : Int, num : Int) -> Bool
{
    for col in 0..<N
    {
        if (grid[row][col] == num)
        {
            return true;
        }
            
    }
        
    return false;
}
