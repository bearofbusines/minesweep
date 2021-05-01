print('welcome to minesweeper')
--setup
	bomb=0
	a = {}
	b = {}
	c = {}
	d = {}
	e = {}
	f = {}
	g = {}
	h = {}
	i = {}
	board={a,b,c,d,e,f,g,h,i}
	j = {}
	k = {}
	l = {}
	m = {}
	n = {}
	o = {}
	p = {}
	q = {}
	r = {}
	boardf={j,k,l,m,n,o,p,q,r}
	--functions


		function random()
			ramd=os.clock()
			tempramd=ramd
			if nil == check then
				check = ramd
			end
			repeat
			ramd=ramd*10
			tempramd=ramd
			until tempramd == math.floor(ramd)
			ramd = ramd-10*math.floor(tempramd/10)
			if ramd==0 or ramd == check then
			random()
			end
			
			check = ramd
			return ramd

		end

		function boardRead(x,y)
			temp = board[x]
			return temp[y]
		end

		function boardAppend(x,y,z)
			temp = board[x]
			temp[y]=z
		end

		function subc(v)
			if v==2 or v==3 or v==5 then
				bomb=bomb+1
				return '*'
			else
				return 0
			end
		end
		function boardDisp() --displays the back board
			for p=1,9,1 do
				tempd=board[p]
				disp=tostring(tempd[1])
				for q=2,9,1 do
					tempt=tempd[q]
					disp=disp..']['..tempt
				end
				disp='['..disp..']'
				print(disp)
			end
		end

	for i=1,9,1 do
		col = i 
		for o=1,9,1 do	
			row = o
			boardAppend(col,row,subc(random()))
		end
	end

	function boardReadf(x,y) --reads the front board
		temp = boardf[x]
		return temp[y]
	end

	function boardAppendf(x,y,z) --appends the front board
		temp = boardf[x]
		temp[y]=z
	end




	
	for i=1,9,1 do --populates the empty board
	col = i 
		for o=1,9,1 do	
			row = o
			boardAppendf(col,row,' ')
		end
	end

	function boardDispf()--displays the blank board
		print('  1  2  3  4  5  6  7  8  9 columns')
		for p=1,9,1 do
			tempd=boardf[p]
			disp=tostring(tempd[1])
			for q=2,9,1 do
				tempt=tempd[q]
				disp=disp..']['..tempt
			end
			disp=p..'['..disp..']'
			print(disp)
		end
		print('rows')
	end



  function lbn()--used to add one to a close squares to bombs
		for i=1,9,1 do
			col = i 
			for o=1,9,1 do	
				row = o
				if boardRead(i,o)=='*' and i ~= 1 and i ~= 9 and o ~= 1 and o ~= 9 then
					centera={1,-1,1,-1,1,-1,0,0}
					centerb={0,0,1,1,-1,-1,1,-1}
					for m=1,8,1 do
						if boardRead(i+centera[m],o+centerb[m])~='*' then
							boardAppend(i+centera[m],o+centerb[m],boardRead(i+centera[m],o+centerb[m])+1) end
					end
				end
				if i==1 and o==1 and  boardRead(i,o)=='*' then
					cornertla={0,1,1}
					cornertlb={1,1,0}
					for m=1,8,1 do
						if boardRead(i+cornertla[m],o+cornertlb[m])~='*' then
							boardAppend(i+cornertla[m],o+cornertlb[m],boardRead(i+cornertla[m],o+cornertlb[m])+1) end
						end
				end
				if i==9 and o==1 and  boardRead(i,o)=='*' then
					cornerbla={0,-1,-1}
					cornerblb={1,1,0}
					for m=1,8,1 do
						if boardRead(i+cornerbla[m],o+cornerblb[m])~='*' then
							boardAppend(i+cornerbla[m],o+cornerblb[m],boardRead(i+cornerbla[m],o+cornerblb[m])+1) end
					end
				end
				if i==1 and o==9 and  boardRead(i,o)=='*' then
					if boardRead(i,o-1)~='*' then
						boardAppend(i,o-1,boardRead(i,o-1)+1) end
					if boardRead(i+1,o-1)~='*' then
						boardAppend(i+1,o-1,boardRead(i+1,o-1)+1) end
					if boardRead(i+1,o)~='*' then
						boardAppend(i+1,o,boardRead(i+1,o)+1) end
				end
				if i==9 and o==9 and  boardRead(i,o)=='*' then
					if boardRead(i,o-1)~='*' then
						boardAppend(i,o-1,boardRead(i,o-1)+1) end
					if boardRead(i-1,o-1)~='*' then
						boardAppend(i-1,o-1,boardRead(i-1,o-1)+1) end
					if boardRead(i-1,o)~='*' then
						boardAppend(i-1,o,boardRead(i-1,o)+1) end
				end
				if boardRead(i,o)=='*' and i == 9 and o ~= 9 and o ~= 1 then
					if boardRead(i-1,o)~='*' then
						boardAppend(i-1,o,boardRead(i-1,o)+1) end

					if boardRead(i-1,o+1)~='*' then
						boardAppend(i-1,o+1,boardRead(i-1,o+1)+1) end

					if boardRead(i-1,o-1)~='*' then
						boardAppend(i-1,o-1,boardRead(i-1,o-1)+1) end

					if boardRead(i,o+1)~='*' then
						boardAppend(i,o+1,boardRead(i,o+1)+1) end

					if boardRead(i,o-1)~='*' then
						boardAppend(i,o-1,boardRead(i,o-1)+1) end
				end
				if boardRead(i,o)=='*' and i == 1 and o ~= 9 and o ~= 1 then
					if boardRead(i+1,o)~='*' then
						boardAppend(i+1,o,boardRead(i+1,o)+1) end

					if boardRead(i+1,o+1)~='*' then
						boardAppend(i+1,o+1,boardRead(i+1,o+1)+1) end

					if boardRead(i+1,o-1)~='*' then
						boardAppend(i+1,o-1,boardRead(i+1,o-1)+1) end

					if boardRead(i,o+1)~='*' then
						boardAppend(i,o+1,boardRead(i,o+1)+1) end

					if boardRead(i,o-1)~='*' then
						boardAppend(i,o-1,boardRead(i,o-1)+1) end
				end
			if boardRead(i,o)=='*' and o == 9 and i ~= 9 and i ~= 1 then
					if boardRead(i+1,o)~='*' then
						boardAppend(i+1,o,boardRead(i+1,o)+1) end

					if boardRead(i-1,o)~='*' then
						boardAppend(i-1,o,boardRead(i-1,o)+1) end

					if boardRead(i+1,o-1)~='*' then
						boardAppend(i+1,o-1,boardRead(i+1,o-1)+1) end

					if boardRead(i-1,o-1)~='*' then
						boardAppend(i-1,o-1,boardRead(i-1,o-1)+1) end

					if boardRead(i,o-1)~='*' then
						boardAppend(i,o-1,boardRead(i,o-1)+1) end
				end
				if boardRead(i,o)=='*' and o == 1 and i ~= 9 and i ~= 1 then
					if boardRead(i+1,o)~='*' then
						boardAppend(i+1,o,boardRead(i+1,o)+1) end

					if boardRead(i-1,o)~='*' then
						boardAppend(i-1,o,boardRead(i-1,o)+1) end

					if boardRead(i+1,o+1)~='*' then
						boardAppend(i+1,o+1,boardRead(i+1,o+1)+1) end

					if boardRead(i-1,o+1)~='*' then
						boardAppend(i-1,o+1,boardRead(i-1,o+1)+1) end

					if boardRead(i,o+1)~='*' then
						boardAppend(i,o+1,boardRead(i,o+1)+1) end
				end
			end
		end
	end

	function userx()
		print('chose a row chose numbers from 1-9')
		x=io.read('*n')
		if x== 10 then
			boardDisp()
			x=1
		end

		if x > 10 or x==0 then
		print('that number is too high or low')
		return userx()
		else
			return x
		end
	end

	function usery()
		print('chose a column chose numbers from 1-9')
		y=io.read('*n')
				if y > 10 or y==0 then
		print('that number is too high of low')
		return usery()
		else
			return y
		end
	end

	function winc()
		win =0
		for i=1,9,1 do
			col = i 
			for o=1,9,1 do	
				row = o
				if ' ' ~= boardReadf(col,row) then 
					win = win + 1
				end
			end	
		end
	end
	lbn()


while 1==1 do
	boardDispf()
	boardAppendf(userx(),usery(),boardRead(x,y))
	if boardRead(x,y)=='*' then
		boardDisp()
		print('Game Over')
		break
	end
	winc()
	if win==(81-bomb) then
		print('You win')
		break
	end
end
