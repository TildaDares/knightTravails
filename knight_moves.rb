require_relative 'board'
class Knight
    def initialize
        @chess_row = [-1, 2, 2, 1, -1, -2, -2, 1]
        @chess_col = [2, 1, -1, -2, -2, -1, 1, 2]
    end

    def create_children(chess_coord)
        moves = []
        8.times do |i|
            moves << [chess_coord.x_coord + @chess_row[i], chess_coord.y_coord + @chess_col[i]]
        end
        valid_moves = moves.select do |coord|
            (coord[0] >= 0 && coord[0] <= 8) && (coord[1] >= 0 && coord[1] <= 8)
        end
        valid_moves.each do |valid_coord|
            chess_coord.children << Board.new(valid_coord[0], valid_coord[1], chess_coord)
        end
    end
    def bfs_search(start_coord, end_coord)
        start = Board.new(start_coord[0], start_coord[1])
        queue = [start]
        create_children(start)
        start.children.each do |child|
            queue << child
        end
        loop do
            current = queue.shift
            if end_coord[0] == current.x_coord && end_coord[1] == current.y_coord
                return display_route(current)
            else
                create_children(current)
                current.children.each do |child|
                    queue << child
                end
            end
        end
    end

    def display_route(obj_coord)
        current_parent = obj_coord.parent
        route_array = []
        route_array = [[obj_coord.x_coord, obj_coord.y_coord]]
        until current_parent.nil?
            route_array.unshift([current_parent.x_coord, current_parent.y_coord])
            current_parent = current_parent.parent
        end
        puts "You made it in #{route_array.length - 1} moves. Here's your path:"
        return route_array
    end
end
knight = Knight.new
p knight.bfs_search([3,3], [4,3])