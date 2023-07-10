import random

N = int(input())
transactions = []
for i in range(N):
    t = input().split()
    transactions.append((t[0], int(t[1])))

POPULATION_SIZE = 100
P_CROSSOVER = 0.9
P_MUTATION = 0.1     #randomly assigning
MAX_GENERATIONS = 1000


def fitness(chromosome):
    balance = 0
    for i in range(N):    #calculating fitness for all the chromosomes
        if chromosome[i] == 1:
            if transactions[i][0] == 'l':
                balance -= transactions[i][1]
            else:
                balance += transactions[i][1]
    return abs(balance)


def crossover(parent1, parent2):
    if random.random() < P_CROSSOVER:
        crossover_point = random.randint(1, N - 1)     #crossoversing  if the random is less than pcrossover
        child1 = parent1[:crossover_point] + parent2[crossover_point:]
        child2 = parent2[:crossover_point] + parent1[crossover_point:]
    else:
        child1, child2 = parent1, parent2   #else dont change the chromosome and and make the child as parents
    return child1, child2


def mutation(chromosome):
    for i in range(N):
        if random.random() < P_MUTATION:
            chromosome[i] = 1 - chromosome[i]
    return chromosome


population = []
for i in range(POPULATION_SIZE):
    chromosome = [random.randint(0, 1) for _ in range(N)]
    population.append(chromosome)

for generation in range(MAX_GENERATIONS):

    fitnesses = [fitness(chromosome) for chromosome in population]
    best_fitness = min(fitnesses)
    best_index = fitnesses.index(best_fitness)
    best_chromosome = population[best_index]

    if best_fitness == 0:
        if sum(best_chromosome) == 0:
            print(-1)
            break
        else:
            # print(best_fitness)
            print(''.join(map(str, best_chromosome)))
            break

