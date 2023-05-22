from studentB import ai_move, get_user_move, is_player_starting, check_winner
from studentA import print_board, is_game_over, new_board, announce_outcome

board = new_board()
players_move = is_player_starting()

while is_game_over(board):
    print_board(board)
    board = players_move and get_user_move(board) or ai_move(board)
    players_move = not players_move

announce_outcome(board, players_move)


 
