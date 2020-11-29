def vendas(n):
    acc = 0
    for _ in range(n):
        full = input()
        qtd, val = full.split()
        acc += int(qtd) * float(val)
    return acc


if __name__ == '__main__':
    print(vendas(3))