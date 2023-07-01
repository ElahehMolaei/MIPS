def bin_to_hex(bin_str):
  if len(bin_str) % 4 != 0: raise Exception("Invalid binary string: " + bin_str)
  out = ""
  for i in range(0, len(bin_str), 4): out += hex(int(bin_str[i:i+4], 2))[2:]
  return out

def hex_to_bin(hex_str):
  return bin(int(hex_str, 16))[2:].zfill(32)

def to_bin(num, bits):
  if num < 0:
    num = (1 << bits) + num
  return bin(num)[2:].zfill(bits)

def to_int(bin_str):
  if bin_str[0] == '1':
    return int(bin_str, 2) - (1 << len(bin_str))
  return int(bin_str, 2)

def to_machine_code(parts):
    if len(parts) == 2 and parts[0] == "jmp": 
      return bin_to_hex('1111' + to_bin(int(parts[1]), 12))

    opcode = '0000'
    rs1 = to_bin(int(parts[1]), 3)
    rs2 = to_bin(int(parts[2]), 3)
    rd = to_bin(int(parts[3]), 3)

    if parts[0] == "add": func = '000'
    elif parts[0] == "sub": func = '001'
    elif parts[0] == "and": func = '010'
    elif parts[0] == "or": func = '011'
    elif parts[0] == "xor": func = '100'
    elif parts[0] == "nor": func = '101'
    elif parts[0] == "slt": func = '110'
    else: opcode = None

    if opcode: return bin_to_hex(opcode + rs1 + rs2 + rd + func)
    elif parts[0] == "addi": opcode = '0001'
    elif parts[0] == "andi": opcode = '0010'
    elif parts[0] == "ori": opcode = '0011'
    elif parts[0] == "subi": opcode = '0100'

    if opcode: return bin_to_hex(opcode + rs1 + rs2 + to_bin(int(parts[3]), 6))
    elif parts[0] == "lw": opcode = '0111'
    elif parts[0] == "sw": opcode = '1000'

    if opcode: return bin_to_hex(opcode + rs1 + rs2 + to_bin(int(parts[3]), 6))
    elif parts[0] == "beq": opcode = '1001'
    elif parts[0] == "bne": opcode = '1010'
    elif parts[0] == "blt": opcode = '1011'
    elif parts[0] == "bgt": opcode = '1100'

    if opcode: return bin_to_hex(opcode + rs1 + rs2 + to_bin(int(parts[3]), 6))

    raise Exception("Invalid instruction: " + ' '.join(parts))

def main():
  main_asm = open("main.asm", "r")

  machine_codes = []

  for line in main_asm.readlines():
    parts = line.split()
    machine_codes.append(to_machine_code(parts))

  main_asm.close()
  ins_mem = open("INS_MEM.mem", "w+")
  for i in range(256):
    if i < len(machine_codes): ins_mem.write(machine_codes[i] + "\n")
    else: ins_mem.write("0000\n")
  ins_mem.close()


if __name__ == "__main__": main()
