function [uOrig, vOrig, u, v] = plotLetters()

%Mimics analysis of Figure 3 of "Singular Vectors' Subtle Secrets" paper
clear;clc;clf

labels=['A B C D E F G H I J K L M N O P Q R S T U V W X Y Z '];

% Bee Movie Original
originalA = [7 96 92 127 2 39 44 49 72 4 70 294 96 465 5 71 0 300 188 461 28 113 38 2 103 18;89 9 1 0 332 2 0 0 26 1 0 68 1 0 73 1 0 30 8 4 77 1 1 0 20 0;116 0 4 0 79 0 1 85 42 0 97 18 1 1 135 0 0 30 2 55 19 0 2 0 3 0;95 32 18 22 132 15 12 26 141 7 3 12 19 33 234 7 1 25 48 77 20 5 28 0 76 0;402 119 134 179 318 72 80 127 182 33 28 201 118 316 113 78 2 531 460 376 10 92 153 29 239 3;45 11 8 3 62 42 1 12 69 1 2 87 12 6 78 3 0 60 7 52 30 1 13 0 14 0;61 41 6 7 98 5 8 110 84 0 1 18 16 9 167 5 1 41 48 79 40 0 24 0 16 0;463 12 1 4 687 9 2 8 318 0 0 8 15 11 241 10 0 17 8 104 58 0 14 0 47 0;41 16 120 107 78 68 104 22 4 8 60 98 148 690 72 16 0 67 335 416 3 66 19 3 0 4;7 0 0 0 8 2 1 0 0 0 0 0 0 0 35 0 0 0 0 0 62 0 0 0 0 0;32 7 6 6 137 5 5 13 126 0 0 5 3 70 19 3 0 6 30 25 4 2 10 0 33 0;124 20 8 108 215 14 5 16 212 6 37 328 20 11 205 16 0 26 44 52 23 2 28 0 108 0;184 29 2 6 231 9 16 13 67 4 1 4 11 14 110 30 1 25 32 25 28 1 9 0 61 0;145 24 53 217 272 20 415 30 118 11 76 32 18 46 282 10 1 13 110 381 17 4 39 1 77 0;61 69 38 81 23 168 34 68 94 2 63 107 172 471 148 55 1 259 129 237 715 40 261 2 54 1;55 8 2 3 79 6 2 10 52 0 0 57 5 0 86 26 0 47 20 19 19 0 9 0 12 0;0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 26 0 0 0 0 0;113 31 28 57 542 24 17 34 169 5 39 40 40 44 161 19 4 102 121 126 22 11 35 0 174 0;205 49 54 29 215 30 26 125 175 17 22 35 63 75 204 56 10 20 109 423 75 22 91 0 54 0;246 66 34 48 202 49 30 1003 330 6 23 73 47 22 415 23 1 77 225 243 63 6 126 0 89 0;43 17 53 40 36 11 62 18 31 3 17 118 62 79 9 62 2 258 176 180 1 6 23 0 14 20;35 0 0 0 294 0 0 0 36 0 0 0 0 0 8 0 0 0 1 2 0 0 0 0 1 0;147 13 3 16 242 5 2 227 122 2 1 3 13 28 101 3 1 8 16 23 1 0 20 0 20 0;6 1 5 1 1 0 0 1 3 0 1 0 3 0 0 7 0 0 1 6 0 0 1 0 0 0;59 62 20 27 103 24 17 40 85 5 6 21 30 20 450 16 1 16 66 82 0 5 71 0 27 0;2 12 0 0 7 0 1 0 7 0 0 1 0 1 2 0 0 0 0 0 0 0 2 0 11 22];

