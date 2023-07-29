# translate resisted damage from guardian to nearest guardian (up to 6)
# @s = player that was guarded
# at @s
# run from player/submain

# limit damage to 3 hearts
scoreboard players set @s[scores={gm4_ce_guarded=61..}] gm4_ce_guarded 60

# translate damage resisted to nearest guarder (not self)
scoreboard players operation @p[tag=gm4_ce_guardian,distance=0.01..] gm4_ce_guard += @s gm4_ce_guarded
tag @s remove gm4_ce_guarded
