#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ tripwire run function potion_infusers:effects/failed
execute if block ~ ~ ~ tripwire run function potion_infusers:effects/success
execute if block ~ ~ ~ tripwire run setblock ~ ~ ~ cobweb
