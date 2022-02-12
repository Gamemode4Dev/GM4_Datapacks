# run from gm4_zauber_liquids:item_fill
# @s = tank being processed


# copy coords to storage for wormhole
execute store result storage gm4_zauber_cauldrons:blueprint/item/wormhole gm4_zauber_cauldrons.cauldron_pos.x int 1 run scoreboard players get @s gm4_zl_warp_cx
execute store result storage gm4_zauber_cauldrons:blueprint/item/wormhole gm4_zauber_cauldrons.cauldron_pos.y int 1 run scoreboard players get @s gm4_zl_warp_cy
execute store result storage gm4_zauber_cauldrons:blueprint/item/wormhole gm4_zauber_cauldrons.cauldron_pos.z int 1 run scoreboard players get @s gm4_zl_warp_cz
execute store result storage gm4_zauber_cauldrons:blueprint/item/wormhole gm4_zauber_cauldrons.cauldron_pos.dimension int 1 run scoreboard players get @s gm4_zl_warp_cd

# $item_value set in item_fill function for efficiency
loot replace entity @e[type=armor_stand,tag=gm4_liquid_tank_stand,limit=1,sort=nearest,distance=..1] weapon.mainhand loot gm4_zauber_cauldrons:recipes/chorus/wormhole
data modify storage gm4_liquid_tanks:temp/tank output set from entity @e[type=armor_stand,tag=gm4_liquid_tank_stand,limit=1,sort=nearest,distance=..1] HandItems[0]
item replace entity @e[type=armor_stand,tag=gm4_liquid_tank_stand,limit=1,sort=nearest,distance=..1] weapon.mainhand with air
function gm4_liquid_tanks:smart_item_fill
tag @s add gm4_lt_fill
