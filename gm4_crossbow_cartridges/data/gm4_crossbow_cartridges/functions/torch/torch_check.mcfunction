#run from arrow_in_ground
# @s = @e[type=minecraft:arrow,tag=gm4_cb_torch,nbt={inGround:1b}]
# at @s

#summon torch item if torch already exists at this block
execute if block ~ ~ ~ #gm4_crossbow_cartridges:torch run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:torch",Count:1b}}

#place torch if possible
execute if block ~ ~ ~ #gm4_crossbow_cartridges:replaceable run function gm4_crossbow_cartridges:torch/torch_place

#summon torch item if placing torch failed
execute unless block ~ ~ ~ #gm4_crossbow_cartridges:torch run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:torch",Count:1b}}

#place block sound
playsound minecraft:block.wood.place block @a[distance=..15]

#kill arrow
kill @s
