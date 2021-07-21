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

