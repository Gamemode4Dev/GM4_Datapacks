summon marker ~ ~0.5 ~ {Tags:["gm4_sapling_new"]}
data modify entity @e[type=marker,tag=gm4_sapling_new,limit=1] CustomName set from entity @s CustomName
data modify entity @e[type=marker,tag=gm4_sapling_new,limit=1] Tags set from entity @s Tags
kill @s
