from itertools import product

s = '—'  # Separator for division

for i, j, k in product(range(1, 10), repeat=3):
    if i == j == k:
        continue

    dividend = int(f'{i}{j}')
    divisor  = int(f'{j}{k}')

    if dividend / divisor == i / k:
        print(f' {i}{j}   {i}{j}̶   {i}\n'
              f' {s}{s} = {s}{s} = {s}\n'
              f' {j}{k}   {j}̶{k}   {k}\n')
