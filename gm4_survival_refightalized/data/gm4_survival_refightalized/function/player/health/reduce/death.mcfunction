
execute store result score $death_messages gm4_sr_data run gamerule showDeathMessages
gamerule showDeathMessages false
execute unless predicate gm4_survival_refightalized:technical/holding_totem_of_undying run tellraw @a ["",{"selector":"@s"},{"translate":"text.gm4.survival_refightalized.death","fallback":" ran out of health"}]
damage @s 9999 generic
execute if score $death_messages gm4_sr_data matches 1 run gamerule showDeathMessages true
