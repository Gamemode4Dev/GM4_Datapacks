# decrease the health bonus on the drain armor
# @s = player wearing armor
# at unspecified
# run from armor/modifier/type/drain/check

# put changes on armor piece
scoreboard players set $change gm4_ce_data 1

# get data
execute store result score $curr_level gm4_ce_data run data get storage gm4_combat_expanded:temp tag.AttributeModifiers[{Name:"gm4_combat_expanded"}].Amount

# reduce level by 1 and store
execute store result storage gm4_combat_expanded:temp tag.AttributeModifiers[{Name:"gm4_combat_expanded"}].Amount float 1 run scoreboard players remove $curr_level gm4_ce_data 1
