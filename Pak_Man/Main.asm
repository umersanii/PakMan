INCLUDE Irvine32.inc
includelib Winmm.lib

.data
PlaySound PROTO,
pszSound:PTR BYTE, 
hmod:DWORD, 
fdwSound:DWORD

DOWNARROW BYTE 50h
LEFTARROW BYTE 4Bh
RIGHTARROW BYTE 4Dh
UPARROW BYTE 48h

boolWallCollison db 0
boolmisc db -1

aye         db 'aye.wav',0  

lvl1GhostRandomMovementy db 11, 11, 11, 6
lvl1GhostRandomMovementx db 25, 42, 70, 42


strtitle0 db "                                who needs a pacman, when you have         ",0
strtitle1 db "                                ______  ___   _   _____  ___  ___   _   _ ",0
strtitle2 db "                                | ___ \/ _ \ | | / /|  \/  | / _ \ | \ | |",0
strtitle3 db "                                | |_/ / /_\ \| |/ / | .  . |/ /_\ \|  \| |",0
strtitle4 db "                                |  __/|  _  ||    \ | |\/| ||  _  || . ` |",0
strtitle5 db "                                | |   | | | || |\  \| |  | || | | || |\  |",0
strtitle6 db "                                \_|   \_| |_/\_| \_/\_|  |_/\_| |_/\_| \_/",0
strtitle7 db "                                                                          ",0
strtitle8 db "                                [E] Wiki/How to Play              [P] Play",0
 
sgameover1 db "  ____                         ___                 _ ",0
sgameover2 db " / ___| __ _ _ __ ___   ___   / _ \__   _____ _ __| |",0
sgameover3 db "| |  _ / _` | '_ ` _ \ / _ \ | | | \ \ / / _ | '__| |",0
sgameover4 db "| |_| | (_| | | | | | |  __/ | |_| |\ V |  __| |  |_|",0
sgameover5 db " \____|\__,_|_| |_| |_|\___|  \___/  \_/ \___|_|  (_)",0
sgameover6 db "                                                     ",0
sgameover7 db "             You Managed to Score = ",0

sgameover8 db " [Q] Title                       [E] Wiki/How To Play",0

lvlcomplete1 db " _         _    ___  _    ____                      _      _         _ _ _ ",0
lvlcomplete2 db "| | __   _| |  / _ \/ |  / ___|___  _ __ ___  _ __ | | ___| |_ ___  | | | |",0
lvlcomplete3 db "| | \ \ / / | | | | | | | |   / _ \| '_ ` _ \| '_ \| |/ _ \ __/ _ \ | | | |",0
lvlcomplete4 db "| |__\ V /| | | |_| | | | |__| (_) | | | | | | |_) | |  __/ ||  __/ |_|_|_|",0
lvlcomplete5 db "|_____\_/ |_|  \___/|_|  \____\___/|_| |_| |_| .__/|_|\___|\__\___| (_|_|_)",0
lvlcomplete6 db "                                             |_|                           ",0
lvlcomplete7 db "                                                                           ",0
lvlcomplete8 db "                                                        [E] Next Level     ",0

strwiki1 db "Press Arrow Keys To Move",0
strwiki2 db "Press Arrow Keys To Move",0
wikir1 db "                                    About Game                                      ",0
wikir2 db "                                                                                    ",0
wikir3 db "       The Game is About a Robinhood type character who steals from the rich        ",0
wikir4 db "                             and gives back to poor                                 ",0
wikir5 db "                                                                                    ",0
wikir6 db "                                                                                    ",0
wikir7 db "                                    How to Play                                     ",0
wikir8 db "                                                                                    ",0
wikir9 db "                          [G]ood Luck, Have Fun, Don't Die                          ",0
wikir10 db "                                                                                   ",0
wikir11 db "                      [E] TitleScreen              [P] Play                        ",0




;		  1	2 3 4 5 6 7 8 9 101112131415161718
row1  db "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #", 0
row2  db "#                                                                                   #", 0
row3  db "#       # # # # # # # # # # # # #                 # # # # # # # # # # # # #         #", 0
row4  db "#       # . . . . . # . . . . . #                 # . . . . . . . . . . . #         #", 0
row5  db "#       # . . . . . # . . . . . #                 # . . . . . . . . . . . #         #", 0
row6  db "#       # . . . . . # . . . . . #                 # . . # # # # # # # . . #         #", 0
row7  db "#       # . . . . . # . . . . . #                 # . . #    . .    # . . #         #", 0
row8  db "#       # . . . . . # . . . . . #                 # . . #    . .    # . . #         #", 0
row9  db "#       # . . . . . # . . . . . #                 # . . #    . .    # . . #         #", 0
row10 db "#       # . . . . . # . . . . . #                 # . . #    . .    # . . #         #", 0
row11 db "#       # . . . . . # . . . . . #                 # . . #    . .    # . . #         #", 0
row12 db "#                                                                                   #", 0
row13 db "#                                                                                   #", 0
row14 db "#                            # .   . #  . .  # .   . #                              #", 0
row15 db "#                            # .   . #  . .  # .   . #                              #", 0
row16 db "#                            # .   . #  . .  # .   . #                              #", 0
row17 db "#                            # .   . #  . .  # .   . #                              #", 0
row18 db "#                            # .   . #  . .  # .   . #                              #", 0
row19 db "#                            # .   . #  . .  # .   . #                              #", 0
row20 db "#                            # .   . #  . .  # .   . #                              #", 0
row21 db "#                            # .   . #  . .  # .   . #                              #", 0
row22 db "#                            # .   . #  . .  # .   . #                              #", 0
row23 db "#                            # # # # # # # # # # # # #                              #", 0
row24 db "#                                                                                   #", 0
row25 db "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #", 0

