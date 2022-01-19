# @s = armor_stand to be modified
# at @s
# run from toggle/arms/check and toggle/arms/select

tp @e[type=wandering_trader,tag=gm4_bas_arms_detect,distance=..1,sort=nearest,limit=1] ~ -10000 ~
tag @s remove gm4_bas_no_arms
