def branch(node):
    return nodes[node]


def A_star(start_node, goal_node):
    global n
    open_set = {start_node}
    closed_set = set()
    g = {start_node: 0}
    parents = {start_node: start_node}

    while open_set:
        n = min(open_set, key=lambda x: g[x] + heuristic[x])  # minimum nitese

        if n == goal_node or not nodes[n]:
            break  # goal e pouchaile ba onno node na thakle break

        for node, value in branch(n):
            new_cost = g[n] + value

            if node not in open_set and node not in closed_set:
                open_set.add(node)
                parents[node] = n
                g[node] = new_cost
            elif new_cost < g[node]:
                g[node] = new_cost
                parents[node] = n

                if node in closed_set:
                    closed_set.remove(node)
                    open_set.add(node)

        open_set.remove(n)
        closed_set.add(n)

    if n != goal_node:
        return 'NO PATH FOUND!'

    path = []
    while n != start_node:
        path.append(n)
        n = parents[n]
    path.append(start_node)
    path.reverse()
    print('Total Distance: ' + str(g[goal_node]) + ' km')
    return 'Path: ' + " -> ".join(path)


with open("readme.txt") as data:
    heuristic = {}
    nodes = {}
    for line in data:
        s = line.strip().split(" ")
        heuristic[s[0]] = int(s[1])
        nodes[s[0]] = [(s[i], int(s[i+1])) for i in range(2, len(s), 2)]

start_node = input("Start Node: ")
goal_node = input("Destination: ")
print(A_star(start_node, goal_node))
