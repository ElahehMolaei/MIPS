import math
import random

from assembler import to_bin, bin_to_hex

def main():
  d_mem = open('D_MEM.mem', 'w+')
  numbers = []
  lines = ['7fff']
  num_of_nums = int(input('Enter number of numbers that you want to oprate on: '))
  lines.append(bin_to_hex(to_bin(num_of_nums, 16)))
  for i in range(1022):
    if i < num_of_nums:
      num = random.randint(0, 100)
      numbers.append(num)
      print(f'Enter number {i+1}: {num}')
      lines.append(bin_to_hex(to_bin(num, 16)))
    else: lines.append('0000')
  d_mem.write('\n'.join(lines))
  d_mem.close()
  maximum = max(numbers)
  minimum = min(numbers)
  average = math.ceil(sum(numbers)/len(numbers))
  print(f'\nMaximum: {maximum} 0x{bin_to_hex(to_bin(maximum, 16))}')
  print(f'Minimum: {minimum} 0x{bin_to_hex(to_bin(minimum, 16))}')
  print(f'Average: {average} 0x{bin_to_hex(to_bin(average, 16))}\n')

if __name__ == '__main__': main()