# @s = zauber cauldron
# at @s
# run from cauldron/structure/validate/liquid

# check whether there is a cauldron at the zauber cauldron's position
execute store success score @s gm4_zc_rabtarget if block ~ ~ ~ minecraft:cauldron

# if there is a cauldron, it must be empty (condition for this function to be called)
# enable rabbit teleportation for empty cauldron
execute if score @s gm4_zc_rabtarget matches 1 align xyz if entity @e[type=rabbit,dx=0,dy=0,dz=0,limit=1] if entity @a[gamemode=!spectator,predicate=gm4_zauber_cauldrons:player/equipment/armor/full,distance=..2] run function gm4_zauber_cauldrons:cauldron/rabbit_teleportation

# kill zauber cauldron if no cauldron is present
execute if score @s gm4_zc_rabtarget matches 0 run kill @s
