
# update mutation
data modify storage gm4_garden_variety:merge/mutation mutations[{mutation:"Height"}].value set from storage gm4_garden_variety:merge/mutation random_mutations[{mutation:"Height"}].value
data modify storage gm4_garden_variety:merge/mutation mutations[{mutation:"Flexibility"}].value set from storage gm4_garden_variety:merge/mutation random_mutations[{mutation:"Flexibility"}].value
data modify storage gm4_garden_variety:merge/mutation mutations[{mutation:"Foliage"}].value set from storage gm4_garden_variety:merge/mutation random_mutations[{mutation:"Foliage"}].value
data modify storage gm4_garden_variety:merge/mutation mutations[{mutation:"Fertility"}].value set from storage gm4_garden_variety:merge/mutation random_mutations[{mutation:"Fertility"}].value
data modify storage gm4_garden_variety:merge/mutation mutations[{mutation:"Corrosion"}].value set from storage gm4_garden_variety:merge/mutation random_mutations[{mutation:"Corrosion"}].value
data modify storage gm4_garden_variety:merge/mutation mutations[{mutation:"Roots"}].value set from storage gm4_garden_variety:merge/mutation random_mutations[{mutation:"Roots"}].value
data modify storage gm4_garden_variety:merge/mutation mutations[{mutation:"Poisonous"}].mutation set from storage gm4_garden_variety:merge/mutation random_mutations[{mutation:"Poisonous"}].mutation
data modify storage gm4_garden_variety:merge/mutation mutations[{mutation:"Hardened"}].mutation set from storage gm4_garden_variety:merge/mutation random_mutations[{mutation:"Hardened"}].mutation
data modify storage gm4_garden_variety:merge/mutation mutations[{mutation:"Sterile"}].mutation set from storage gm4_garden_variety:merge/mutation random_mutations[{mutation:"Sterile"}].mutation
data modify storage gm4_garden_variety:merge/mutation mutations[{mutation:"Fruity"}].mutation set from storage gm4_garden_variety:merge/mutation random_mutations[{mutation:"Fruity"}].mutation
data modify storage gm4_garden_variety:merge/mutation mutations[{mutation:"Necrotic"}].mutation set from storage gm4_garden_variety:merge/mutation random_mutations[{mutation:"Necrotic"}].mutation
data modify storage gm4_garden_variety:merge/mutation mutations[{mutation:"Flowering"}].mutation set from storage gm4_garden_variety:merge/mutation random_mutations[{mutation:"Flowering"}].mutation
data modify storage gm4_garden_variety:merge/mutation mutations[{mutation:"Snowy"}].mutation set from storage gm4_garden_variety:merge/mutation random_mutations[{mutation:"Snowy"}].mutation
data modify storage gm4_garden_variety:merge/mutation mutations[{mutation:"Radiating"}].mutation set from storage gm4_garden_variety:merge/mutation random_mutations[{mutation:"Radiating"}].mutation

# [loop]
data remove storage gm4_garden_variety:merge/mutation random_mutations[0]
scoreboard players remove $merge_mutations_loop gm4_gv_mutations 1
execute if score $merge_mutations_loop gm4_gv_mutations matches 1.. run function gm4_garden_variety:mechanics/custom_sapling/mutations/merge_mutations
