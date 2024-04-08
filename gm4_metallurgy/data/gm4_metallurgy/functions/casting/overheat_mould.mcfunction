# creates lava & fire in place of a destroyed mould when broken whilst still hot
# @s = moulds that need to explode in fire and Death
# at @s positioned ~ ~1.23 ~ (at the x-z location of the mould, just above the surface of the sand)
# run from destroy_mould

setblock ~ ~-1 ~ lava[level=1]
summon item ~ ~ ~ {Item:{id:"minecraft:magma_block",count:1,components:{"minecraft:lore":['{"translate":"item.gm4.slightly_overheated_obsidian","fallback":"Slightly Overheated Obsidian","italic":false}']}},Motion:[0.0,0.2,0.0]}
particle large_smoke ~ ~ ~ 0.2 0.2 0.2 0.05 20
playsound block.fire.extinguish block @a ~ ~ ~ .25 .9
fill ~1 ~1 ~1 ~-1 ~-1 ~-1 fire replace air
advancement grant @a[distance=..5,gamemode=!spectator] only gm4:metallurgy_overheat_cast
