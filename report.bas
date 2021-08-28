#include once "datax.bi"
const table1="datax.dat"
const report1="report.txt"
dim recordsuse as records
color 15,5
cls
recordsuse.deletes=falses
recordsuse.ref=0
recordsuse.dates="21-07-30"
recordsuse.refs="hello 1"
recordsuse.value=100.99
print sizeof (records)

adds(table1,recordsuse)

recordsuse.deletes=falses
recordsuse.ref=0
recordsuse.dates="21-07-29"
recordsuse.refs="hello 2"
recordsuse.value=200.99

adds(table1,recordsuse)
print report1
report(table1,0,report1)
