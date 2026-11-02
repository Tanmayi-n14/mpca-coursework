.data
    signal:     .word 5, -3, 12, 7, 9, 0, -2, 15    # Given data [cite: 72]
    n:          .word 8                             # N=8 [cite: 73]
    stable_cnt: .word 0
    net_dev:    .word 0
    drop_cnt:   .word 0
    spike_idx:  .word -1

.text
main:
    la   x10, signal        # Load base address
    lw   x11, n             # Load N
    li   x12, 0             # Loop counter (i)
    li   x13, 0             # stable_cnt accumulator
    li   x14, 0             # net_dev accumulator
    li   x15, 0             # drop_cnt accumulator
    li   x16, -1            # spike_idx (default -1) [cite: 84]
    li   x17, 0             # Found spike flag (0 = no, 1 = yes)

loop:
    beq  x12, x11, end_loop # If i == N, exit [cite: 86]
    
    slli x18, x12, 2        # Offset = i * 4
    add  x18, x18, x10      # Address of signal[i]
    lw   x19, 0(x18)        # x19 = current value

    # 1. Stability Check (-5 to +5) [cite: 77]
    li   x20, -5
    li   x21, 5
    blt  x19, x20, check_net
    bge  x21, x19, is_stable
    j    check_net
is_stable:
    addi x13, x13, 1

check_net:
    # 2. Net Deviation & 3. Drop Events [cite: 79, 81]
    blt  x19, x0, is_negative
    add  x14, x14, x19      # Sum positive values
    j    check_spike
is_negative:
    sub  x14, x14, x19      # Subtract negative values (Net = Pos - Neg)
    addi x15, x15, 1        # Increment drop count

check_spike:
    # 4. First Spike Index (> 10) [cite: 83]
    li   x22, 10
    ble  x19, x22, next_iter
    bne  x17, x0, next_iter # If already found, don't update
    addi x16, x12, 0        # Store current index
    li   x17, 1             # Set found flag

next_iter:
    addi x12, x12, 1        # i++
    j    loop

end_loop:
    # Store results in memory
    la   x23, stable_cnt
    sw   x13, 0(x23)
    la   x23, net_dev
    sw   x14, 0(x23)
    la   x23, drop_cnt
    sw   x15, 0(x23)
    la   x23, spike_idx
    sw   x16, 0(x23)

    # Exit program
    li   a7, 10
    ecall