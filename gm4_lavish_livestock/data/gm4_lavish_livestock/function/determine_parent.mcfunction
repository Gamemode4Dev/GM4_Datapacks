# Selects one of the two parents of the baby as the source of the inherited size
# @s = parent of the baby
# at location of player who has fed the parent
# run from gm4_lavish_livestock:revoke_advancement

# if the other parent candidate was already tested and selected as the parent, abort 
execute if score $parent_selected gm4_lavish_livestock_data matches 1.. run return fail

# no parent selected yet
# if the other parent candidate was already tested but not selected as the parent, make this candidate the parent
execute if score $parent_selected gm4_lavish_livestock_data matches 0 run scoreboard players set $parent_selected gm4_lavish_livestock_data 1
# if the other parent candidate was not tested yet, roll a 50/50 whether this candidate should be the parent
execute if score $parent_selected gm4_lavish_livestock_data matches -1 store result score $parent_selected gm4_lavish_livestock_data run random roll 0..1
# if this candidate was not selected, abort
execute if score $parent_selected gm4_lavish_livestock_data matches 0 run return fail

# this candidate is the parent, transfer its stats to breeding site marker
execute unless score @s gm4_lavish_livestock_size matches 0..2 run scoreboard players set @s gm4_lavish_livestock_size 0
scoreboard players operation $size gm4_lavish_livestock_size = @s gm4_lavish_livestock_size
execute summon marker run function gm4_lavish_livestock:initialize_marker

# delay for one tick until child is alive
schedule function gm4_lavish_livestock:find_baby 1t
