# @s = none
# located at world spawn
# run from smooshing/item_on_anvil

# prepare for item smooshing
execute as @e[type=item,tag=gm4_ml_on_anvil] at @s if block ~ ~ ~ minecraft:moving_piston align xyz if entity @e[type=item,dx=0,nbt=!{Item:{tag:{gm4_metallurgy:{has_shamir:1b}}}}] run function gm4_tinkering_compressors:smooshing/prepare_transfer

execute if entity @e[type=item,tag=gm4_ml_on_anvil,limit=1] run schedule function gm4_tinkering_compressors:smooshing/transfer_tick 1t
