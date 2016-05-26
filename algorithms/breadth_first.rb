def bfs(list, val)
  queue = [list.keys.first]
  visit = {queue.first => true}
  while !queue.empty?
    node = queue.shift
    return puts "Found node: #{node}" if node == val
    if list[node]
      list[node].each do |child|
        if !visit[child]
          queue << child
          visit[child] = true
          puts "NODE VISITED: #{child}"
        end
      end
    end
  end
  puts "Could not find node: #{val}"
end

list = {
  "A" => ["C","D","G","E"],
  "B" => ["C","F"],
  "C" => ["A","B","D","F","E"],
  "D" => ["A","C","E"],
  "E" => ["A","C","D","Z"],
  "F" => ["B","C"],
  "G" => ["X","Y","A"]
}

bfs(list, "Y")