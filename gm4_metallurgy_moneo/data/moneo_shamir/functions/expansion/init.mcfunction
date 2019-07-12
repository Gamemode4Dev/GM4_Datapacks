#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s%3427655$s","with":["Installing Metallurgy Expansion (Moneo)...",{"translate":"text.gm4.modules.update.installing","with":[{"translate":"module.gm4.metallurgy.expansion.moneo"}]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Metallurgy Expansion (Moneo)...

# There's nothing really here to do lol. shrug.

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s%3427655$s","with":["Metallurgy Expansion (Moneo) Installed!",{"translate":"text.gm4.modules.update.installed","with":[{"translate":"module.gm4.metallurgy.expansion.moneo"}]}]}]
execute unless entity @a[limit=1] run say GM4: Metallurgy Expansion (Moneo) Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
