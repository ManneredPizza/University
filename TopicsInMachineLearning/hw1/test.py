def generate_partitions(n, m):
    # Initialize a 2D array to store the partitions
    partitions = [[0] * (n + 1) for _ in range(m + 1)]

    # There's one way to make zero with any number of parts
    for i in range(m + 1):
        partitions[i][0] = 1

    # Fill the partition table using a bottom-up approach
    for i in range(1, m + 1):
        for j in range(1, n + 1):
            # If i is greater than the current sum, exclude it
            if i > j:
                partitions[i][j] = partitions[i - 1][j]
            else:
                # Include i in the sum
                partitions[i][j] = partitions[i - 1][j] + partitions[i][j - i]

    return partitions[m][n]

def generate_lists_with_sum(total_sum, num_elements):
    # Generate the partitions for the total sum using num_elements
    partitions = generate_partitions(total_sum, num_elements)

    lists = []
    # Generate the lists using the partitions
    def backtrack(current_sum, current_list, remaining_elements):
        if current_sum == total_sum and remaining_elements == 0:
            lists.append(current_list[:])
            return
        if current_sum > total_sum or remaining_elements == 0:
            return

        for i in range(1, total_sum + 1):
            if i + current_sum > total_sum:
                break
            current_list.append(i)
            backtrack(current_sum + i, current_list, remaining_elements - 1)
            current_list.pop()

    backtrack(0, [], num_elements)

    return lists

total_sum = 100
num_elements = 256

lists = generate_lists_with_sum(total_sum, num_elements)
for i, lst in enumerate(lists):
    print(f"List {i+1}: {lst}")