% Finding Nemo Original
%originalA = 
%encrypted = [8 78 85 132 2 31 43 35 90 5 59 235 76 441 1 39 4 230 158 379 15 69 45 2 171 5;73 12 0 0 133 0 0 1 20 0 1 40 0 1 96 0 0 28 4 5 50 0 1 0 46 0;147 1 1 2 68 0 0 93 15 0 77 48 1 0 118 0 3 22 1 20 38 0 1 0 2 0;120 19 5 39 113 14 19 33 158 6 0 12 20 65 260 5 0 20 72 74 36 1 27 0 96 0;396 69 95 217 179 80 85 84 153 15 15 216 204 230 127 57 5 488 387 344 14 52 143 34 211 4;38 2 8 1 42 33 0 8 155 1 1 20 8 0 78 2 0 37 9 49 27 0 3 0 16 0;42 7 3 9 117 22 10 110 62 5 1 13 10 3 252 3 0 27 37 88 36 2 21 0 17 1;418 6 9 7 777 7 5 17 284 1 1 4 19 19 154 2 0 30 8 113 26 0 14 0 37 0;22 6 70 146 53 47 104 22 6 4 54 101 217 544 33 15 2 56 288 383 2 59 21 2 0 0;4 0 0 0 13 0 0 0 1 0 0 0 0 0 9 0 0 3 0 0 45 0 0 0 0 0;78 23 5 3 111 6 7 21 85 0 2 5 7 61 16 2 1 4 31 27 0 0 22 0 27 0;107 14 6 79 222 19 12 25 171 2 21 305 19 15 154 30 0 31 29 35 28 2 9 0 86 0;145 33 6 23 288 10 14 15 92 3 2 3 36 12 126 21 0 12 29 38 18 0 10 0 76 0;72 18 39 199 254 27 353 34 92 7 75 22 13 36 281 8 0 8 69 359 18 2 42 0 74 1;57 61 62 91 27 118 52 64 130 4 124 97 162 407 172 71 1 207 112 226 666 36 216 2 53 5;35 3 6 0 78 6 3 13 38 0 3 45 9 3 40 24 0 38 41 24 13 0 4 0 14 0;0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 28 0 0 0 0 0;78 17 19 48 551 18 17 21 138 1 42 43 45 25 121 15 0 50 81 81 34 7 23 0 117 0;144 33 77 23 202 21 62 230 93 4 23 26 48 65 189 43 10 8 108 344 34 1 120 0 61 0;190 40 40 49 175 31 40 859 221 7 27 82 46 32 430 21 0 74 260 245 53 0 97 0 99 0;36 19 80 63 31 4 49 25 32 6 12 77 41 66 10 58 1 193 150 177 3 3 29 0 23 0;1 0 0 0 216 0 0 0 12 0 0 0 0 0 5 0 0 0 0 0 0 0 0 0 0 0;197 7 2 10 177 3 4 214 130 1 0 5 9 45 57 0 0 8 10 15 0 0 20 0 8 0;1 0 12 0 2 0 0 1 6 0 1 0 0 0 1 6 0 0 0 9 0 0 0 0 1 0;29 43 28 73 73 41 19 33 71 3 3 22 22 33 482 18 1 18 85 84 4 0 54 0 27 0;0 0 0 0 0 0 0 0 2 0 0 0 0 0 11 0 0 0 0 0 0 0 0 0 3 0];

% Gettysburg Original
%originalA = 
%encrypted = [0 1 2 5 0 1 4 0 2 0 1 9 0 15 0 1 0 10 5 36 1 8 0 0 1 0;1 0 0 0 5 0 0 0 1 0 0 1 0 0 1 0 0 2 0 0 2 0 0 0 1 0;12 0 0 0 4 0 0 2 1 0 0 0 0 0 7 0 0 4 0 1 0 0 0 0 0 0;2 0 1 6 14 0 0 3 13 0 0 0 0 0 4 1 0 0 4 4 1 1 4 0 0 0;16 3 8 26 3 5 2 7 6 0 0 4 5 10 5 4 1 22 9 12 2 4 8 0 3 0;3 0 0 1 0 1 0 0 5 0 0 0 0 0 10 0 0 3 0 3 1 0 0 0 0 0;5 1 0 0 5 0 1 4 0 0 0 1 0 0 3 1 0 6 0 0 0 0 1 0 0 0;24 0 0 0 32 1 0 0 7 0 0 1 0 0 8 0 0 0 0 5 1 0 0 0 0 0;0 1 8 1 3 0 2 0 0 0 0 2 0 16 9 0 0 2 9 8 0 7 0 0 0 0;0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0;3 0 0 4 6 0 0 1 6 0 0 8 2 3 3 0 0 1 0 1 0 1 1 0 2 0;2 1 0 0 7 0 0 0 1 0 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0;10 0 5 9 4 1 9 0 2 0 0 3 2 4 12 0 0 0 4 8 1 1 0 0 2 0;1 3 1 3 0 6 1 1 0 0 0 1 4 20 2 5 0 17 3 13 7 2 3 0 0 0;0 0 0 0 5 0 0 0 0 0 0 4 0 0 4 0 0 2 0 0 0 0 0 0 0 0;0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0;8 0 0 1 26 4 3 0 1 0 1 3 0 1 6 2 0 0 5 12 3 0 3 0 0 0;4 2 2 0 10 2 1 6 1 0 1 0 0 1 4 0 0 1 0 8 1 0 0 0 0 0;4 1 4 1 11 5 1 47 18 0 0 3 0 2 11 1 0 2 0 9 0 0 5 0 1 0;1 0 0 0 0 0 3 0 0 0 0 2 0 3 0 0 0 5 5 2 0 0 0 0 0 0;2 0 0 0 17 0 0 0 3 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0;2 1 0 0 11 0 0 8 1 0 0 0 0 1 2 0 0 0 0 1 0 0 1 0 0 0;0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;2 0 0 1 1 0 1 1 0 0 0 0 0 1 0 0 0 1 0 1 0 0 1 0 0 0;0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];

