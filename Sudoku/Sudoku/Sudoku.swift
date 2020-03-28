/***********************************************************************
Bachelor of Software Engineering
Media Design School
Auckland
New Zealand
(c) 2020 Media Design School
File Name   :   Sudoku.swift
Description :   Has all the functionalities to generate and solve Sudoku problems
Author      :   Sakyawira Nanda Ruslim
Mail        :   Sakyawira.Rus8080@mediadesign.school.nz
**************************************************************************/

import Foundation

class Sudoku{
    let N : Int = 9;
    let UNASSIGNED : Int = 0;
    
    var grid : Matrix = Matrix(rows : 9, columns: 9);

/***********************
* print_grid(): print the Sudoku grid to the console
* @parameter: -
* @return: -
********************/     
    func print_grid(/*grid:[[Int]]*/)
    {
        grid.printGrid();
    }

/***********************
* set_grid(): assign a number to an index manually
* @parameter: Int, Int, Int
* @return: Bool (return false if the user tries to assign a number less than 1 or larger than 9)
********************/   
    func set_grid(Row : Int, Col : Int, Num : Int) -> Bool
    {
        if (Num >= 1 && Num < 10)
        {
            grid[Row, Col] = Num;
            return true;
        }
        return false;
    }
    
/***********************
* find_unassigned_location(): iterate through the grid to find index that has not been filled with any number yet
* @parameter: inout Int, inout Int
* @return: Bool (return false if all the indexes are assigned)
********************/
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

/***********************
* used_in_row(): iterate through the rows and check whether the passed in number has been assigned to any of them
* @parameter: Int, Int
* @return: Bool (return false if the number has not been assigned to any of the rows)
********************/  
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

/***********************
* used_in_col(): iterate through the columns and check whether the passed in number has been assigned to any of them
* @parameter: Int, Int
* @return: Bool (return false if the number has not been assigned to any of the columns)
********************/     
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

/***********************
* used_in_box(): iterate through the boxes and check whether the passed in number has been assigned to any of them
* @parameter: Int, Int, Int
* @return: Bool (return false if the number has not been assigned to any of the boxes)
********************/       
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

/***********************
* is_safe(): check whether or not we can assign a number to a certain index
* @parameter: Int, Int, Int
* @return: Bool (return false if we cannot assign the number to the index)
********************/        
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

/***********************
* solve_sudoku(): start the process of solving a Sudoku problem
* @parameter: -
* @return: Bool (return true if the Sudoku problem is solved)
********************/      
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

/***********************
* generate_solvable_grid(): generate a solvable Sudoku problem
* @parameter: -
* @return: -
********************/         
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