l2row1  db "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #", 0
l2row2  db "#                                                                                   #", 0
l2row3  db "#                                                                                   #", 0
l2row4  db "#         # # # #                     . . # . .                     # # # #         #", 0
l2row5  db "#         # . . .                   . . . # . . .                   . . . #         #", 0
l2row6  db "#         # . .                   . . . . # . . . .                   . . #         #", 0
l2row7  db "#         # .       . #         . . . . . # . . . . .         # .       . #         #", 0
l2row8  db "#                 . . #       . . . . . # # # . . . . .       # . .                 #", 0
l2row9  db "#               . . . #     . . . . . . # # # . . . . . .     # . . .               #", 0
l2row10 db "#               # # # #   . . . . . . . # # # . . . . . . .   # # # #               #", 0
l2row11 db "#                       . . . . . . . . # # # . . . . . . . .                       #", 0
l2row12 db "#                   # # # # # # # # # # # # # # # # # # # # # # #                   #", 0
l2row13 db "#       # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #       #", 0
l2row14 db "#                   # # # # # # # # # # # # # # # # # # # # # # #                   #", 0
l2row15 db "#                       . . . . . . . . # # # . . . . . . . .                       #", 0
l2row16 db "#               # # # #   . . . . . . . # # # . . . . . . .   # # # #               #", 0
l2row17 db "#               . . . #     . . . . . . # # # . . . . . .     # . . .               #", 0
l2row18 db "#                 . . #       . . . . . # # # . . . . .       # . .                 #", 0
l2row19 db "#         # .       . #         . . . . . # . . . . .         # .      . #          #", 0
l2row20 db "#         # . .                   . . . . # . . . .                  . . #          #", 0
l2row21 db "#         # . . .                   . . . # . . .                  . . . #          #", 0
l2row22 db "#         # # # #                     . . # . .                    # # # #          #", 0
l2row23 db "#                                                                                   #", 0
l2row24 db "#                                                                                   #", 0
l2row25 db "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #", 0

l3row1  db "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #", 0
l3row2  db "#                                                                                   #", 0
l3row3  db "#          #      # # # # # # # # # # # # # # # # # # # # # # # #        #          #", 0
l3row4  db "#          #                                                             #          #", 0
l3row5  db "#          #     #  # # # # # # # # # #       # # # # # # # # # #  #     #          #", 0
l3row6  db "#          #     #  #                                           #  #     #          #", 0
l3row7  db "#          #     #  #         . #  . . .  #   . . . # .         #  #     #          #", 0
l3row8  db "#          #     #  #       . . . #  . .  #   . . # . . .       #  #     #          #", 0
l3row9  db "#        # #     #  #     . . . . . #     #   . # . . . . .     #  #     # #        #", 0
l3row10 db "#      # # #     #  #   . . . . . . . #   #   # . . . . . . .   #  #     # # #      #", 0
l3row11 db "#    # # # #     #      . . . . . . . . # # # . . . . . . . .      #     # # # #    #", 0
l3row12 db "#    # # # #     #          # # # # # # # # # # # # # # #          #     # # # #    #", 0
l3row13 db "#      # # #     #      . . . . . . . . # # # . . . . . . . .      #     # # #      #", 0
l3row14 db "#        # #     #  #     . . . . . . #   # . # . . . . . . .   #  #     # #        #", 0
l3row15 db "#          #     #  #     . . . . . # .   # . . # . . . . .     #  #     #          #", 0
l3row16 db "#          #     #  #       . . . # . .   # . . . # . . .       #  #     #          #", 0
l3row17 db "#          #     #  #         . # . . .   # . . . . # .         #  #     #          #", 0
l3row18 db "#          #     #  #         # . . . .   # . . . . . #         #  #     #          #", 0
l3row19 db "#          #     #  #                                           #  #     #          #", 0
l3row20 db "#          #     #  # # # # # # # # # #       # # # # # # # # # #  #     #          #", 0
l3row21 db "#          #        .                                                    #          #", 0
l3row22 db "#          #       # # # # # # # # # # # # # # # # # # # # # # # #       #          #", 0
l3row23 db "#                                                                                   #", 0
l3row25 db "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #", 0

StringLvl db "Level 01 : In the beninging                                                        ", 0
xUI db "|                      |", 0
yUI db " ----------------------", 0
xyUI db "|----------------------|", 0

dot db ".", 0
spaces2 db "                                                                                                          ",0
Spaces db "                                                                                                              ",0
xtitleUI db "|                                                                                                              |",0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;LVL1
foodx1 db 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4 
foodx2 db 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6 
foodx3 db 6, 6, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 9 
foodx4 db 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 13, 13, 13, 13
foodx5 db 13, 13, 14, 14, 14, 14, 14, 14, 15, 15, 15, 15, 15, 15, 16, 16, 16, 16, 16, 16, 17, 17, 17, 17, 17, 17, 18, 18, 18, 18, 18, 18, 19, 19, 19
foodx6 db 19, 19, 19, 20, 20, 20, 20, 20, 20, 21, 21, 21, 21, 21, 21



foody1 db 11, 13, 15, 17, 19, 23, 25, 27, 29, 31, 53, 55, 57, 59, 61, 63, 65, 67, 69, 71, 73, 11, 13, 15, 17, 19, 23, 25, 27, 29, 31, 53, 55, 57, 59
foody2 db 61, 63, 65, 67, 69, 71, 73, 11, 13, 15, 17, 19, 23, 25, 27, 29, 31, 53, 55, 71, 73, 11, 13, 15, 17, 19, 23, 25, 27, 29, 31, 53, 55, 62, 64
foody3 db 71, 73, 11, 13, 15, 17, 19, 23, 25, 27, 29, 31, 53, 55, 62, 64, 71, 73, 11, 13, 15, 17, 19, 23, 25, 27, 29, 31, 53, 55, 62, 64, 71, 73, 11 
foody4 db 13, 15, 17, 19, 23, 25, 27, 29, 31, 53, 55, 62, 64, 71, 73, 11, 13, 15, 17, 19, 23, 25, 27, 29, 31, 53, 55, 62, 64, 71, 73, 32, 36, 41, 43
foody5 db 48, 52, 32, 36, 41, 43, 48, 52, 32, 36, 41, 43, 48, 52, 32, 36, 41, 43, 48, 52, 32, 36, 41, 43, 48, 52, 32, 36, 41, 43, 48, 52, 32, 36, 41
foody6 db 43, 48, 52, 32, 36, 41, 43, 48, 52, 32, 36, 41, 43, 48, 52


