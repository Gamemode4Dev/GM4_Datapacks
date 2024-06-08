# calculate modifiers for newly spawned zombie / zombie villager
# @s = zombie (villager)
# at @s
# run from mob/init/difficulty/check_type

# spawn phantoms in mountains
execute if predicate gm4_ce_base:mob/modifier/mountainous positioned ~ ~35 ~ store result score $phantom_count gm4_ce_data if entity @e[type=phantom,distance=..32]
execute if score $phantoms gm4_ce_data matches 0 if score $nearby_home_bed gm4_ce_data matches 0 if score $phantom_count gm4_ce_data < $mob_limit.phantom gm4_ce_data if predicate gm4_ce_base:technical/chance/spawn_mountain_phantom store success score $mob_extras gm4_ce_data run summon phantom ~ ~35 ~ {Tags:["gm4_ce_extra_mob","gm4_ce_phantom"]}

# | Other Modifiers
# only allow one of the following modifiers
scoreboard players set $modifier_picked gm4_ce_data 0
# remove "Zombie leaders"
execute if data entity @s Attributes[{Name:"minecraft:generic.max_health"}].Modifiers[{Name:"Leader zombie bonus"}] run function gm4_ce_base:mob/init/special/zombie_leader
# baby zombie (zombie leader is never a baby)
execute if score $modifier_picked gm4_ce_data matches 0 if data entity @s {IsBaby:1b} store success score $modifier_picked gm4_ce_data run attribute @s generic.max_health modifier add 13d37911-bc7f-4f94-9187-1668ac21bfb1 "gm4_ce_baby_zombie" -0.6 add_multiplied_base
# sprinter
execute if score $modifier_picked gm4_ce_data matches 0 if predicate gm4_ce_base:technical/chance/zombie_sprinter store success score $modifier_picked gm4_ce_data run effect give @s speed infinite 0
# shielded
execute if score $modifier_picked gm4_ce_data matches 0 if predicate gm4_ce_base:technical/chance/zombie_shielded run function gm4_ce_base:mob/init/special/zombie_shielded
# dual wield
execute if score $modifier_picked gm4_ce_data matches 0 if predicate gm4_ce_base:technical/chance/zombie_dual_wield run function gm4_ce_base:mob/init/special/zombie_dual_wield
# solid (KB resist)
execute if score $modifier_picked gm4_ce_data matches 0 if predicate gm4_ce_base:technical/chance/zombie_solid store success score $modifier_picked gm4_ce_data run attribute @s generic.knockback_resistance modifier add 35504df6-ec60-4229-8063-a2440d56f68c "gm4_ce_solid_zombie" 0.45 add_value
