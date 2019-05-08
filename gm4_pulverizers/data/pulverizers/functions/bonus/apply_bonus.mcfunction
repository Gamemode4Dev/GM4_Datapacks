#@s = pulverizers containing a recipe results
#Run from apply_multiplier

execute store result score required gm4_pv_bonus run data get block ~ ~ ~ Items[0].tag.gm4_pulverizers.bonus.chance
execute store result score count gm4_pv_bonus run data get block ~ ~ ~ Items[0].tag.gm4_pulverizers.bonus.count

function pulverizers:bonus/calculate_chance
execute if score bonus_stack gm4_stack_size matches 1.. run function pulverizers:bonus/set_slot