% MLK Original
%encrypted = [0 17 25 24 0 0 14 3 23 2 6 54 33 102 1 7 0 29 35 93 5 25 2 0 21 0;14 0 0 0 42 0 0 0 2 0 0 17 0 0 5 0 0 8 0 0 8 1 0 0 7 0;30 0 0 0 29 1 0 21 13 0 17 3 1 0 29 0 0 9 2 4 5 0 1 0 3 0;30 11 2 2 35 3 5 3 20 1 0 4 1 2 32 1 0 26 26 19 7 0 13 0 4 0;86 8 36 80 46 18 30 20 25 2 1 26 28 71 27 13 3 100 70 89 4 26 33 3 7 0;19 4 7 4 6 12 8 4 18 4 0 4 4 4 25 4 0 48 3 24 8 0 2 0 4 0;15 0 2 2 23 12 3 20 18 0 0 5 1 5 17 1 0 25 1 6 5 0 5 0 0 0;70 0 0 0 162 1 0 2 52 0 0 2 0 0 24 2 0 2 3 24 4 0 7 0 2 0;12 3 43 7 23 11 24 8 0 0 2 55 10 111 33 10 0 15 78 64 0 11 0 1 0 4;2 0 0 0 2 0 0 0 0 0 0 0 0 0 3 0 0 0 0 0 11 0 0 0 0 0;3 2 0 0 8 0 2 0 4 0 0 1 2 2 3 0 0 1 2 12 0 0 4 0 0 0;36 19 2 10 50 8 2 3 42 2 3 66 4 5 26 2 0 2 12 16 2 2 2 0 7 0;27 2 0 1 52 0 0 0 21 0 0 3 2 4 13 3 0 11 5 19 10 0 1 0 5 0;34 3 11 79 58 1 53 3 21 4 4 6 2 12 46 1 2 1 31 63 4 1 14 0 4 0;9 14 10 19 2 100 10 3 8 3 3 21 62 74 13 15 0 45 19 50 55 4 26 0 4 0;8 0 0 0 15 1 0 3 10 0 0 12 0 0 8 12 0 15 3 4 2 0 1 0 0 0;0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6 0 0 0 0 0;27 3 10 7 106 5 8 4 53 0 7 4 9 15 59 2 1 4 21 20 11 2 3 0 16 0;36 4 13 5 28 14 2 21 37 0 3 16 4 11 62 11 0 1 28 73 11 0 15 0 3 0;32 7 1 3 56 21 1 202 88 0 0 9 3 6 102 2 0 23 14 21 14 2 12 0 22 0;8 3 1 2 6 4 4 4 7 0 0 13 3 27 0 7 0 29 36 18 0 0 0 1 0 0;7 0 0 0 56 0 0 0 8 0 0 0 0 0 4 0 0 0 0 0 0 0 0 0 1 0;10 1 2 0 36 0 0 29 47 0 0 0 2 4 10 0 0 2 1 3 0 0 1 0 2 0;1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 2 1 0 0 0 0 0;5 3 3 2 7 3 0 4 7 0 0 2 8 3 27 1 0 1 8 18 0 2 8 0 1 0;0 0 0 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];

