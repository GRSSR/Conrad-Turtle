args = {...}
os.loadAPI("/.sys/turtle/conrad")

conrad.loadCoords()
if args[1] == "resume" then
  conrad.loadCoords()
  x = conrad.getCoords()[1]
  y = conrad.getCoords()[2]
  z = math.abs(conrad.getCoords()[3])
  opts = conrad.readKVPairs("progress")
  xsize = tonumber(opts["x"])
  ysize = tonumber(opts["y"])
  zsize = tonumber(opts["z"])
  skip = true
else
  print("Creating a room of size", args[1], args[2], args[3])
  xsize = tonumber(args[1])
  ysize = tonumber(args[2])
  zsize = tonumber(args[3])
  x = 0
  y = 0
  z = 0
  f = io.open("progress", "w")
  f:write("x="..xsize.."\ny="..ysize.."\nz="..zsize)
  f:close()
  skip = false
end



while z < zsize do
  if z ~= 0 and not skip then
    x = 0
    if not conrad.goTo(0,0) then
      error("cannot return home")
    end
    turtle.digDown()
    conrad.down()
  end

  while x < xsize do
    if x ~= 0 and not skip then 
      turn()
      turtle.dig()
      conrad.forward()
      turn()
    end

    move = ysize -2
    if skip then
      skip = false
      move = move - y
    end

    turtle.dig()
    if not conrad.forward(
        move,
        turtle.dig
        ) then
      progress = conrad.getCoords()
      error("failed to move")
      exit()
    end
    conrad.forward()
    if x % 2 == 0 then
      turn = conrad.turnRight
    else
      turn = conrad.turnLeft
    end
    x = x + 1
  end
  z = z + 1
end
