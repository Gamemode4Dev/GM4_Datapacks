# initiates bleeding damage on affected entities, de-schedules if no more entities are affected
# @s = undefined
# at undefined
# scheduled from barbed/schedule_bleeding and self

# apply barbed damage
execute as @e[scores={gm4_reeling_rods.barbed_damage_timer=0..}] at @s run function gm4_reeling_rods:barbed/bleed

# reschedule if there are still barbed entities
execute if entity @e[scores={gm4_reeling_rods.barbed_damage_timer=0..},limit=1] run schedule function gm4_reeling_rods:barbed/find_affected 1t replace
