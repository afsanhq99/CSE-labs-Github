import heapq


def A_star(start_node, goal_node):
    actual_cost = {start_node: 0}
    start = [(heuristic[start_node]+actual_cost[start_node], start_node)]  # Initialize the priority queue with the start node and its cost
    closed_set = set()
    parents = {start_node: start_node}

    while start:
        val, n = heapq.heappop(start)  # Extract the node with the minimum cost from the priority queue

        if n == goal_node or not nodes[n]:
            break  # Goal reached or no more nodes left, exit the loop

        if n in closed_set:
            continue  # Skip this node if it has already been visited

        closed_set.add(n)  # Mark the current node as visited

        for node, value in nodes[n]:
            new_cost = actual_cost[n] + value #actual_cost cost add hoitese

            if node not in actual_cost or new_cost < actual_cost[node]:
                heapq.heappush(start, (new_cost + heuristic[node], node))
                parents[node] = n #n holo node(child) er parent
                actual_cost[node] = new_cost

    if n != goal_node:
        return 'NO PATH FOUND!'

    path = []
    while n != start_node:
        path.append(n)
        n = parents[n]
    path.append(start_node)
    path.reverse()
    print('Total Distance: ' + str(actual_cost[goal_node]) + ' km')
    return 'Path: ' + " -> ".join(path)


with open("readme.txt") as f:
    heuristic = {}
    nodes = {}
    for line in f:
        s = line.strip().split(" ")
        heuristic[s[0]] = int(s[1])  #edik heruistic
        nodes[s[0]] = [(s[i], int(s[i+1])) for i in range(2, len(s), 2)] #edik connected node er actual cost

start_node = input("Start Node: ").strip()
goal_node = input("Destination: ").strip()
print(A_star(start_node, goal_node))
