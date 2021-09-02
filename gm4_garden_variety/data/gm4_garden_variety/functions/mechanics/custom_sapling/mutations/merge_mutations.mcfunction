
# update mutation
data modify storage gm4_garden_variety:merge/mutation output[{mutation:"Height"}].value set from storage gm4_garden_variety:merge/mutation modifier[{mutation:"Height"}].value
data modify storage gm4_garden_variety:merge/mutation output[{mutation:"Flexibility"}].value set from storage gm4_garden_variety:merge/mutation modifier[{mutation:"Flexibility"}].value
data modify storage gm4_garden_variety:merge/mutation output[{mutation:"Foliage"}].value set from storage gm4_garden_variety:merge/mutation modifier[{mutation:"Foliage"}].value
data modify storage gm4_garden_variety:merge/mutation output[{mutation:"Fertility"}].value set from storage gm4_garden_variety:merge/mutation modifier[{mutation:"Fertility"}].value
data modify storage gm4_garden_variety:merge/mutation output[{mutation:"Corrosion"}].value set from storage gm4_garden_variety:merge/mutation modifier[{mutation:"Corrosion"}].value
data modify storage gm4_garden_variety:merge/mutation output[{mutation:"Roots"}].value set from storage gm4_garden_variety:merge/mutation modifier[{mutation:"Roots"}].value
data modify storage gm4_garden_variety:merge/mutation output[{mutation:"Poisonous"}].mutation set from storage gm4_garden_variety:merge/mutation modifier[{mutation:"Poisonous"}].mutation
data modify storage gm4_garden_variety:merge/mutation output[{mutation:"Hardened"}].mutation set from storage gm4_garden_variety:merge/mutation modifier[{mutation:"Hardened"}].mutation
data modify storage gm4_garden_variety:merge/mutation output[{mutation:"Sterile"}].mutation set from storage gm4_garden_variety:merge/mutation modifier[{mutation:"Sterile"}].mutation
data modify storage gm4_garden_variety:merge/mutation output[{mutation:"Fruity"}].mutation set from storage gm4_garden_variety:merge/mutation modifier[{mutation:"Fruity"}].mutation
data modify storage gm4_garden_variety:merge/mutation output[{mutation:"Necrotic"}].mutation set from storage gm4_garden_variety:merge/mutation modifier[{mutation:"Necrotic"}].mutation
data modify storage gm4_garden_variety:merge/mutation output[{mutation:"Flowering"}].mutation set from storage gm4_garden_variety:merge/mutation modifier[{mutation:"Flowering"}].mutation
data modify storage gm4_garden_variety:merge/mutation output[{mutation:"Snowy"}].mutation set from storage gm4_garden_variety:merge/mutation modifier[{mutation:"Snowy"}].mutation
data modify storage gm4_garden_variety:merge/mutation output[{mutation:"Radiating"}].mutation set from storage gm4_garden_variety:merge/mutation modifier[{mutation:"Radiating"}].mutation

# [loop]
data remove storage gm4_garden_variety:merge/mutation modifier[0]
scoreboard players remove $merge_mutations_loop gm4_gv_mutations 1
execute if score $merge_mutations_loop gm4_gv_mutations matches 1.. run function gm4_garden_variety:mechanics/custom_sapling/mutations/merge_mutations
