# Remove chair and return saddle item
# @s = pig (chair) to be removed
# at @s positioned ~ ~.5 ~ / ^ ^.9 ^.2
# run from main / hit

# spawn saddle item
loot spawn ~ ~ ~ loot gm4_chairs:drop_saddle
tag @e[type=minecraft:item,distance=..1,limit=1,sort=nearest] add gm4_chairs_ignore

# dismount if sitting on chair
execute align xyz positioned ~.5 ~ ~.5 as @a[predicate=gm4_chairs:sitting_in_chair,distance=..0.5] at @s align y run tp @s ~ ~1 ~

# increase health to avoid visible death cloud
attribute @s minecraft:generic.max_health base set 5
data modify entity @s Health set value 5

# remove chair
tp @s ~ -10000 ~
