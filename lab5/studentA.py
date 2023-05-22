def new_board():
    return [[' ' for _ in range(5)] for _ in range(5)]

def print_board(board):
    print("\n\n  " + " ".join(str(i) for i in range(5)))

    for i in range(0, len(board)):
        print(str(i) + "." + "|".join(board[i]))
        print("  " + "-" * 9)

def is_game_over(board: str([[]])):
    is_game_over, _ = check_game_status(board)
    return is_game_over

def announce_outcome(board:  str([[]]), players_move):
    _, outcome = check_game_status(board)

    match outcome:
        case 'X':
            print("Congrats, you've won")
        case 'O':
            print("Congrats, you've lost. You're stupid")
        case None:
            print("Congrats, nobody won. We're both stupid")



def check_game_status(board: str([[]])):
    
    # Check rows
    for row in board:
        if all(cell == row[0] and cell != ' ' for cell in row):
            return False, row[0]
        
    # Check columns
    for col in range(len(board)):
        if all(board[row][col] == board[0][col] and board[0][col] != ' ' for row in range(len(board))):
            return False, board[0][col]

    # Check diagonals
    if all(board[i][i] == board[0][0] and board[0][0] != ' ' for i in range(len(board))):
        return False, board[0][0]
    if all(board[i][len(board)-i-1] == board[0][len(board)-1] and board[0][len(board)-1] != ' ' for i in range(len(board))):
        return False, board[0][len(board)-1]
    # Check if the board is completely filled

    if all(cell != ' ' for row in board for cell in row):
        return False, None

    return True, None
