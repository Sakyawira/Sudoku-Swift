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

var grid : [[Int]] = [  [1, 0, 0, 0, 0, 0, 0, 0, 0],
                        [0, 0, 0, 0, 0, 0, 0, 0, 0],
                        [0, 0, 0, 0, 0, 0, 0, 0, 0],
                        [0, 0, 0, 0, 0, 0, 0, 0, 0],
                        [0, 0, 0, 0, 0, 0, 0, 0, 0],
                        [0, 0, 0, 0, 0, 0, 0, 0, 0],
                        [0, 0, 0, 0, 0, 0, 0, 0, 0],
                        [0, 0, 0, 0, 0, 0, 0, 0, 0],
                        [0, 0, 0, 0, 0, 0, 0, 0, 0]];

func print_grid(/*grid:[[Int]]*/)
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

func used_in_col(col : Int, num : Int) -> Bool
{
    for row in 0..<N
    {
        if (grid[row][col] == num)
        {
            return true;
        }
        
    }
        
    return false;
}

func used_in_box(boxStartRow : Int, boxStartCol : Int, num : Int) -> Bool
{
    for row in 0..<3
    {
        for col in 0..<3
        {
            if (grid[row + boxStartRow][col + boxStartCol] == num)
            {
                return true;
            }
        }
    }
    return false;
}

func is_safe(row : Int, col : Int, num : Int) -> Bool
{
    /* Check if 'num' is not already placed in
    current row, current column and current 3x3 box */
    if (!used_in_row(row : row, num : num) && !used_in_col(col : col, num : num) && !used_in_box(boxStartRow : row - row % 3, boxStartCol : col - col % 3, num : num) && grid[row][col] == UNASSIGNED)
    {
        return true;
    }
    else
    {
        return false;
    }
}

func solve_sudoku() -> Bool
{
    var row : Int = 0;
    var col : Int = 0;

    // If there is no unassigned location,
    // we are done
    if (!find_unassigned_location(row : &row, col : &col))
    {
        return true; // success!
    }

    // consider digits 1 to 9
    for num in 1...9
    {
        // if looks promising
        if (is_safe(row : row, col : col, num : num))
        {
            // make tentative assignment
            grid[row][col] = num;

            // return, if success, yay!
            if (solve_sudoku())
            {
                return true;
            }

            // failure, unmake & try again
            grid[row][col] = UNASSIGNED;
        }
    }
    return false; // this triggers backtracking
}