tfoodx1 db 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4 
tfoodx2 db 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6 
tfoodx3 db 6, 6, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 9 
tfoodx4 db 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 13, 13, 13, 13
tfoodx5 db 13, 13, 14, 14, 14, 14, 14, 14, 15, 15, 15, 15, 15, 15, 16, 16, 16, 16, 16, 16, 17, 17, 17, 17, 17, 17, 18, 18, 18, 18, 18, 18, 19, 19, 19
tfoodx6 db 19, 19, 19, 20, 20, 20, 20, 20, 20, 21, 21, 21, 21, 21, 21



tfoody1 db 11, 13, 15, 17, 19, 23, 25, 27, 29, 31, 53, 55, 57, 59, 61, 63, 65, 67, 69, 71, 73, 11, 13, 15, 17, 19, 23, 25, 27, 29, 31, 53, 55, 57, 59
tfoody2 db 61, 63, 65, 67, 69, 71, 73, 11, 13, 15, 17, 19, 23, 25, 27, 29, 31, 53, 55, 71, 73, 11, 13, 15, 17, 19, 23, 25, 27, 29, 31, 53, 55, 62, 64
tfoody3 db 71, 73, 11, 13, 15, 17, 19, 23, 25, 27, 29, 31, 53, 55, 62, 64, 71, 73, 11, 13, 15, 17, 19, 23, 25, 27, 29, 31, 53, 55, 62, 64, 71, 73, 11 
tfoody4 db 13, 15, 17, 19, 23, 25, 27, 29, 31, 53, 55, 62, 64, 71, 73, 11, 13, 15, 17, 19, 23, 25, 27, 29, 31, 53, 55, 62, 64, 71, 73, 32, 36, 41, 43
tfoody5 db 48, 52, 32, 36, 41, 43, 48, 52, 32, 36, 41, 43, 48, 52, 32, 36, 41, 43, 48, 52, 32, 36, 41, 43, 48, 52, 32, 36, 41, 43, 48, 52, 32, 36, 41
tfoody6 db 43, 48, 52, 32, 36, 41, 43, 48, 52, 32, 36, 41, 43, 48, 52



wallx1 db 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2
wallx2 db 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
wallx3 db 5, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 8, 9, 9, 9, 9, 9, 9 
wallx4 db 9, 10, 10, 10, 10, 10, 10, 10, 13, 13, 13, 13, 14, 14, 14, 14, 15, 15, 15, 15, 16, 16, 16, 16, 17, 17, 17, 17, 18, 18, 18, 18, 19, 19, 19
wallx5 db 19, 20, 20, 20, 20, 21, 21, 21, 21, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22


wally1 db 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59
wally2 db 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 8, 20, 32, 50, 74, 8, 20, 32, 50, 74, 8, 20, 32, 50, 56, 57, 58, 59, 60, 61
wally3 db 62, 63, 64, 65, 66, 67, 68, 74, 8, 20, 32, 50, 56, 68, 74, 8, 20, 32, 50, 56, 68, 74, 8, 20, 32, 50, 56, 68, 74, 8, 20, 32, 50, 56, 68
wally4 db 74, 8, 20, 32, 50, 56, 68, 74, 29, 37, 45, 53, 29, 37, 45, 53, 29, 37, 45, 53, 29, 37, 45, 53, 29, 37, 45, 53, 29, 37, 45, 53, 29, 37, 45
wally5 db 53, 29, 37, 45, 53, 29, 37, 45, 53, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53

twallx1 db 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 5, 5, 5, 5
twallx2 db 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 8, 9, 9, 9, 9, 9, 9, 9, 10
twallx3 db 10, 10, 10, 10, 10, 10, 11, 11, 11, 11, 11, 11, 11, 14, 14, 14, 14, 15, 15, 15, 15, 16, 16, 16, 16, 17, 17, 17, 17, 18, 18, 18, 18, 19, 19
twallx4 db 19, 19, 20, 20, 20, 20, 21, 21, 21, 21, 22, 22, 22, 22, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23

twallcounter db 132


twally1 db 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33, 51, 53, 55, 57, 59, 61, 63, 65, 67, 69, 71, 73, 75, 9, 21, 33, 51, 75, 9, 21, 33, 51
twally2 db 75, 9, 21, 33, 51, 57, 59, 61, 63, 65, 67, 69, 75, 9, 21, 33, 51, 57, 69, 75, 9, 21, 33, 51, 57, 69, 75, 9, 21, 33, 51, 57, 69, 75, 9
twally3 db 21, 33, 51, 57, 69, 75, 9, 21, 33, 51, 57, 69, 75, 30, 38, 46, 54, 30, 38, 46, 54, 30, 38, 46, 54, 30, 38, 46, 54, 30, 38, 46, 54, 30, 38
twally4 db 46, 54, 30, 38, 46, 54, 30, 38, 46, 54, 30, 38, 46, 54, 30, 32, 34, 36, 38, 40, 42, 44, 46, 48, 50, 52, 54

tl2wallx1 db 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 6, 6, 6, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 9, 9, 9, 9, 9, 10, 10, 10, 10, 10
tl2wallx2 db 10, 10, 10, 10, 10, 10, 11, 11, 11, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 13, 13, 13
tl2wallx3 db 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 14, 14, 14
tl2wallx4 db 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 15, 15, 15, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 17
tl2wallx5 db 17, 17, 17, 17, 18, 18, 18, 18, 18, 19, 19, 19, 19, 19, 20, 20, 20, 21, 21, 21, 22, 22, 22, 22, 22, 22, 22, 22, 22

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;LVL2
tl2wallcounter db 169


