# @s = soul fragment that is dying due to their linked player being at max hearts
# at @s
# from soul_fragment/process

stopsound @a[distance=..22] neutral minecraft:block.beacon.ambient
playsound minecraft:block.redstone_torch.burnout player @a[distance=..10] ~ ~ ~ .8 2

kill @s
