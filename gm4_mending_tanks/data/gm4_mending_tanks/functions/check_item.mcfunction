#@s = experience liquid tank with item in first slot
#run from mending_tanks:item_fill

execute store result score $damage gm4_lt_util run data get storage gm4_liquid_tanks:temp/tank input_slot.tag.Damage
execute if score $damage gm4_lt_util matches 1.. run function gm4_mending_tanks:repair

# smart storage is bypassed within repair, which merges the data back to the tool itself.