tl2wally1 db 11, 13, 15, 17, 43, 69, 71, 73, 75, 11, 43, 75, 11, 43, 75, 11, 23, 43, 63, 75, 23, 41, 43, 45, 63, 23, 41, 43, 45, 63, 17, 19, 21, 23, 41 
tl2wally2 db 43, 45, 63, 65, 67, 69, 41, 43, 45, 21, 23, 25, 27, 29, 31, 33, 35, 37, 39, 41, 43, 45, 47, 49, 51, 53, 55, 57, 59, 61, 63, 65, 9, 11, 13
tl2wally3 db 15, 17, 19, 21, 23, 25, 27, 29, 31, 33, 35, 37, 39, 41, 43, 45, 47, 49, 51, 53, 55, 57, 59, 61, 63, 65, 67, 69, 71, 73, 75, 77, 21, 23, 25
tl2wally4 db 27, 29, 31, 33, 35, 37, 39, 41, 43, 45, 47, 49, 51, 53, 55, 57, 59, 61, 63, 65, 41, 43, 45, 17, 19, 21, 23, 41, 43, 45, 63, 65, 67, 69, 23
tl2wally5 db 41, 43, 45, 63, 23, 41, 43, 45, 63, 11, 23, 43, 63, 74, 11, 43, 74, 11, 43, 74, 11, 13, 15, 17, 43, 68, 70, 72, 74

l2wallx1 db 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 5, 5, 5, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 7, 7, 8, 8
l2wallx2 db 8, 8, 8, 8, 8, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 10, 10, 10, 10, 10, 11, 11, 11, 11, 11, 11
l2wallx3 db 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11
l2wallx4 db 11, 11, 11, 11, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12
l2wallx5 db 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12
l2wallx6 db 12, 12, 12, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13
l2wallx7 db 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 14, 14, 14, 14, 14, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 16
l2wallx8 db 16, 16, 16, 16, 16, 16, 17, 17, 17, 17, 17, 17, 17, 18, 18, 18, 18, 18, 19, 19, 19, 20, 20, 20, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21
l2wallx9 db 21, 21, 21, 21

l2wallcounter dw 284


l2wally1 db 10, 11, 12, 13, 14, 15, 16, 42, 68, 69, 70, 71, 72, 73, 74, 10, 42, 74, 10, 42, 74, 10, 22, 42, 62, 74, 22, 40, 41, 42, 43, 44, 62, 22, 40
l2wally2 db 41, 42, 43, 44, 62, 16, 17, 18, 19, 20, 21, 22, 40, 41, 42, 43, 44, 62, 63, 64, 65, 66, 67, 68, 40, 41, 42, 43, 44, 20, 21, 22, 23, 24, 25
l2wally3 db 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60
l2wally4 db 61, 62, 63, 64, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38
l2wally5 db 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73
l2wally6 db 74, 75, 76, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51
l2wally7 db 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 40, 41, 42, 43, 44, 16, 18, 20, 22, 40, 41, 42, 43, 44, 62, 63, 64, 65, 66, 67, 68, 22
l2wally8 db 40, 41, 42, 43, 44, 62, 22, 40, 41, 42, 43, 44, 62, 10, 22, 42, 62, 73, 10, 42, 73, 10, 42, 73, 10, 11, 12, 13, 14, 15, 16, 42, 67, 68, 69
l2wally9 db 70, 71, 72, 73

l2foodx1 db 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 6
l2foodx2 db 6, 6, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8
l2foodx3 db 8, 8, 8, 8, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 14
l2foodx4 db 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 16, 16, 16, 16, 16, 16
l2foodx5 db 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 18, 18, 18, 18, 18, 18, 18, 18, 18
l2foodx6 db 18, 18, 18, 18, 18, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 21, 21, 21, 21,

l2foodcounter db 208


l2foody1 db 39, 41, 45, 47, 13, 15, 17, 37, 39, 41, 45, 47, 49, 69, 71, 73, 13, 15, 35, 37, 39, 41, 45, 47, 49, 51, 71, 73, 13, 21, 33, 35, 37, 39, 41
l2foody2 db 45, 47, 49, 51, 53, 65, 73, 19, 21, 31, 33, 35, 37, 39, 47, 49, 51, 53, 55, 65, 67, 17, 19, 21, 29, 31, 33, 35, 37, 39, 47, 49, 51, 53, 55
l2foody3 db 57, 65, 67, 69, 27, 29, 31, 33, 35, 37, 39, 47, 49, 51, 53, 55, 57, 59, 25, 27, 29, 31, 33, 35, 37, 39, 47, 49, 51, 53, 55, 57, 59, 61, 25
l2foody4 db 27, 29, 31, 33, 35, 37, 39, 47, 49, 51, 53, 55, 57, 59, 61, 27, 29, 31, 33, 35, 37, 39, 47, 49, 51, 53, 55, 57, 59, 17, 19, 21, 29, 31, 33
l2foody5 db 35, 37, 39, 47, 49, 51, 53, 55, 57, 65, 67, 69, 19, 21, 31, 33, 35, 37, 39, 47, 49, 51, 53, 55, 65, 67, 13, 21, 33, 35, 37, 39, 41, 45, 47
l2foody6 db 49, 51, 53, 65, 72, 13, 15, 35, 37, 39, 41, 45, 47, 49, 51, 70, 72, 13, 15, 17, 37, 39, 41, 45, 47, 49, 68, 70, 72, 39, 41, 45, 47

tl2foody1 db 39, 41, 45, 47, 13, 15, 17, 37, 39, 41, 45, 47, 49, 69, 71, 73, 13, 15, 35, 37, 39, 41, 45, 47, 49, 51, 71, 73, 13, 21, 33, 35, 37, 39, 41
tl2foody2 db 45, 47, 49, 51, 53, 65, 73, 19, 21, 31, 33, 35, 37, 39, 47, 49, 51, 53, 55, 65, 67, 17, 19, 21, 29, 31, 33, 35, 37, 39, 47, 49, 51, 53, 55
tl2foody3 db 57, 65, 67, 69, 27, 29, 31, 33, 35, 37, 39, 47, 49, 51, 53, 55, 57, 59, 25, 27, 29, 31, 33, 35, 37, 39, 47, 49, 51, 53, 55, 57, 59, 61, 25
tl2foody4 db 27, 29, 31, 33, 35, 37, 39, 47, 49, 51, 53, 55, 57, 59, 61, 27, 29, 31, 33, 35, 37, 39, 47, 49, 51, 53, 55, 57, 59, 17, 19, 21, 29, 31, 33
tl2foody5 db 35, 37, 39, 47, 49, 51, 53, 55, 57, 65, 67, 69, 19, 21, 31, 33, 35, 37, 39, 47, 49, 51, 53, 55, 65, 67, 13, 21, 33, 35, 37, 39, 41, 45, 47
tl2foody6 db 49, 51, 53, 65, 72, 13, 15, 35, 37, 39, 41, 45, 47, 49, 51, 70, 72, 13, 15, 17, 37, 39, 41, 45, 47, 49, 68, 70, 72, 39, 41, 45, 47

