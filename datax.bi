#include once "string.bi"
public const falses=0
public const trues=not falses

public type records
	deletes as byte
	ref as integer
	dates as string*8
	refs as string*32
	value as double
end type


public sub recor(f as integer)
	dim recordsuse as records
	dim index as integer
	dim eofs as integer
	eofs=eof(f)
	while eofs<>trues
		get #f,,recordsuse
		if recordsuse.deletes=trues then
			index=seek(f)
			if index>=1 then
				index=index-1
			else
				index=0
			end if
			seek f,index
			eofs=trues
		end if
		if eofs<>trues then eofs=eof(f)
	wend
end sub
public function adds(files as string,recordss as records)as integer
	dim f as integer
	f=freefile()
	open files for random as f len=sizeof(records)
	recor(f)
	put #f,,recordss
	close f
	return trues
end function

public function report(files as string, refss as integer,freport as string)as double
	dim f as integer
	dim ff as integer
	dim fff as integer
	dim sums as double
	dim recordsuse as records
	dim index as integer
	dim eofs as integer
	f=freefile()
	eofs=eof(f)
	open files for random as f len=sizeof(records)
	ff=freefile()
	open freport for output as ff 
	eofs=eof(f)
	while eofs<>trues
		get #f,,recordsuse
		if (recordsuse.ref=-1 and recordsuse.deletes=falses)or(recordsuse.ref=refss and recordsuse.deletes=falses)  then
			fff=len(trim(recordsuse.dates))
			print #ff,space(8-fff)+trim(recordsuse.dates);
			fff=len(trim(recordsuse.refs))
			print #ff,"|"+space(32-fff)+trim(recordsuse.refs);
			print #ff,using "|############.00";recordsuse.value;
			sums=sums+recordsuse.value
			print #ff,using "|############.00";sums
		end if
		eofs=eof(f)
	wend
	close f
	close ff
	return sums
end function
