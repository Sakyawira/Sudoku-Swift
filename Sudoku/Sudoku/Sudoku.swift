//
//  Sudoku.swift
//  Sudoku
//
//  Created by Sakyawira Ruslim on 6/03/20.
//  Copyright © 2020 Sakyawira Ruslim. All rights reserved.
//

import Foundation

class Sudoku{
    let N : Int = 9;
    let UNASSIGNED = 0;
    
    //let myString : String = "hi";
    
    var grid : [[Int]] = [  [0, 0, 0, 0, 0, 0, 0, 0, 0],
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
        for i in 0..<grid.count
        {
            print(grid[i]);
        }
        print("");
    }
    
    func find_unassigned_location( row : inout Int, col : inout Int) -> Bool
    {
        for i in 0..<N
        {
            for j in 0..<N
            {
                if (grid[i][j] == UNASSIGNED)
                {
                    row = i;
                    col = j;
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
    
    func generate_solvable_grid()
    {
        var random_sequence : [Int] = [1, 2, 3, 4, 5, 6 ,7 ,8 ,9];
        random_sequence.shuffle();
        
        print(random_sequence);
        print("");
        grid[0] = random_sequence;
        
        print_grid();
        
        if(!solve_sudoku())
        {
            fatalError("No Solution!");
        }
        
        
        print_grid();
        
        //copy()
        
        // Setting random grid to 0
        for _ in 0..<60
        {
            let randomNumber : Int = Int.random(in: 0...8);
            let randomNumber2 : Int = Int.random(in: 0...8);
            grid[randomNumber][randomNumber2] = 0;
        }
        
        print_grid();
        
        if(!solve_sudoku())
        {
            fatalError("No Solution");
        }
        
        print_grid();
    }
}

