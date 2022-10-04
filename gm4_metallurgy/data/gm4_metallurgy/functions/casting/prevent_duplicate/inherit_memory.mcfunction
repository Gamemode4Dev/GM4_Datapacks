# Copys the list of memorized shamirs onto a new obsidian cast if recasting was used.
# @s = new obsidian cast that was created by a recasted band
# at location of mold requesting a band
# run from any function in casting/finish_band

data modify entity @e[type=item,tag=gm4_ml_selected_band,limit=1] Item.tag.gm4_metallurgy.memorized_shamirs set from storage gm4_metallurgy:temp/item/cast previous.memorized_shamirs
data remove storage gm4_metallurgy:temp/item/cast previous
