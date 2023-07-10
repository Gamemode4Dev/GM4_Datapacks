scoreboard objectives add gm4_cast_rod minecraft.used:minecraft.fishing_rod
scoreboard objectives add gm4_ef_timer dummy
scoreboard objectives add gm4_ef_id dummy
scoreboard objectives add gm4_ef_lure dummy
scoreboard objectives add gm4_ef_data dummy
scoreboard objectives add gm4_ef_up_bait dummy
scoreboard objectives add gm4_ef_fall dummy
scoreboard objectives add gm4_ef_sneak minecraft.custom:minecraft.sneak_time
# scoreboard objectives add gm4_ef_jump minecraft.custom:minecraft.jump

scoreboard players set #100 gm4_ef_data 100
scoreboard players set #6 gm4_ef_data 6
scoreboard players set #57 gm4_ef_data 57
scoreboard players set #4 gm4_ef_data 4
scoreboard players set #64 gm4_ef_data 64
scoreboard players set #10000 gm4_ef_data 10000

# register skulls
# old texture (to be removed in 2022)
execute unless data storage gm4_player_heads:register heads[{id:"gm4_end_fishing:enderpuff/v0"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_end_fishing:enderpuff/v0",value:'eyJ0aW1lc3RhbXAiOjE1NjQ5NDE3MTgzMjYsInByb2ZpbGVJZCI6IjkxZjA0ZmU5MGYzNjQzYjU4ZjIwZTMzNzVmODZkMzllIiwicHJvZmlsZU5hbWUiOiJTdG9ybVN0b3JteSIsInNpZ25hdHVyZVJlcXVpcmVkIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNjcxYzdlYjcxMjAwZGQ5ZGU1YTI3OWRmMTg2YjNjYjdiMmI0NTk4YjFiNzQ0MzI0YmQyNTQzMTZhZjYxZTE0MiJ9fX0=',item:{CustomModelData:3420014,gm4_end_fishing:{enderpuff:1b},display:{Name:'{"translate":"item.gm4.enderpuff","fallback":"Enderpuff","italic":false}'}}}
# new texture
execute unless data storage gm4_player_heads:register heads[{id:"gm4_end_fishing:enderpuff/v1"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_end_fishing:enderpuff/v1",value:'ewogICJ0aW1lc3RhbXAiIDogMTYxNzM3NjU5NjgxNiwKICAicHJvZmlsZUlkIiA6ICI4NDMwMDNlM2JlNTY0M2Q5OTQxMTBkMzJhMzU2MTk2MCIsCiAgInByb2ZpbGVOYW1lIiA6ICJHYWJvTWNHYW1lciIsCiAgInNpZ25hdHVyZVJlcXVpcmVkIiA6IHRydWUsCiAgInRleHR1cmVzIiA6IHsKICAgICJTS0lOIiA6IHsKICAgICAgInVybCIgOiAiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9lYjIzNTI3MWNhNTZlOGExYTQzMWViMWU2NWNlODIwYWE3ZTUwMWYwNmMxZjEzNTZhY2ViN2U4NjJmMTRhMjgiCiAgICB9CiAgfQp9',item:{CustomModelData:3420014,gm4_end_fishing:{enderpuff:1b},display:{Name:'{"translate":"item.gm4.enderpuff","fallback":"Enderpuff","italic":false}'}}}

execute unless score end_fishing gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"End Fishing"}
scoreboard players set end_fishing gm4_modules 1

schedule function gm4_end_fishing:main 1t
schedule function gm4_end_fishing:tick 1t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 1137.410269380909 ~ {CustomName:'"gm4_end_fishing_guide"',Tags:["gm4_guide"],data:{type:"module",id:"end_fishing",page_count:2,line_count:1,module_name:"End Fishing"}}

#$moduleUpdateList
