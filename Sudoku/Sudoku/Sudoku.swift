//
//  Sudoku.swift
//  Sudoku
//
//  Created by Sakyawira Ruslim on 6/03/20.
//  Copyright © 2020 Sakyawira Ruslim. All rights reserved.
//

import Foundation

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
