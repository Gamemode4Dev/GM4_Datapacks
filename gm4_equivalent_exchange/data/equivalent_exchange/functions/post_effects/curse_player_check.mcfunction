#@s = players with curse
#Run from post_effect/random_events

playsound minecraft:entity.wither.spawn block @s ~ ~ ~ 0.2 1
particle minecraft:elder_guardian
effect give @s nausea 20 0 false
effect give @s hunger 20 4 false
effect give @s instant_damage
