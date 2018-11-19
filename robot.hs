robot (name, attack, hp) = \msg -> msg (name, attack, hp)

name (n, _, _) = n
attack (_, a, _) = a
hp (_, _, h) = h

getName aRobot = aRobot name
getAttack aRobot = aRobot attack
getHp aRobot = aRobot hp

setName aRobot newName = aRobot (\(n, a, h) -> robot (newName, a, h))
setAttack aRobot newAttack = aRobot (\(n, a, h) -> robot (n, newAttack, h))
setHp aRobot newHp = aRobot (\(n, a, h) -> robot (n, a, newHp))

printRobot aRobot = 
  aRobot (\(n, a, h) -> "Name: " ++ n ++ "; Attack: " ++ (show a) ++ "; HP: " ++ (show h))
  
damage aRobot attackDamage = 
  aRobot (\(n, a, h) -> robot (n, a, h-attackDamage))
    
killerRobot = robot ("kill3r", 9, 56)
docileRobot = robot ("docil<3", 4, 99)

fight aRobot defender = 
  damage defender attack
  where attack =  if getHp aRobot > 10              
                  then getAttack aRobot
                  else 0

newDocile1 = fight killerRobot docileRobot  -- new Docile Robot after round 1 of attack by Killer
newKiller1 = fight newDocile1 killerRobot   -- new Killer Robot after round 1 of docile robot

newDocile2 = fight newKiller1 newDocile1
newKiller2 = fight newDocile2 newKiller1

newDocile3 = fight newKiller2 newDocile2
newKiller3 = fight newDocile3 newKiller2

fastRobot = robot ("speedy", 15, 40)
slowRobot = robot ("slowmo", 20, 30)

-- fastRobot1 = fight slowRobot fastRobot
-- slowRobot1 = fight fastRobot slowRobot

-- fastRobot2 = fight slowRobot1 fastRobot1
-- slowRobot2 = fight fastRobot1 slowRobot1

-- fastRobot3 = fight slowRobot2 fastRobot2
-- slowRobot3 = fight fastRobot2 slowRobot2

-- listOfRobots = [ fastRobot, fastRobot1, fastRobot2, fastRobot3, slowRobot, slowRobot1, slowRobot2, slowRobot3, killerRobot, newKiller1, newKiller2, newKiller3, docileRobot, newDocile1, newDocile2, newDocile3]

-- newList = map (\robot -> robot (\(_, _, h) -> h)) listOfRobots

threeRoundFight robot1 robot2 = 