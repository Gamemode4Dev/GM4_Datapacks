# Removes a duplicate recast option from the pool of possible shamirs and the list of memorized shamirs. The latter being for performance reasons.
# @s = new obsidian cast that was created by a recasted band
# at location of mold requesting a band
# run from gm4_metallurgy:casting/prevent_duplicate/compare_entry
tellraw @a ["",{"text":"      Excluded: ","color":"blue"},{"nbt":"previous.excluded_shamirs[0]","storage":"gm4_metallurgy:temp/item/cast","color":"red"}]

# kill item
kill @s

# remove entry in list of memorized shamirs
data remove storage gm4_metallurgy:temp/item/cast previous.excluded_shamirs[0]
