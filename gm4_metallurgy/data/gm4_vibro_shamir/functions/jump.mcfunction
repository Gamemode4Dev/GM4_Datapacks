# @s = vibro player sneaking on the ground
# run from gm4_metallurgy:tick

# add sneak number
scoreboard players add @s gm4_vibro_sneak 1

# apply jump boost based on sneak number
effect give @s[scores={gm4_vibro_sneak=1..3}] jump_boost 1 3 false
effect give @s[scores={gm4_vibro_sneak=4..6}] jump_boost 1 5 false
effect give @s[scores={gm4_vibro_sneak=7..9}] jump_boost 1 6 false
effect give @s[scores={gm4_vibro_sneak=10..}] jump_boost 1 9 false

# playsound (A Major Scale)
execute if score @s gm4_vibro_sneak matches 1 run playsound minecraft:block.stone.step block @a[distance=..8] ~ ~ ~ 0.6 1.189207
execute if score @s gm4_vibro_sneak matches 4 run playsound minecraft:block.stone.step block @a[distance=..8] ~ ~ ~ 0.6 1.259921
execute if score @s gm4_vibro_sneak matches 7 run playsound minecraft:block.stone.step block @a[distance=..8] ~ ~ ~ 0.6 1.334840
execute if score @s gm4_vibro_sneak matches 10 run playsound minecraft:block.stone.step block @a[distance=..8] ~ ~ ~ 0.6 1.498307
