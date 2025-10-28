import random

print("-- VACAS Y TOROS --")
print("REGLAS: \n 1. No repetir números consecutivos \n 2. El número debe tener 4 dígitos")

num_digitos = 4

def generar_numero_aleatorio(n):
    while True:
        digitos = list('0123456789')
        random.shuffle(digitos)
        numero = ''.join(digitos[:n])
        if numero[0] == '0':
            continue
        consecutivo = any(numero[i] == numero[i+1] for i in range(len(numero)-1))
        if not consecutivo:
            return numero

def vacastoros(secret, guess):
    toros = sum(s == g for s, g in zip(secret, guess))

    secret_restante = [s for i, s in enumerate(secret) if secret[i] != guess[i]]
    guess_restante = [g for i, g in enumerate(guess) if secret[i] != guess[i]]

    vacas = 0
    for g in guess_restante:
        if g in secret_restante:
            vacas += 1
            secret_restante.remove(g)
    return vacas, toros

def tiene_consecutivos(numero):
    return any(numero[i] == numero[i+1] for i in range(len(numero)-1))

numero_secreto = generar_numero_aleatorio(num_digitos)
intentos = 0

while True:
    usuario = input("Adivine el número: ").strip()
    
    if len(usuario) != num_digitos or not usuario.isdigit():
        print(" No válido: debe tener 4 dígitos numéricos.")
        intentos += 1
        continue

    if tiene_consecutivos(usuario):
        print(" No se permiten números consecutivos iguales.")
        intentos += 1
        continue

    intentos += 1
    vacas, toros = vacastoros(numero_secreto, usuario)
    print(f" Vacas: {vacas} - Toros: {toros}")
    print("Intentos:", intentos)
    if toros == num_digitos:
        
        print(f"Acertaste, el número era {numero_secreto}. Intentos: {intentos}")
        break