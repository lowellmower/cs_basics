def dfs(list, val)
  stack = [list.keys.first]
  visit = {stack.first => true}
  while !stack.empty?
    node = stack.pop
    return puts "Found node: #{node}" if node == val
    if list[node]
      list[node].each do |child|
        if !visit[child]
          stack << child
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

dfs(list, "Y")