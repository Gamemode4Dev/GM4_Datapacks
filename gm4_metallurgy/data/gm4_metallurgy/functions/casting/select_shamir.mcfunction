# Selects a shamir from the available options
# @s = mould requesting a band
# at location of mold requesting a band
# run from gm4_metallurgy:casting/finish_band

# select a random shamir item and kill others
tag @e[type=item,tag=gm4_ml_band,sort=random,limit=1] add gm4_ml_selected_band
kill @e[type=item,tag=!gm4_ml_selected_band,tag=gm4_ml_band]

# copy memorized shamirs list to selected band if this was a recast
execute if score $has_recasted_band gm4_ml_data matches 1 run function gm4_metallurgy:casting/prevent_duplicate/inherit_memory

# set band applied to one if a band was applied, if not (too many exclusions) set flag to 0 (triggers creation of mundane band)
scoreboard players set $band_applied gm4_ml_data 1
