#ifndef DEBOUNCER_H
#define DEBOUNCER_H

#include <stdint.h>
#include <stdbool.h>

typedef struct {
    uint16_t shift_reg;
    uint8_t state;
    uint8_t rising_edge;
    uint8_t falling_edge;
    uint8_t active_low;
} Debouncer;

void debouncer_init(Debouncer *d);
void debouncer_update(Debouncer *d, uint8_t raw_input);
void debouncer_set_active_low(Debouncer *d, uint8_t enable);

#endif // DEBOUNCER_H
