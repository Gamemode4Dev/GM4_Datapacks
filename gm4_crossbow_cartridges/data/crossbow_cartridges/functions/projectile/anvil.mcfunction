#run from check_projectile
# @s = player using the crossbow

#summon anvil (as falling block entity) at player's location
summon minecraft:falling_block ~ ~ ~ {BlockState:{Name:"minecraft:anvil"},Time:-2147483648,Tags:["gm4_cb_proj"]}
execute unless entity @s[gamemode=creative] run clear @s minecraft:anvil 1

#move motion of arrow to potion
function crossbow_cartridges:projectile/arrow_motion
