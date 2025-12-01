# @s = vibro player sneaking on the ground
# run from gm4_metallurgy:tick

# add sneak number
scoreboard players add @s gm4_vibro_sneak 1

# apply jump boost based on sneak number
attribute @s[scores={gm4_vibro_sneak=1}] jump_strength modifier add gm4_vibro_shamir:jump_boost 0.4 add_value

attribute @s[scores={gm4_vibro_sneak=6}] jump_strength modifier remove gm4_vibro_shamir:jump_boost
attribute @s[scores={gm4_vibro_sneak=6}] jump_strength modifier add gm4_vibro_shamir:jump_boost 0.6 add_value

attribute @s[scores={gm4_vibro_sneak=11}] jump_strength modifier remove gm4_vibro_shamir:jump_boost
attribute @s[scores={gm4_vibro_sneak=11}] jump_strength modifier add gm4_vibro_shamir:jump_boost 0.7 add_value

attribute @s[scores={gm4_vibro_sneak=16}] jump_strength modifier remove gm4_vibro_shamir:jump_boost
attribute @s[scores={gm4_vibro_sneak=16}] jump_strength modifier add gm4_vibro_shamir:jump_boost 1.0 add_value

# playsound (A Major Scale)
execute if score @s gm4_vibro_sneak matches 1 run playsound minecraft:block.stone.step block @a[distance=..8] ~ ~ ~ 0.6 1.189207
execute if score @s gm4_vibro_sneak matches 6 run playsound minecraft:block.stone.step block @a[distance=..8] ~ ~ ~ 0.6 1.259921
execute if score @s gm4_vibro_sneak matches 11 run playsound minecraft:block.stone.step block @a[distance=..8] ~ ~ ~ 0.6 1.334840
execute if score @s gm4_vibro_sneak matches 16 run playsound minecraft:block.stone.step block @a[distance=..8] ~ ~ ~ 0.6 1.498307
