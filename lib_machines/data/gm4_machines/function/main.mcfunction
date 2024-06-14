# runs every 16t
# @s = none
# located at world spawn
# run from gm4_machines:load

schedule function gm4_machines:main 16t

# check if a new minecart machine has been spawned (via dispenser, since placed by player is detected via advancement)
execute if entity @e[type=#gm4:minecarts,tag=!gm4_machine_checked,limit=1] run function gm4_machines:place_down/place_machine_cart
