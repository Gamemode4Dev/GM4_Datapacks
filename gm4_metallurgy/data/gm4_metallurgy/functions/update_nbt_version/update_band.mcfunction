# updates NBT of pre-PR#487 (band recycling) bands to the new format. This function may be removed in the distant future.
# @s = band item with outdated NBT
# run from update_nbt_version/load_nbt

execute if data storage gm4_metallurgy:temp/item/band gm4_metallurgy{ore_type:"aluminium"} run data modify storage gm4_metallurgy:temp/item/band gm4_metallurgy.metal set value {amount:[12s],type:"aluminium",castable:1b}
execute if data storage gm4_metallurgy:temp/item/band gm4_metallurgy{ore_type:"barimium"} run data modify storage gm4_metallurgy:temp/item/band gm4_metallurgy.metal set value {amount:[9s,3s],type:"barimium",castable:1b}
execute if data storage gm4_metallurgy:temp/item/band gm4_metallurgy{ore_type:"barium"} run data modify storage gm4_metallurgy:temp/item/band gm4_metallurgy.metal set value {amount:[12s],type:"barium",castable:1b}
execute if data storage gm4_metallurgy:temp/item/band gm4_metallurgy{ore_type:"copper"} run data modify storage gm4_metallurgy:temp/item/band gm4_metallurgy.metal set value {amount:[12s],type:"bismuth",castable:1b}
execute if data storage gm4_metallurgy:temp/item/band gm4_metallurgy{ore_type:"thorium"} run data modify storage gm4_metallurgy:temp/item/band gm4_metallurgy.metal set value {amount:[12s],type:"thorium",castable:1b}
execute if data storage gm4_metallurgy:temp/item/band gm4_metallurgy{ore_type:"thorium_brass"} run data modify storage gm4_metallurgy:temp/item/band gm4_metallurgy.metal set value {amount:[9s,3s],type:"curies_bismium",castable:1b}

data merge storage gm4_metallurgy:temp/item/band {gm4_metallurgy:{item:"obsidian_cast"}}
data remove storage gm4_metallurgy:temp/item/band gm4_metallurgy.ore_type

# overwrite source entity NBT with updated NBT
data modify entity @s Item.tag.gm4_metallurgy set from storage gm4_metallurgy:temp/item/band gm4_metallurgy
