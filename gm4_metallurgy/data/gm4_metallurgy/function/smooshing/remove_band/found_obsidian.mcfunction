# @s = item being crushed by a piston that has a shamir
# run from smooshing/remove_band/check

function gm4_metallurgy:smooshing/remove_band/spawn_band with entity @s Item.components."minecraft:custom_data".gm4_metallurgy

kill @e[type=item,dx=0,predicate=gm4_metallurgy:is_obsidian,limit=1]

# use anvil durability
function gm4_metallurgy:smooshing/anvil/use