% Encrypted Gettysburg
%encrypted = [8 1 6 0 0 1 6 0 1 0 3 3 0 2 0 0 0 3 4 1 0 0 1 2 0 0;0 0 17 0 0 0 3 0 0 0 0 2 0 0 0 0 0 2 0 0 0 0 0 0 0 0;4 4 3 0 2 7 6 0 8 4 10 16 9 5 5 0 3 5 26 22 2 8 12 3 0 1;0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;2 0 0 0 0 0 0 0 0 0 3 1 5 0 0 0 0 0 0 5 3 0 2 0 0 0;1 0 32 0 1 0 7 0 0 0 0 24 0 0 1 0 0 8 0 0 0 0 5 0 0 0;2 7 3 0 0 0 0 0 0 0 16 0 9 0 0 0 1 9 1 2 2 8 8 0 0 0;0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;0 0 11 0 0 8 1 0 1 0 1 2 0 0 0 0 1 2 0 0 0 0 1 0 0 0;4 0 5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4 0 2 0 0 0 0 0 0;3 1 4 0 1 0 2 0 0 0 4 10 4 2 1 0 0 12 9 0 9 5 8 2 0 0;9 8 0 0 1 0 2 0 0 1 15 0 5 0 1 1 1 0 5 10 4 2 36 1 0 0;0 0 10 0 1 6 1 0 0 0 1 4 0 0 2 1 2 4 0 1 1 2 8 0 0 0;0 0 7 0 0 0 1 0 0 0 0 2 0 0 0 0 1 0 0 0 0 0 2 0 0 0;0 0 0 0 1 0 5 0 0 0 0 3 0 0 1 0 0 10 1 3 0 0 3 0 0 0;0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0;1 0 5 0 2 0 1 0 0 0 0 1 0 0 0 0 0 1 0 2 0 0 0 1 0 0;1 2 0 0 7 1 0 0 3 5 20 1 3 4 6 0 3 2 3 17 1 1 13 0 0 0;0 1 14 0 1 3 13 0 4 1 0 2 4 0 0 0 0 4 6 0 0 1 4 0 0 0;3 0 26 0 3 0 1 0 3 2 1 8 5 0 4 1 0 6 1 0 3 0 12 0 0 0;1 0 5 0 0 4 0 0 1 1 0 5 0 0 0 0 1 3 0 6 1 0 0 0 0 0;0 0 4 0 0 2 1 0 0 0 0 12 0 0 0 0 0 7 0 4 0 0 1 0 0 0;3 0 11 0 0 47 18 0 5 1 2 4 0 0 5 0 1 11 1 2 1 4 9 1 0 0;0 0 1 0 0 1 0 0 1 0 1 2 0 0 0 0 0 0 1 1 1 0 1 0 0 0;0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];

% Encrypted MLK
encrypted = [1 0 5 3 3 2 7 3 0 4 7 0 0 2 8 3 27 1 0 1 8 18 0 2 8 0;0 0 0 0 0 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;21 0 0 17 25 24 0 0 14 3 23 2 6 54 33 102 1 7 0 29 35 93 5 25 2 0;7 0 14 0 0 0 42 0 0 0 2 0 0 17 0 0 5 0 0 8 0 0 8 1 0 0;3 0 30 0 0 0 29 1 0 21 13 0 17 3 1 0 29 0 0 9 2 4 5 0 1 0;4 0 30 11 2 2 35 3 5 3 20 1 0 4 1 2 32 1 0 26 26 19 7 0 13 0;7 0 86 8 36 80 46 18 30 20 25 2 1 26 28 71 27 13 3 100 70 89 4 26 33 3;4 0 19 4 7 4 6 12 8 4 18 4 0 4 4 4 25 4 0 48 3 24 8 0 2 0;0 0 15 0 2 2 23 12 3 20 18 0 0 5 1 5 17 1 0 25 1 6 5 0 5 0;2 0 70 0 0 0 162 1 0 2 52 0 0 2 0 0 24 2 0 2 3 24 4 0 7 0;0 4 12 3 43 7 23 11 24 8 0 0 2 55 10 111 33 10 0 15 78 64 0 11 0 1;0 0 2 0 0 0 2 0 0 0 0 0 0 0 0 0 3 0 0 0 0 0 11 0 0 0;0 0 3 2 0 0 8 0 2 0 4 0 0 1 2 2 3 0 0 1 2 12 0 0 4 0;7 0 36 19 2 10 50 8 2 3 42 2 3 66 4 5 26 2 0 2 12 16 2 2 2 0;5 0 27 2 0 1 52 0 0 0 21 0 0 3 2 4 13 3 0 11 5 19 10 0 1 0;4 0 34 3 11 79 58 1 53 3 21 4 4 6 2 12 46 1 2 1 31 63 4 1 14 0;4 0 9 14 10 19 2 100 10 3 8 3 3 21 62 74 13 15 0 45 19 50 55 4 26 0;0 0 8 0 0 0 15 1 0 3 10 0 0 12 0 0 8 12 0 15 3 4 2 0 1 0;0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6 0 0 0;16 0 27 3 10 7 106 5 8 4 53 0 7 4 9 15 59 2 1 4 21 20 11 2 3 0;3 0 36 4 13 5 28 14 2 21 37 0 3 16 4 11 62 11 0 1 28 73 11 0 15 0;22 0 32 7 1 3 56 21 1 202 88 0 0 9 3 6 102 2 0 23 14 21 14 2 12 0;0 0 8 3 1 2 6 4 4 4 7 0 0 13 3 27 0 7 0 29 36 18 0 0 0 1;1 0 7 0 0 0 56 0 0 0 8 0 0 0 0 0 4 0 0 0 0 0 0 0 0 0;2 0 10 1 2 0 36 0 0 29 47 0 0 0 2 4 10 0 0 2 1 3 0 0 1 0;0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 2 1 0 0 0];

 % Lists to store consonants, vowels, neuters        
 consonants = [];
 vowels = [];
 neuters = [];
 alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
 
 [uOrig,sOrig,vOrig] = svd(originalA); %get svd; outputs, U, S, V
 [u,s,v] = svd(encrypted);
 
