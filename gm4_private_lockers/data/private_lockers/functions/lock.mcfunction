# @s = lock item on a chest or other container that has no lock
# run from check_lock

data modify block ~ ~ ~ Lock set from entity @s Item.tag.gm4_lock.combination
particle minecraft:block iron_block ~ ~1 ~ 0 0 0 1 10
playsound minecraft:block.chest.locked block @a[distance=..7] ~ ~ ~ 1 .7
advancement grant @a[distance=..7] only gm4:private_lockers
kill @s
