#run from projectile/redstone_torch/loop
# @s = @e[type=minecraft:arrow,tag=gm4_cb_rtorch,nbt={inGround:1b}]

#summon torch item if torch already exists at this block
execute if block ~ ~ ~ #gm4_crossbow_cartridges:torch run loot spawn ~ ~ ~ loot gm4_crossbow_cartridges:redstone_torch

#place torch if possible
execute if block ~ ~ ~ #gm4:replaceable run function gm4_crossbow_cartridges:projectile/redstone_torch/place

#summon torch item if placing torch failed
execute unless block ~ ~ ~ #gm4_crossbow_cartridges:torch run loot spawn ~ ~ ~ loot gm4_crossbow_cartridges:redstone_torch

#place block sound
playsound minecraft:block.wood.place block @a[distance=..15]

#kill arrow
kill @s