a1 = s(1,1)*u(:,1)*v(:,1)';%first single rank matrix
u1v1a1 = [u(:,1) v(:,1) a1]%displays u1, v1, and a1
subplot(121);hold on;grid on;

for i=1:length(originalA),
    labels(2*i-1:2*i);
    text(-uOrig(i,1),-vOrig(i,1),labels(2*i-1:2*i))%vectors are displayed negated
   
    %text(-u(i,1),-v(i,1),labels(2*i-1:2*i))%vectors are displayed negated
end


title('Frequency of Letter Usage')
axis([0 .5 0 .5])%Change limits if needed
ylabel('Leaders')
xlabel('Followers')
 
 
a2=s(2,2)*u(:,2)*v(:,2)';%second single rank matrix
u2v2a2=[u(:,2) v(:,2) a2]%displays u2, v2, and a2
subplot(122);hold on;grid on;

for i=1:length(originalA),
    % ORIGINAL CASE
    h1 = text(uOrig(i,2),vOrig(i,2),labels(2*i-1:2*i))
    set(h1,'color','r');
   
    % ENCRYPTED CASE
    h2 = text(-u(i,2),-v(i,2),labels(2*i-1:2*i))
    set(h2,'color','b');
    disp([labels(2*i-1:2*i)])
end

% Plot reference line of y = 0, x=0 
xHorizontal=[-0.6,0.6];
yHorizontal=[0,0];
plot(xHorizontal,yHorizontal)


xVertical= [0, 0];
yVertical=[-0.6,0.6];
plot(xVertical,yVertical)

title('Grouping Letter Type')
axis([-0.6 0.6 -0.6 0.6])%Change limits if needed
ylabel('Leaders')
xlabel('Followers')
plot([.4 .4])
 
% % Label where the vowels/consonants/neuters are Third Quadrant
 uicontrol('Style', 'text',...
        'String', 'Neuter',... %replace something with the text you want
        'Units','normalized',...
        'Position', [0.58 0.12 0.07 0.05]); 
 
% % Fourth Quadrant
 uicontrol('Style', 'text',...
        'String', 'Vowel',... %replace something with the text you want
        'Units','normalized',...
        'Position', [0.8 0.12 0.1 0.05]); 
   
% % First Quadrant
 uicontrol('Style', 'text',...
        'String', 'Neuter',... %replace something with the text you want
        'Units','normalized',...
        'Position', [0.83 0.87 0.07 0.05]); 
  
% % Second Quadrant
 uicontrol('Style', 'text',...
        'String', 'Consonant',... %replace something with the text you want
        'Units','normalized',...
        'Position', [0.59 0.89 0.1 0.04]);  
    
   
rank2approx=a1+a2 %create a rank 2 approximation
%a-approx%difference with original


% PARTITIONS
second_left_singular_vector = u(:,2);
second_right_singular_vector = v(:,2);
letter_frequency_vector = sum(encrypted);
l = roundn(second_left_singular_vector, -5);
r = roundn(second_right_singular_vector, -5);
k = max(size(originalA));
alpha = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

disp('Vowels:');
for i=1:k
  if sign(r(i)) ~= sign(l(i))
    if r(i) > 0
      disp(alpha(i));
      vowels = [vowels alpha(i)];
    end;
  end;
end;

disp('Consonants:');
for i=1:k
  if sign(r(i)) ~= sign(l(i))
    if r(i) < 0
      disp(alpha(i));
       consonants = [consonants alpha(i)];
    end;
  end;
end;

disp('Neuter Elements:');
for i=1:k
  if sign(r(i)) == sign(l(i))
    disp(alpha(i));
    neuters = [neuters alpha(i)];
  end;
end;

end