tl2foodx1 db 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 6
tl2foodx2 db 6, 6, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8
tl2foodx3 db 8, 8, 8, 8, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 14
tl2foodx4 db 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 16, 16, 16, 16, 16, 16
tl2foodx5 db 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 18, 18, 18, 18, 18, 18, 18, 18, 18
tl2foodx6 db 18, 18, 18, 18, 18, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 21, 21, 21, 21,




foodcountlv1 db 190
brickcountlv1 db 174
boolisFood db 0
boolisWall db 0
lifecount db 3

scorecounter db 0
lastposx db 1
lastposy db 0
boolLastMove db 4

outofboundsy db 5 dup(?) 
outofboundsx db 5 dup(?) 

lastxG1 db 1
lastyG1 db 1

clvl db 1
spawnxPac db 79
spawnyPac db 23

strxUI BYTE "Previous Pak-Men",0
stryUI db "& ",0
score BYTE 0


xPos BYTE 10
yPos BYTE 12

xG1 db 10
yG1 db 12

inputChar BYTE ?

.code



PrintBoard PROC
	mov eax, blue+ (black* 16)
    call SetTextColor
	mov ecx, 25
	cmp clvl, 1
	je level1Board

	cmp clvl, 2
	je level2Board

	cmp clvl, 3
	je level3Board

	level1Board:
	mov edx, OFFSET row1 - 86
	jmp BoardLoop

	level2Board:
	mov edx, OFFSET l2row1 - 86
	jmp BoardLoop

	level3Board:
	mov edx, OFFSET row1 - 86
	jmp BoardLoop

	BoardLoop:
		ADD edx, 86
		CALL writestring
		CALL CRLF

		Loop BoardLoop

	RET 

PrintBoard ENDP

PrintxUI PROC
	mov eax, white+ (black* 16)
    call SetTextColor

	mov dh, 1
	mov dl, 88
	call gotoxy
	mov edx, OFFSET yUI
	call writestring

	mov ecx, 3
	mov dh, 2
	xor ebx, ebx

	mov bl, 88
	mov dl, 88
	mov bh, 2
	xUILoop1:
		mov dh, bh
		mov dl, bl
		call gotoxy
		mov edx, OFFSET xUI
		call writestring
		inc bh
		Loop xUILoop1

	mov dh, 5
	mov dl, 88
	call gotoxy
	mov edx, OFFSET xyUI
	call writestring

	mov ecx, 8
	mov dh, 5
	xor ebx, ebx

	mov bl, 88
	mov dl, 88
	mov bh, 6
	xUILoop2:
		mov dh, bh
		mov dl, bl
		call gotoxy
		mov edx, OFFSET xUI
		call writestring
		inc bh

		mov dh, bh
		mov dl, bl
		call gotoxy
		mov edx, OFFSET xyUI
		call writestring
		inc bh

		loop xUILoop2

	mov dh, 22
	mov dl, 88
	call gotoxy
	mov edx, OFFSET xUI
	call writestring
	inc bh
	mov dh, 23
	mov dl, 88
	call gotoxy
	mov edx, OFFSET yUI
	call writestring


	mov eax, yellow + (black* 16)
    call SetTextColor
	mov dh, 3
	mov dl, 92
	call gotoxy
	mov edx, OFFSET strxUI
	call writestring

	mov eax, yellow+ (black* 16)
    call SetTextColor
	mov dl, 28
	mov dh, 25
	call gotoxy
	mov edx, Offset Stringlvl
	call writestring


	RET 

PrintxUI ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
PrintDots PROC
xor esi, esi
mov eax, yellow+ (black* 16)
call SetTextColor
	cmp clvl, 1
	je level1Food

	cmp clvl, 2
	je level2Food

	cmp clvl, 3
	je level3Food

	level1Food:
	push Offset foodx1 - 1
    push Offset foody1 - 1
	mov cl,foodcountlv1

	jmp DotsLoop

	level2Food:
	push Offset l2foodx1 - 1
    push Offset l2foody1 - 1
	mov cl,l2foodcounter

	jmp DotsLoop

	level3Food:
	mov edx, OFFSET l2row1 - 86
	jmp DotsLoop


DotsLoop:
pop eax
add eax, 1
mov dl, [eax]
dec dl
mov ebx, eax
pop eax
add eax, 1
mov dh, [eax]
call gotoxy
mov edx, Offset dot
CALL writestring
push eax
push ebx
cmp ecx, 0
je ifDots
Loop DotsLoop

ifDots:
pop eax
pop eax
ret 
Loop DotsLoop

PrintDots endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
isFood Proc
    xor ecx, ecx
    mov ecx, 0
    mov esi, 0  
	 ; esi for loop counter
	; esi for loop counter
	cmp clvl, 1
	je Foodlvl1

	cmp clvl, 2
	je Foodlvl2

	Foodlvl1:
	mov eax, Offset tfoodx1 - 1
	mov edx, Offset tfoody1 - 1 
	jmp FoodLoop
	
	Foodlvl2:
	mov eax, Offset tl2foodx1 - 1
	mov edx, Offset tl2foody1 - 1
	jmp FoodLoop

FoodLoop:
    cmp cl, foodcountlv1
    je  endFood      
	add eax, 1
	add edx, 1
    mov bh, ypos
	mov bl, [eax]
    cmp bh, bl
    je  ifFood
continueFood:

    inc ecx
    jmp FoodLoop

