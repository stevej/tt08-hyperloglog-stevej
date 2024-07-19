<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

HyperLogLog is a solution to the `count-distinct` problem, a space efficient implementation that tracks an approximation of how many distinct elements of a multiset.

This particular implementation tracks 128-bit values with the motivation of an ethernet switch tracking disinct count of IPv6 addresses it has seen.

## How to test

Write 128-bit values into addr 0 using SPI writes.
Read a 128-bit value from addr 0 using SPI read.
The read will give you an estimate for the total number of unique 128-bit values that have been written.


## External hardware

No external hardware is required but this is an SPI slave and can be used as such and has been tested with an icebreaker FPGA and a Raspberry PI 2040.
