import random;

import random

def ai_move(board):
        
    for i in range(5):
        for j in range(5):
            if board[i][j] == ' ':
                board[i][j] = 'O'
                if check_winner(board, 'O', 5):
                    return board
                board[i][j] = ' '

    for i in range(5):
        for j in range(5):
            if board[i][j] == ' ':
                board[i][j] = 'X'
                if check_winner(board, 'X', 5):
                    return board
                board[i][j] = ' '

    while True:
        row = random.randint(0, 4)
        col = random.randint(0, 4)
        if board[row][col] == ' ':
            board[row][col] = 'O'
            return board

def check_winner(board, player, size):
    for i in range(size):
        if all(board[i][j] == player for j in range(size)):
            return True

    for j in range(size):
        if all(board[i][j] == player for i in range(size)):
            return True

    if all(board[i][i] == player for i in range(size)):
        return True
    if all(board[i][size-i-1] == player for i in range(size)):
        return True

    return False

def get_user_move(board):
    while True:
        try:
            move_row = int(input("Enter your move [row] (0-4): "))
            move_col = int(input("Enter your move [col] (0-4): "))
            if move_row < 0 or move_row > 4 or move_col < 0 or move_col > 4:
                print("Invalid move. Please enter a number between 0 and 24.")
            elif board[move_row][move_col] != ' ':
                print("That position is already occupied. Please choose an empty position.")
            else:
                board[move_row][move_col] = 'X'
                return board
        except ValueError:
            print("Invalid input. Please enter a valid number.")


def is_player_starting():
    random_int = random.randint(1,2)
    response  = True if random_int == 1 else False
    return response