ifFood:
    mov bh, xpos
    mov bl, [edx]
	dec bl
    cmp bl, bh

    je  elseifFood
    jmp continueFood

elseifFood:
    inc scorecounter
	mov bl, -1
	mov [edx], bl
	mov [eax], bl
    jmp endFood

endFood:
    ret
isFood endp

isFoodt Proc
    xor ecx, ecx
    mov ecx, 0
    mov esi, 0  
	mov eax, Offset tfoodx1 - 1
	mov edx, Offset tfoody1 - 1 ; esi for loop counter
	; esi for loop counter

FoodLoopt:
    cmp cl, foodcountlv1
    je  endFoodt      ; Exit loop if all food items checked
	add eax, 1
	add edx, 1
    mov bh, yG1
	mov bl, [eax]
    cmp bh, bl
    je  ifFoodt
continueFoodt:

    inc ecx
    jmp FoodLoopt

ifFoodt:
    mov bh, xG1
    mov bl, [edx]
	dec bl
    cmp bl, bh

    je  elseifFoodt
    jmp continueFoodt

elseifFoodt:
    mov boolisFood, 1
	
    jmp endFoodt

endFoodt:
    ret
isFoodt endp
isFoodGhost Proc
    mov esi, 0  
	
Food1Loop:
    cmp cl, Foodcountlv1
    je  endFood1   
	add eax, 1
	add edx, 1
	mov bl, [eax]
    cmp ch, bl
    je  ifFood1
continueFood1:

    inc cl
    jmp Food1Loop

ifFood1:
    mov bl, [edx]
	

    cmp bh, bl

    je  elseifFood1
    jmp continueFood1

elseifFood1:
    mov boolisFood, 1
    jmp endFood1

endFood1:
    ret
isFoodGhost endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
makeSquare1 proc
mov bh, 1
mov dh, bh
mov dl, 2
call gotoxy

mov eax, green+ (black* 16)
call SetTextColor
mov al, 218
call writechar

mov ecx, 106
mov al, 196
titleRoof:
call writechar
loop titleRoof

mov al, 191
call writechar

mov bh, 2
mov dh, bh
mov dl, 2
call gotoxy
mov ecx, 24

titleRight1:
mov al, 179
call writechar
mov edx, Offset spaces2
call writestring

mov al, 179
call writechar
inc bh
mov dh, bh
mov dl, 2
call gotoxy
loop titleRight1

mov bh, 25
mov dh, bh
mov dl, 2
call gotoxy

mov al, 195
call writechar

mov ecx, 106
mov al, 196
titleBase1:
call writechar
loop titleBase1

mov al, 217
call writechar
ret
makeSquare1 endp

makeSquare proc
mov eax, green+ (black* 16)
call SetTextColor
mov al, 218
call writechar

mov ecx, 110
mov al, 196
titleRoof:
call writechar
loop titleRoof

mov al, 191
call writechar

call crlf
mov ecx, 25

titleRight:
mov al, 179
call writechar
mov edx, Offset spaces
call writestring

mov al, 179
call writechar
call crlf
loop titleRight

mov al, 195
call writechar

mov ecx, 110
mov al, 196
titleBase:
call writechar
loop titleBase

mov al, 217
call writechar
ret
makeSquare endp
;;;;;;;;;;;;;;;;;;;;;;
titleScreen PROC




call makeSquare
call makeSquare1
mov bh, 10
mov dh, bh
mov dl, 3
call gotoxy
mov eax, green+ (black* 16)
call SetTextColor
mov edx, Offset strtitle0 - 75
mov ecx, 9
TitleLoop:
add edx, 75
CALL writestring
push edx
inc bh
mov dh, bh
mov dl, 3
call gotoxy
pop edx
loop TitleLoop
INVOKE PlaySound, OFFSET aye, NULL, 0

ret
titleScreen endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

wiki proc
call makeSquare
mov bh, 4
mov dh, bh
mov dl, 15
call gotoxy
mov ecx, 11
mov edx, Offset wikir1 - 85
WikiLoop:
add edx, 85
CALL writestring
push edx
inc bh
mov dh, bh
mov dl, 15
call gotoxy
pop edx
loop WikiLoop
ret
wiki endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
isWall PROC
	
    mov esi, 0  
	mov bh, ypos
	mov ch, xpos
	cmp clvl, 1
	je Walllvl1

	cmp clvl, 2
	je Walllvl2

	Walllvl1:
	mov eax, Offset wallx1 - 1
	mov edx, Offset wally1 - 1 
	jmp WallLoop
	
	Walllvl2:
	mov eax, Offset l2wallx1 - 1
	mov edx, Offset l2wally1 - 1 
	jmp WallLoop

WallLoop:
    cmp cl, brickcountlv1
    je  endWall   
	add eax, 1
	add edx, 1
	mov bl, [eax]
    cmp bh, bl

    je  ifWall
continueWall:

    inc cl
    jmp WallLoop

ifWall:
    mov bl, [edx]
	

    cmp ch, bl

    je  elseifWall
    jmp continueWall

elseifWall:
    mov boolisWall, 1
    jmp endWall

endWall:
    ret
isWall endp
;;;;;;;;;;;;;;;;;;;;
Gameover Proc
call makeSquare
call makeSquare1
mov bh, 10
mov dh, bh
mov dl, 30
call gotoxy
mov eax, green+ (black* 16)
call SetTextColor
mov edx, Offset sgameover1 - 54
mov ecx, 6
TitleLoop:
add edx, 54
CALL writestring
push edx
inc bh
mov dh, bh
mov dl, 30
call gotoxy
pop edx
loop TitleLoop
mov edx, Offset sgameover7
CALL writestring
mov eax, 0
mov al, scorecounter
call WriteDec
mov dh, 19
mov dl, 30
call gotoxy
mov edx, Offset sgameover8
CALL writestring



INVOKE PlaySound, OFFSET aye, NULL, 0
Gameover Endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ResetPac proc
mov eax, 1500
call delay
call UpdatePlayer
mov dl, spawnxPac
mov dh, spawnyPac
mov xpos, dl
mov ypos, dh
call drawplayer
ret
ResetPac endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

