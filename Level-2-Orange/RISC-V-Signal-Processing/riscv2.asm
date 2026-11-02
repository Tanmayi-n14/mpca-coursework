.data
    n_val:    .word 7         # Input value N [cite: 92]
    is_even:  .word 0         # Result: 1 if even 
    is_prime: .word 0         # Result: 1 if prime 
    is_fact:  .word 0         # Result: 1 if factorial 

.text
main:
    lw   x10, n_val          # Load N into x10

    # --- 1. Even/Odd Check ---
    andi x11, x10, 1         # Extract LSB; if LSB is 0, number is even
    beq  x11, x0, set_even
    li   x12, 0              # It is odd
    j    prime_check
set_even:
    li   x12, 1              # It is even
prime_check:
    la   x13, is_even
    sw   x12, 0(x13)         # Store even/odd result

    # --- 2. Prime Check ---
    li   x14, 1
    ble  x10, x14, not_prime # N <= 1 is not prime
    li   x14, 2              # Divisor d = 2
prime_loop:
    mul  x15, x14, x14       # x15 = d * d
    blt  x10, x15, set_prime # If N < d*d, then N is prime (Replaced 'gt')
    rem  x16, x10, x14       # x16 = N % d
    beq  x16, x0, not_prime  # If N % d == 0, not prime
    addi x14, x14, 1         # d++
    j    prime_loop
set_prime:
    li   x17, 1
    j    store_prime
not_prime:
    li   x17, 0
store_prime:
    la   x13, is_prime
    sw   x17, 0(x13)

    # --- 3. Factorial Check ---
    li   x18, 1              # Current factorial product
    li   x19, 1              # Multiplier counter
fact_loop:
    beq  x18, x10, set_fact  # If product == N, N is a factorial
    blt  x10, x18, not_fact  # If product > N, N is not a factorial
    addi x19, x19, 1         # counter++
    mul  x18, x18, x19       # product = product * counter
    j    fact_loop
set_fact:
    li   x20, 1
    j    store_fact
not_fact:
    li   x20, 0
store_fact:
    la   x13, is_fact
    sw   x20, 0(x13)

    li   a7, 10              # Exit [cite: 100]
    ecall