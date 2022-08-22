# translate resisted damage from guardian to nearest guardian (up to 4)
# @s = player that was guarded
# at @s
# run from player/submain

# limit damage to 2 hearts
scoreboard players set @s[scores={gm4_ce_guarded=41..}] gm4_ce_guarded 40

# translate damage resisted to nearest guarder (not self)
scoreboard players operation @p[tag=gm4_ce_guardian,distance=0.01..] gm4_ce_guard += @s gm4_ce_guarded
tag @s remove gm4_ce_guarded
