# @s = captured bat
# at @s
# run from bottle/hit

# store bat data
data modify storage gm4_bat_grenades:temp data.CustomName set from entity @s CustomName
data modify storage gm4_bat_grenades:temp data.Tags set from entity @s Tags

# remove bat
tp @s ~ -10000 ~
playsound minecraft:entity.bat.takeoff master @a[distance=..8] ~ ~ ~ 0.5 1.5
