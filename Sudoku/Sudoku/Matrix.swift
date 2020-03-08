//
//  Matrix.swift
//  Sudoku
//
//  Created by Sakyawira Ruslim on 9/03/20.
//  Copyright © 2020 Sakyawira Ruslim. All rights reserved.
//

import Foundation

struct Matrix {
    let rows: Int, columns: Int
    var grid: [Int]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
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
