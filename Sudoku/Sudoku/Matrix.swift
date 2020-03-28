/***********************************************************************
Bachelor of Software Engineering
Media Design School
Auckland
New Zealand
(c) 2020 Media Design School
File Name   :   Matrix.swift
Description :   Create a struct called Matrix which will become the grid of the Sudoku game
Author      :   Sakyawira Nanda Ruslim
Mail        :   Sakyawira.Rus8080@mediadesign.school.nz
**************************************************************************/

import Foundation

struct Matrix {
    let rows: Int, columns: Int
    var grid: [Int]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0, count: rows * columns)
    }

/***********************
* indexIsValid(): check whether or not an index is within range
* @parameter: Int, Int
* @return: Bool (return false if index is out of range)
********************/  
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }

/***********************
* printGrid(): print the matrix
* @parameter: -
* @return: -
********************/  
    func printGrid(){
        for x in 0..<rows{
            var line = "";
            for y in 0..<columns
            {
                line += String(self[x, y]) + ", ";
                line += "";
            }
            print(line);
        }
        print("");
        //print(grid);
    }
    
    subscript(row: Int, column: Int) -> Int {
        get {
            assert(indexIsValid(row: row, column: column),"Index out of range");
            return grid[(row * columns) + column];
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range");
            grid[(row * columns) + column] = newValue;
        } }
}
