xsize = 34
ysize = 19
x = 0
y = 0
currentSlot = 1
turtle.turnLeft()
while x < xsize do
  while y < ysize do
    while turtle.getItemCount(currentSlot) == 0 do
      currentSlot = currentSlot + 1
      turtle.select(currentSlot)
    end
    turtle.digDown()
    turtle.placeDown()
    turtle.forward()
    y = y + 1
  end
  if x % 2 == 0 then
    turtle.turnRight()
    turtle.forward()
    turtle.turnRight()
  else
    turtle.turnLeft()
    turtle.forward()
    turtle.turnLeft()
  end
  x = x + 1
  y = 0
end
