# @s = new living orb silverfish
# run from soul_forge/entities/summon_extra_orb
# and from soul_forge/entities/summon_living_orb

# set default data
data merge entity @s {CustomName:{"translate":"entity.gm4.living_orb","fallback":"Living Orb§"},CustomNameVisible:0b,Team:"gm4_hide_name",Health:2.0f,DeathLootTable:"gm4:empty",PersistenceRequired:1b,Tags:["gm4_oa_unset","gm4_oa_living_orb","gm4_oa_ignore"],drop_chances:{mainhand:2.0f,offhand:1.0f},Motion:[0.0,0.6,0.0],active_effects:[{id:"minecraft:fire_resistance",amplifier:0b,duration:1000000,show_particles:0b}]}

# get pneuma count, return early if empty
execute store result score pneuma_count gm4_oa_forge run data get storage gm4_orb_of_ankou:temp current_orb.components."minecraft:custom_data".gm4_orb_of_ankou.pneumas
execute if score pneuma_count gm4_oa_forge matches 0 run return run loot replace entity @s weapon.mainhand loot gm4_orb_of_ankou:items/orb_of_ankou

# set up new orb
loot replace entity @s weapon.offhand loot gm4_orb_of_ankou:items/orb_of_ankou
data modify storage gm4_orb_of_ankou:temp new_orb set from entity @s equipment.offhand
item replace entity @s weapon.offhand with minecraft:air
data merge storage gm4_orb_of_ankou:temp {new_orb:{components:{"minecraft:lore":[{"translate":"text.gm4.orb_of_ankou.pneumas","fallback":"Pneumas:","italic":false,"color":"light_purple"}],"minecraft:firework_explosion":{shape:"small_ball",colors:[I;]}}}}

# get pneuma data from shard loot tables
execute store result score restore_pneuma_count gm4_oa_forge run data get storage gm4_orb_of_ankou:temp current_orb.components."minecraft:custom_data".gm4_orb_of_ankou.pneumas
function gm4_orb_of_ankou:soul_forge/entities/set_data/loop_orb_pneumas
data modify entity @s equipment.mainhand set from storage gm4_orb_of_ankou:temp new_orb

# clean up
data remove storage gm4_orb_of_ankou:temp new_orb
data remove storage gm4_orb_of_ankou:temp current_orb
