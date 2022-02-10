# @s = vibro player sneaking on the ground
# run from gm4_metallurgy:tick

# add sneak number
scoreboard players add @s gm4_vibro_sneak 1

# apply jump boost based on sneak number
effect give @s[scores={gm4_vibro_sneak=1..5}] jump_boost 1 3 false
effect give @s[scores={gm4_vibro_sneak=6..10}] jump_boost 1 5 false
effect give @s[scores={gm4_vibro_sneak=11..15}] jump_boost 1 6 false
effect give @s[scores={gm4_vibro_sneak=16..}] jump_boost 1 9 false

# playsound (A Major Scale)
execute if score @s gm4_vibro_sneak matches 1 run playsound minecraft:block.stone.step block @a[distance=..8] ~ ~ ~ 0.6 1.189207
execute if score @s gm4_vibro_sneak matches 6 run playsound minecraft:block.stone.step block @a[distance=..8] ~ ~ ~ 0.6 1.259921
execute if score @s gm4_vibro_sneak matches 11 run playsound minecraft:block.stone.step block @a[distance=..8] ~ ~ ~ 0.6 1.334840
execute if score @s gm4_vibro_sneak matches 16 run playsound minecraft:block.stone.step block @a[distance=..8] ~ ~ ~ 0.6 1.498307
