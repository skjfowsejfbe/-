def f1(x, y, f2):
    otvet = f2(x, y)
    print("Ответ = ", otvet)
def f2(x, y): return x + y
x = int(input())
y = int(input())
f1(x, y, f2)