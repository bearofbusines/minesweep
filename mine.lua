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

function boardIncrement(x, y)
	boardAppend(x,y,boardRead(x,y)+1)
end

function isValidBoardPlacement(x, y)
	return x >= 1 and x <= 9 and y >= 1 or y <= 9
end

function incrementSurroundingSquares(x,y)
	for offsetX=-1,1,1 do
		for offsetY=-1,1,1 do
			if isValidBoardPlacement(x+offsetX, y+offsetY) and boardRead(x+offsetX,y+offsetX)~='*' then
				boardIncrement(x+offsetX, y+offsetY)
			end
		end
	end
end

function lbn()--used to set the value of squares to the number of bombs around them
	for i=1,9,1 do
		for o=1,9,1 do
			if(boardRead(i,o)=='*') then
				incrementSurroundingSquares(x,y)
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

for i=1,9,1 do
	col = i 
	for o=1,9,1 do	
		row = o
		boardAppend(col,row,subc(random()))
	end
end

lbn()

print('welcome to minesweeper')
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
