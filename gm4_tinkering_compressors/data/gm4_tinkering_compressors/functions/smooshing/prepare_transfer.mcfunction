# @s = item being crushed by a piston that has a shamir
# run from smooshing/transfer_tick

tag @s add gm4_ml_source
execute if data entity @s Item.tag.gm4_metallurgy{stored_shamir:"tinker"} run function gm4_tinkering_compressors:smooshing/add_band/check
execute if data entity @s Item.tag.gm4_machines{id:"tinkering_compressor"} as @e[type=item,dx=0,limit=1,nbt={Item:{Count:1b,id:"minecraft:obsidian"}}] run function gm4_tinkering_compressors:smooshing/remove_band/found_obsidian
tag @s remove gm4_ml_source
