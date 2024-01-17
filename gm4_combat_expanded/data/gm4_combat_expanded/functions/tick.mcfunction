schedule function gm4_combat_expanded:tick 1t

# | Reset Scoreboards
scoreboard players reset @a gm4_ce_damaged
scoreboard players reset @a gm4_ce_absorped
scoreboard players reset @a gm4_ce_shielded_hit

# | Process Weapons
# delay
execute as @e[tag=gm4_cd_delay_active] at @s run function gm4_combat_expanded:weapon/modifier/delay/tick

# | Process Armor
# immune
execute as @a[gamemode=!spectator,tag=gm4_ce_immune_active] run function gm4_combat_expanded:armor/modifier/type/immune/apply
# archer
execute as @a run scoreboard players operation @s gm4_ce_used_bow += @s gm4_ce_used_crossbow
execute as @a[tag=gm4_ce_wearing_archer,scores={gm4_ce_used_bow=1..}] at @s run function gm4_combat_expanded:armor/modifier/type/archer/find_arrow
scoreboard players reset @a gm4_ce_used_bow
scoreboard players reset @a gm4_ce_used_crossbow
# link
tag @a[tag=gm4_ce_linked,gamemode=!spectator,gamemode=!creative] add gm4_ce_linked.check
execute as @p[tag=gm4_ce_linked.check] run function gm4_combat_expanded:armor/modifier/type/link/process/loop_links
# sword_ring
tag @e[type=item_display,tag=gm4_ce_sword_ring.keep_sword] remove gm4_ce_sword_ring.keep_sword
execute as @a[predicate=gm4_combat_expanded:modified_armor/sword_ring,gamemode=!spectator] at @s run function gm4_combat_expanded:armor/modifier/type/sword_ring/prep
kill @e[type=item_display,tag=gm4_ce_sword_ring.sword,tag=!gm4_ce_sword_ring.keep_sword]
# beacon
tag @e[type=block_display,tag=gm4_ce_beacon.keep] remove gm4_ce_beacon.keep
execute as @a[predicate=gm4_combat_expanded:modified_armor/beacon,gamemode=!spectator] at @s run function gm4_combat_expanded:armor/modifier/type/beacon/prep
execute as @e[type=block_display,tag=gm4_ce_beacon,tag=!gm4_ce_beacon.keep] at @s run function gm4_combat_expanded:armor/modifier/type/beacon/remove 

# | Process Other
# poison slime landings
execute as @e[type=slime,tag=gm4_ce_poison_landing] at @s run function gm4_combat_expanded:mob/process/poison_slime/process
# check for items on the ground
execute as @e[type=item,tag=!gm4_ce_item_checked] run function gm4_combat_expanded:check_item
