os.loadAPI("conrad")
args = {...}
conrad.loadCoords()
conrad.goTo(
  tonumber(args[1]),
  tonumber(args[2]))
