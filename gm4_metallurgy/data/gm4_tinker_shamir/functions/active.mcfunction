#run from main
#@s = players holding a tinker tool

execute if predicate gm4_metallurgy:holding_item_type/shovel run function gm4_tinker_shamir:compact/shovel
execute if predicate gm4_metallurgy:holding_item_type/pickaxe run function gm4_tinker_shamir:compact/pickaxe
execute if predicate gm4_metallurgy:holding_item_type/hoe run function gm4_tinker_shamir:compact/hoe
execute if predicate gm4_metallurgy:holding_item_type/sword run function gm4_tinker_shamir:compact/sword

