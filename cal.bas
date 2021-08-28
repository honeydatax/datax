#include "vbcompat.bi"
dim mm as integer
dim md(1 to 12) as integer
dim a as string
dim i as integer
dim w as integer
dim xx as integer
dim yy as integer
dim y as integer
dim m as integer
dim d as integer
dim wd as integer
dim dt as double
color 15,5
cls
	for i=1 to 12
		read md(i)
	next 
	read a
	dt=now
	m=month(dt)
	y=year(dt)
	print " ";y
	print " " + monthname(m)
	print " "+a
	dt=dateserial(y,m,1)
	w=weekday(dt)
	if m=2 then
			mm=int(y/4)
			if mm*4=y then md(2)=29
	end if
	w=w-1
	if w>6 then w=0
	if w > 0 then print space(3*w);
	print " ";
		for mm=1 to md(m)
		a=space(3)
		lset a,trim(str(mm))
		print a;
		w=w+1
		if w>6 then
			w=0
			print
			print " ";
		end if
	next 
print
data 31,28,31,30,31,30,31,31,30,31,30,31
data "Su Mo Tu We Th Fr Sa"