GhostCollide PROC
mov bl, xpos
cmp xG1, bl
je ifGhostCollide
ret
ifGhostCollide:
mov bh, ypos
cmp yG1, bh
je DecLife
ret
DecLife:
dec lifecount
call ResetPac
ret
GhostCollide ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 GhostMoveP1 Proc
 mov eax, 100
	call delay
    call UpdateGhost
	cmp xG1, 7
	jle tp

	cmp yG1, 3
	jle tp


	cmp xG1, 80
	jge tp


	cmp yG1, 22
	jge tp
	ChangeDirection:
	call Randomize
	 mov eax, 3
    call RandomRange
    cmp eax, 0
	je Change2Up

	cmp eax, 1
	je Change2Left


	cmp eax, 2
	je Change2Down


	cmp eax, 3
	je Change2Right

	Change2Up:
	mov lastyG1, 1
	mov lastxG1, 0
	jmp NormalMove

	Change2Down:
	mov lastyG1, -1
	mov lastxG1, 0
	jmp NormalMove


	Change2Left:
	mov lastyG1, 0
	mov lastxG1, -1
	jmp NormalMove


	Change2Right:
	mov lastxG1, 1
	mov lastyG1, 0
	jmp NormalMove

	tp:
	call Randomize
	 mov eax, 3
    call RandomRange
	mov dl, BYTE PTR lvl1GhostRandomMovementy[eax]
	mov yG1, dl
	mov dh, BYTE PTR lvl1GhostRandomMovementx[eax]
	mov xG1, dh
	jmp NormalMove




NormalMove:
mov dl, lastyG1
mov dh, lastxG1
add xG1, dh
add yG1, dl
GhostWallCheck:
    mov boolisWall, 0
	mov eax, Offset twallx1 - 1
	mov edx, Offset twally1 - 1 
	
	mov bh, yG1
	mov ch, xG1
	call isWall
	cmp boolisWall, 1
	je GoBackGhost


	

call SpawnGhost
ret

GoBackGhost:
mov dl, lastyG1
mov dh, lastxG1
sub xG1, dh
sub yG1, dl
jmp ChangeDirection
		


GhostMoveP1 Endp
;;;;;;;;;;;;;;;;;;;

PacMove Proc
mov dl, xPos
	mov dh, yPos
	CALL GoToXY
	mov eax, 0
	push edx
	CALL ReadKey	

	pop edx

	CMP ah, UPARROW
	je DeltaUp
	CMP ah, DOWNARROW
	je DeltaDown
	CMP ah, LEFTARROW
	je DeltaLeft
	CMP ah, RIGHTARROW
	je DeltaRight
	jmp DeltaLast

	DeltaUp:
		cmp ypos, 1
		jle DeltaUpContinue
		call isFood
		mov boolLastMove, 1
		mov dh, yPos
		mov dl, xPos
		CALL GoToXY
		CALL UpdatePlayer

		dec dh
		dec yPos
		mov boolisWall, 0
		mov bh, ypos
		mov ch, xpos
		mov eax, Offset wallx1 - 1
		mov edx, Offset wally1 - 1 
		call isWall
		cmp boolisWall, 1
		je DeltaUpBack

		DeltaUpContinue:
		
		CALL GoToXY
		mov lastposy, -1
		mov lastposx, 0
		

		call DrawPlayer
		ret
	DeltaUpBack:
		inc dh
		inc yPos
		jmp DeltaUpContinue
	
	DeltaDown:
		cmp ypos, 23
		jge DeltaDownContinue
		call isFood

		mov boolLastMove, 3
		
		mov dh, yPos
		mov dl, xPos
		CALL GoToXY
		CALL UpdatePlayer
		
		inc yPos
		inc dh
		mov boolisWall, 0
		mov eax, Offset wallx1 - 1
		mov edx, Offset wally1 - 1 
		mov bh, ypos
		mov ch, xpos
		call isWall
		cmp boolisWall, 1
		je DeltaDownBack
		DeltaDownContinue:

		CALL GoToXY
		mov lastposy, 1
		mov lastposx, 0
		call DrawPlayer
		ret
				
		DeltaDownBack:
		dec dh
		dec Ypos
		jmp DeltaDownContinue
	

	DeltaLeft:
		cmp xpos, 1
		jle DeltaLeftContinue
		call isFood

		mov boolLastMove, 2
		mov dh, yPos
		mov dl, xPos
		CALL GoToXY
		CALL UpdatePlayer

		dec dl
		SUB xPos, 1
		mov eax, Offset wallx1 - 1
		mov edx, Offset wally1 - 1 
		mov bh, ypos
		mov ch, xpos
		mov boolisWall, 0
		call isWall
		cmp boolisWall, 1
		je DeltaLeftBack
		DeltaLeftContinue:

		mov dl, xPos
		CALL GoToXY
		mov lastposy, 0
		mov lastposx, -1
		call DrawPlayer
		ret
	
	DeltaLeftBack:
		inc xPos
		inc dl

		jmp DeltaLeftContinue

	DeltaRight:
		cmp xpos,  83
		jge DeltaRightContinue
		call isFood
		mov boolLastMove, 4
		cmp boolWallCollison, 1
		mov dh, yPos
		mov dl, xPos
		CALL GoToXY
		CALL UpdatePlayer

		inc dl
		ADD xPos, 1
		mov eax, Offset wallx1 - 1
		mov edx, Offset wally1 - 1 
		mov bh, ypos
		mov ch, xpos
		mov boolisWall, 0
		call isWall
		cmp boolisWall, 1
		je DeltaRightBack
		DeltaRightContinue:

		mov dl, xPos
		CALL GoToXY
		mov lastposy, 0
		mov lastposx, 1
		call DrawPlayer
		ret
	DeltaRightBack:
		dec xPos
		dec dl

		jmp DeltaRightContinue	
	
	DeltaLast:
		call isFood

		mov dl, xPos
		mov dh, yPos
		CALL GoToXY
		CALL UpdatePlayer
		cmp boolLastMove, 1
		je LastMoveWasUp
		cmp boolLastMove, 2
		je LastMoveWasLeft
		cmp boolLastMove, 3
		je LastMoveWasDown
		cmp boolLastMove, 4
		je LastMoveWasRight
	LastMoveWasDown:
		cmp ypos, 23
		jge continueElseDelta
		jmp elseDelta
	LastMoveWasUp:
		cmp ypos, 1
		jle continueElseDelta
		jmp elseDelta

	LastMoveWasRight:
		cmp xpos,  83
		jge continueElseDelta
		jmp elseDelta

	LastMoveWasLeft:
		cmp xpos, 1
		jle continueElseDelta
		jmp elseDelta
	elseDelta:

		mov dl, lastposy
		mov dh, lastposx
		add xPos, dh
		add yPos, dl
		
		mov eax, Offset wallx1 - 1
		mov edx, Offset wally1 - 1 
		mov bh, ypos
		mov ch, xpos
		mov boolisWall, 0
		call isWall
		cmp boolisWall, 1
		je DeltaElseBack

		
		continueElseDelta:
		mov dl, xPos
		mov dh, yPos
		CALL GoToXY
		call DrawPlayer		
		ret


	DeltaElseBack:

	mov dl, lastposy
		mov dh, lastposx
		sub xPos, dh
		sub yPos, dl
		jmp continueElseDelta
		
