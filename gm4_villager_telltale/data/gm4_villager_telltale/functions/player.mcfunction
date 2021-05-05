
# get nbt and check held item
function gm4_villager_telltale:player/get_nbt
function gm4_villager_telltale:player/check_held_item

# execute as nearest villager
execute if entity @s[tag=gm4_vt_show_job] as @e[type=villager,sort=nearest,limit=1,distance=..4] at @s run function gm4_villager_telltale:villager/locate_job
execute if entity @s[tag=gm4_vt_show_bell] as @e[type=villager,sort=nearest,limit=1,distance=..4] at @s run function gm4_villager_telltale:villager/locate_bell
execute if entity @s[tag=gm4_vt_show_bed] as @e[type=villager,sort=nearest,limit=1,distance=..4] at @s run function gm4_villager_telltale:villager/locate_bed