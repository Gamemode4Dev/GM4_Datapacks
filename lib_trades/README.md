# lib_trades

*lib_trades* is a mcfunction library that allows other datapacks to easily add trades to Wandering Traders or to any Villager-like entity of their choice. The main focus of this library was to make it easy to use but still powerful enough to provide a satisfying interface.

# Terminology and Functioning
To discuss the versitile nature of this library, a few terms should be known to the user:
- *trader*: A Villager-like mob (as of Minecraft 1.19 `wandering_trader` and `villager`) is called a *trader*.
- *trade option*: A single trade inside a trader's trade GUI is called a *trade option* (e.g. 5 Emeralds for one Bookshelf).
- *trade pool*: A virtual collection of trade options is called a *trade pool*. A trade pool occupies a single slot within a trader's trade GUI.

The following paragraphs outline the functioning of these in an in-game environment.

## Traders
Traders can be any entity that holds Villager-Style trades, including a trade GUI. As of Minecraft 1.19, these are `wandering_trader` and `villager` type entities.
*lib_trades* enables the user to add trades to these mobs in a standardized and simplified manner. This allows multiple datapacks to use traders without having to worry about adding too many trades (which makes the trade GUI very long and hard to use) or causing conflicts by overwriting each other's trades.<br>

Furthermore, this library allows trades to be generated from loot tables, enabling the versitile features of loot tables, such as random item counts or random item selection, within villager trades. Hardcoding trades, i.e. adding a trade without having to create a loot table for the trade, is also possible.<br>

All meta-nbt for trades (such as experience rewards or max uses) is also exposed by the library and can be configured by the user.

## Trade Options
A trade option represents a single trade and therefore consists of:
- an item being sold by the trader
- an item being bought by the trader
- a secondary item being bought by the trader
- trade meta data (such as max uses or experience rewards)
- a trade pool it belongs to

When a trader is spawned and modified, its trade GUI will show a list of trade options.

## Trade Pools
Trade pools are a virtual collection of trade options. From each trade pool added to a trader, one trade option is picked uniform-randomly to be on offer within the trader's trade GUI.
A trade pool consists of:
- some trade options that list this trade pool's id as their trade pool

Trade pools are a virtual concept and are not visible to the player (apart from the fact that trade options are grouped into trade pools).

# How to Use
*lib_trades* offers two ways to integrate itself into other datapacks, via naturally spawned Wandering Traders or as a way to add trades to custom traders spawned by other datapacks. These two use cases differ in the way the foreign datapack hooks into *lib_trades*.

## Naturally Spawned Wandering Traders
To add trades to naturally spawning wandering traders, the foreign datapack must simply register its trades by adding a trade registration function to the function tag `#gm4_trades:register_trades`. See the *Registering Trades* section below on how to register trades.<br>

All `wandering_trader` type entities that satisfy `[tag=!gm4_trader,tag=!smithed.entity]` and that have the `Offers.Recipes` NBT are automatically modified by the library every 10 seconds to receive registered trades. These tags can also be used to stop *lib_trades* from modifying a Wandering Trader in case this is unwanted.

## Targeting External Traders
To add trades to traders spawned by a foreign datapack manually, a hook-in point is provided by *lib_trades*. This is **not required** for naturally spawned Wandering Traders, see the above section on naturally spawned Wandering Traders.<br>

Adding trades to external trades is a two step process:
1. Load the desired trades
2. Call the hook-in point

Details on how to load trades can found in the *Loading Trades* section below. Once the trades have been loaded, the function tag `#gm4_trades:modify_external_trader` must be called **as** the trader that should have the trades added to it. The two steps should happen right after each other and must happen within the same tick and in order.

## Loading Trades
To load trades, a function that spawns trade options must be provided (splitting your trades over multiple functions is allowed, as long as all trade options are spawned within the same tick). "Loading Trades" equates to calling this function.<br>

For each trade option a `trader_llama` entity must be spawned, the following NBT is recommended as a base:<br>
```summon trader_llama ~ 0 ~ {Silent:1b,NoGravity:1b,Invulnerable:1b,ChestedHorse:1b,Variant:0,Strength:1,DespawnDelay:1,Tags:["gm4_trade_option"],Items:[{},{},{}]}```<br>

The tag `gm4_trade_option` is mandetory and is used by the library to identify available trade options. If the llama has to be targeted again after being spawned in (e.g. for populating its inventory using `/loot` or `/item replace`), the addition of a temporary tag is recommended.

The `trader_llama` holds all information about the trade within its own NBT, following a special format:
- `Items[{Slot:2b}]` || `horse.0`: Contents of the `sell` tag of the trade option.
- `Items[{Slot:3b}]` || `horse.1`: Contents of the `buy` tag of the trade option.
- `Items[{Slot:4b}]` || `horse.2`: Contents of the `buyB` tag of the trade option.
- `DecorItem.tag.gm4_trades.options`: Trade option meta NBT, e.g. `maxUses`, `rewardXp`. All vanilla trade option meta tags are supported. Any custom tags inserted here are ignored, but not deleted.<br>

These slots can, but don't have to, be filled explicitly in the summon command and may therefore be populated by loot tables using `/loot`, allowing the use of powerful loot table tools for trade generation.

The item contained in `Items[{Slot:0b}]` (known within NBT as `DecorItem`) has two special tags that are used to store trade option meta NBT:
- `DecorItem.tag.gm4_trades.options` holds vanilla metadata, as explained above.
- `DecorItem.tag.gm4_trades.pool` holds a string known as the trade option's "trade pool name". This should be a namespaced string, which identifies multiple trade options that should be shown as one trade option on the Wandering Trader. Trade options with an omitted `pool` tag are considered to be in an unnamed trade pool each and are always displayed as their own, standalone trade option in the Wandering Trader.

Not summoning a `trader_llama` for a trade option will result in the trade option being omitted.

## Registering Trades
Registering trades is only necessary when naturally spawned Wandering Traders are supposed to receive them, it is **not** necessary for adding trades to external traders.<br>
To register trades, the function that loads the trades must be added to the `#gm4_trades:register_trades` function tag.
