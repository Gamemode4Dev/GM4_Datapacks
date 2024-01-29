# process anything player related
# @s = unspecified
# at unspecified
# scheduled from main (8t)

# prep link armor
tag @a remove gm4_ce_was_linked
tag @a[tag=gm4_ce_linked] add gm4_ce_was_linked
tag @a remove gm4_ce_linked
data modify storage gm4_combat_expanded:temp active_links set value [{id:-1,name:{"translate":"item.gm4.combat_expanded.name.link","fallback":"Unlinked %s","with":[{"translate":"item.minecraft.iron_chestplate","italic":false}],"italic":false,"color":"light_purple"}}]
scoreboard players reset * gm4_ce_link_id

# prep sword_ring armor
scoreboard players reset @a gm4_ce_sword_ring

# check natural regeneation
execute unless score $natural_regen gm4_ce_data matches -1 store result score $natural_regen gm4_ce_data run gamerule naturalRegeneration

# process players
execute as @a[gamemode=!spectator] run function gm4_combat_expanded:player/process

# timers
scoreboard players remove @a[scores={gm4_ce_t_hurt=1..}] gm4_ce_t_hurt 1
scoreboard players remove @a[scores={gm4_ce_t_shield=1..}] gm4_ce_t_shield 1
scoreboard players remove @a[scores={gm4_ce_t_wolf=1..}] gm4_ce_t_wolf 1
scoreboard players remove @a[scores={gm4_ce_t_soothe=1..}] gm4_ce_t_soothe 1
scoreboard players remove @a[scores={gm4_ce_t_reactive=1..}] gm4_ce_t_reactive 1
scoreboard players remove @a[scores={gm4_ce_natural_regen_damage=1..}] gm4_ce_natural_regen_damage 1
scoreboard players remove @a[scores={gm4_ce_pvp_timer=1..}] gm4_ce_pvp_timer 1

# reset scoreboards
scoreboard players reset @a gm4_ce_hurt
scoreboard players reset @a gm4_ce_hurt2
scoreboard players reset @a gm4_ce_kill
scoreboard players reset @a gm4_ce_kill2
scoreboard players reset @a gm4_ce_sprinting
scoreboard players reset @a gm4_ce_swimming
