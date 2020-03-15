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
    let UNASSIGNED : Int = 0;
    
    var grid : Matrix = Matrix(rows : 9, columns: 9);
    
    func print_grid(/*grid:[[Int]]*/)
    {
        grid.printGrid();
    }
    
    func set_grid(Row : Int, Col : Int, Num : Int) -> Bool
    {
        if (Num >= 1 && Num < 10)
        {
            grid[Row, Col] = Num;
            return true;
        }
        return false;
    }
    
    func find_unassigned_location( row : inout Int, col : inout Int) -> Bool
    {
        for i in 0..<N
        {
            for j in 0..<N
            {
                if (grid[i,j] == UNASSIGNED)
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
            if (grid[row, col] == num)
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
            if (grid[row, col] == num)
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
                if (grid[row + boxStartRow, col + boxStartCol] == num)
                {
                    return true;
                }
            }
        }
        return false;
    }
    
    func is_safe(row : Int, col : Int, num : Int) -> Bool
    {
        if (!used_in_row(row : row, num : num) && !used_in_col(col : col, num : num) && !used_in_box(boxStartRow : row - row % 3, boxStartCol : col - col % 3, num : num) && grid[row, col] == UNASSIGNED)
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
        
        // Check if there is still an unassigned index
        // This function will increment the row and column to find unassigned index
        if (!find_unassigned_location(row : &row, col : &col))
        {
            // Sudoku Solved
            return true;
        }
        
        // Iterate from number 1 - 9
        for num in 1...9
        {
            // if it is possbile to input current number to current index
            // this function will check box, horizontal, and vertical
            if (is_safe(row : row, col : col, num : num))
            {
                // assign number temporarily to curent index
                grid[row, col] = num;
                
                // Start recursion
                if (solve_sudoku())
                {
                    // Sudoku Solved
                    return true;
                }
                
                // unassign number from index, and begin next iteration with next number
                grid[row, col] = UNASSIGNED;
            }
        }
        // return from recursion to try another number
        return false;
    }
    
    func generate_solvable_grid()
    {
        var random_sequence : [Int] = [1, 2, 3, 4, 5, 6 ,7 ,8 ,9];
        random_sequence.shuffle();
        
        // print(random_sequence);
        // print("");
        
        for n in 0..<9
        {
            grid[0, n] = random_sequence[n];
        }
        
        
        // print_grid();
        
        if(!solve_sudoku())
        {
            fatalError("No Solution!");
        }
        
        // print_grid();
        
        // Setting random grid to 0
        for _ in 0..<60
        {
            let randomNumber : Int = Int.random(in: 0...8);
            let randomNumber2 : Int = Int.random(in: 0...8);
            grid[randomNumber, randomNumber2] = 0;
        }
        
        print_grid();
        
        if(!solve_sudoku())
        {
            fatalError("No Solution");
        }
        
        print_grid();
    }
}

