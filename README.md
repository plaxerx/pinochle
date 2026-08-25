# pinochle
A vanilla-friendly Balatro mod to add some QoL enhancements, sandbox decks, fun sandbox challenges, and a "peek" mechanic for scouting.

Named from the game the crew finally sits down to at the end of TNG. Once everything was done, there was nothing left to do but have fun. Nothing in here is balanced as intended as it is for messing about after you have already beaten the game.

## What's included

| Content | Effect |
|---|---|
| **Prismatic Deck** | Every vanilla deck's upside at once. |
| **Prismatic Sleeve** | Every vanilla sleeve's upside at once. |
| **NANEINF Lite** | A sandbox challenge with easier access to endless runs. |
| **Ensign** | Amulet-only challenge with `Chips + Mult` scoring with custom Ante scaling. |
| **Commander** | Amulet-only challenge with `Chips ^ Mult` scoring with custom Ante scaling. |
| **Captain** | Amulet-only challenge with `Chips ^^ Mult` scoring with custom Ante scaling. |
| **Vanilla Deck** | Allow only vanilla Jokers. |
| **Vanilla Sleeve** | Allow only vanilla Consumables; together with Vanilla Deck allows for only vanilla content. |
| **Peek Store** | Custom screen that shows what the next few shop rerolls hold. Off by default |

Prismatic disables joker stickers and achievements stay off.

## Requirements

- [Steamodded](https://github.com/Steamodded/smods) `>=1.0.0~BETA-0400`
- [Lovely](https://github.com/ethangreen-dev/lovely-injector)

[CardSleeves](https://github.com/larswijn/CardSleeves) is required for the Prismatic and Vanilla Sleeves.
[Amulet](https://github.com/frostice482/amulet) 3.5.4 or newer is optional; Ensign, Commander and Captain appear only when it is installed.

## Installation

Copy the `Pinochle` folder into your Balatro mods directory:

```
%APPDATA%/Balatro/Mods/
```

## Peek Store and other mods

Peek Store works by reading the game seed and replicating the same rolls the shop is about to run. Intended to be exact but may run into accuracy issues with significant modded additions. It also takes a best guess on how much it will cost to get to a desired shop page.

## Compatibility

This mod should not come into significant conflict with other modded content and is designed to complement other modded content.
Runs fine alongside my other mods: [MoarStakesPlease](https://github.com/plaxerx/MoarStakesPlease), MoarChallengesPlease and ErraticMode. Taken as a package together of MoarVanillaPlease.

## Credits

Made by [plaxerx](https://github.com/plaxerx), with development assistance from
[Claude](https://claude.ai).

Balatro is created and owned by LocalThunk. This mod is unofficial and not affiliated with the developer or
publisher.