PacMove endp
;;;;;;;;;;;;;;;;

lvl01complete proc
call makeSquare
call makeSquare1
mov bh, 9
mov dh, bh
mov dl, 17
call gotoxy
mov ecx, 8
mov edx, Offset lvlcomplete1 - 76
lvl1Loop:
add edx, 76
CALL writestring
push edx
inc bh
mov dh, bh
mov dl, 17
call gotoxy
pop edx
loop lvl1Loop
ret
lvl01complete endp

;;;;;;;;;;;;;;;;;;;;;;;

misc proc
mov bl, foodcountlv1
    ;cmp scorecounter, bl
	cmp scorecounter, 100
	je LvlComplete
	
	mov eax, 100
	call delay
	mov dl, 0
	mov dh, 25
	call gotoxy
	mov al, scorecounter
	call WriteDec
	mov dl, 80
	mov dh, 25
	call gotoxy
	mov edx, Offset spaces2
	call writestring
	mov eax, red+ (black* 16)
    call SetTextColor
	mov dl, 80
	mov dh, 21
	xor ecx, ecx

	 
	cmp lifecount, 0
	je GG
	mov cl, lifecount
	HeartLoop:
	
	
	
	add dh, 4
	call gotoxy
	mov edx, Offset stryUI
	call writestring
	loop HeartLoop
	ret
	GG:
	mov lifecount, 3
	call Clrscr
	call gameover
	GGread:
    call readchar
	cmp al, 'q'
	je titleContinue
	cmp al, 'Q'
	je titleContinue
	cmp al, 'E'
	je wikihome
	cmp al, 'e'
	je wikihome
	jmp GGread

	LvlComplete:
	inc clvl
	call Clrscr
	call lvl01complete
	call readchar
	cmp al, 'e'
	mov boolmisc, 2
	ret

	titleContinue:
	mov boolmisc, 0
	ret

	wikihome:
	mov boolmisc, 1
	ret

misc endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
main PROC
mov clvl, 2
jmp play
titleContinue1:
call Clrscr
call titleScreen
call readchar
cmp al, 'e'
je wikiHome1
cmp al, 'E'
je wikiHome1
cmp al, 'P'
je play
cmp al, 'p'
je play
jmp titleContinue1
wikiHome1:
call Clrscr
call wiki
call readchar
cmp al, 'e'
je titleContinue1
cmp al, 'E'
je titleContinue1
cmp al, 'P'
je play
cmp al, 'p'
je play
jmp wikiHome1
play:
call Clrscr
	call PrintBoard
	call PrintDots

	call PrintxUI
	
    
	call DrawPlayer

	call SpawnGhost

	gameLoop:
	mov boolmisc, -1
	call Misc
	cmp boolmisc, 0
	je titleContinue1
	cmp boolmisc, 1
	je wikiHome1
	cmp boolmisc, 2
	je play

	;call GhostMoveP1
	call PacMove
	call GhostCollide
	loop gameloop
	
	
main ENDP

DrawPlayer PROC
	; draw player at (xPos,yPos):
	 mov eax, white + (Black* 16)
    call SetTextColor

	mov dl,xPos
	mov dh,yPos
	call Gotoxy
	mov al,"&"
	call WriteChar
	ret
DrawPlayer ENDP

UpdatePlayer PROC
	mov dl,xPos
	mov dh,yPos
	call Gotoxy
	 mov eax, White + (Black* 16)
    call SetTextColor
	mov al," "
	call WriteChar
	ret
UpdatePlayer ENDP

UpdateGhost PROC
	mov dl,xG1
	mov dh,yG1
	call Gotoxy
	mov boolisWall, 0
	mov eax, Offset wallx1 - 1
	mov edx, Offset wally1 - 1 
	mov bh, yG1
	mov ch, xG1
	call isWall
	cmp boolisWall, 1
	je WallinUpdate
	
	mov boolisFood, 0
	mov eax, Offset tfoodx1 - 1
	mov edx, Offset tfoody1 - 1 
	mov bh, yG1
	mov ch, xG1
	call isFoodt
	cmp boolisFood, 1
	je FoodinUpdate
	mov al," "
	call WriteChar
	jmp retUpdateGhost
	

	WallinUpdate:
	 mov eax, Blue + (Black* 16)
    call SetTextColor
	mov al, "#"
	call WriteChar
	jmp retUpdateGhost


	FoodinUpdate:
	mov eax, Yellow + (Black* 16)
    call SetTextColor
	mov al, "."
	call WriteChar
	jmp retUpdateGhost


	retUpdateGhost:
	ret
UpdateGhost ENDP

SpawnGhost PROC
	mov dl,xG1
	mov dh,yG1
	call Gotoxy
	 mov eax, White + (Black* 16)
    call SetTextColor
	mov al, 232
	call WriteChar
	ret
SpawnGhost ENDP


	
END main	

