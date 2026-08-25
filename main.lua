-- Pinochle

--============================================================
-- Atlas
--============================================================

SMODS.Atlas{
    key = 'pin_decks',
    path = 'pin_decks.png',
    px = 71,
    py = 95,
}
--============================================================
-- Shared helpers
--============================================================
PIN = PIN or {}

function PIN.isnum(v)
    if is_number then return is_number(v) end
    return type(v) == 'number'
end

function PIN.plain(v)
    if type(v) == 'number' then return v end
    if to_number then
        local n = to_number(v)
        if type(n) == 'number' then return n end
    end
    return nil
end

function PIN.on_deck(back_key)
    local g = G.GAME
    if not g then return false end

    local b = g.selected_back
    local k = b and b.effect and b.effect.center and b.effect.center.key
    if k then return k == back_key end

    local sbk = g.selected_back_key
    if type(sbk) == 'table' then return sbk.key == back_key end
    if type(sbk) == 'string' then return sbk == back_key end

    if CardSleeves and CardSleeves.Sleeve and CardSleeves.Sleeve.get_current_deck_key then
        local ok, cur = pcall(CardSleeves.Sleeve.get_current_deck_key)
        if ok then return cur == back_key end
    end
    return false
end

--============================================================
-- Content
--============================================================

assert(SMODS.load_file('decks.lua'))()
assert(SMODS.load_file('sandbox.lua'))()
assert(SMODS.load_file('peek.lua'))()

--============================================================
-- Config tab (SMODS mod menu)
--============================================================
PIN.mod = SMODS.current_mod
PIN.CFG = SMODS.current_mod.config or { peek_mode = 1, peek_depth = 5 }
SMODS.current_mod.config = PIN.CFG

local PEEK_MODE_OPTS = { 'Off', 'Endless & Seeded', 'Always (debug)' }

SMODS.current_mod.config_tab = function()
    local cfg = PIN.CFG
    return { n = G.UIT.ROOT, config = { align = 'cm', minh = 4, minw = 8, padding = 0.1, r = 0.1, colour = G.C.CLEAR }, nodes = {
        { n = G.UIT.R, config = { align = 'cm', padding = 0.1 }, nodes = {
            { n = G.UIT.T, config = { text = 'Peek Store', scale = 0.5, colour = G.C.UI.TEXT_LIGHT, shadow = true } },
        }},
        { n = G.UIT.R, config = { align = 'cm', padding = 0.05 }, nodes = {
            create_option_cycle({
                label = 'When available',
                options = PEEK_MODE_OPTS,
                current_option = math.min(3, math.max(1, cfg.peek_mode or 1)),
                w = 4.5, scale = 0.9, text_scale = 0.4,
                ref_table = cfg, ref_value = 'peek_mode',
                opt_callback = 'pin_config_saved',
            }),
        }},
        { n = G.UIT.R, config = { align = 'cm', padding = 0.05 }, nodes = {
            create_option_cycle({
                label = 'Rerolls to look ahead',
                options = { '3', '5', '8' },
                current_option = ({ [3] = 1, [5] = 2, [8] = 3 })[cfg.peek_depth or 5] or 2,
                w = 4.5, scale = 0.9, text_scale = 0.4,
                ref_table = cfg, ref_value = 'peek_depth_idx',
                opt_callback = 'pin_peek_depth_saved',
            }),
        }},
        { n = G.UIT.R, config = { align = 'cm', padding = 0.08, maxw = 7 }, nodes = {
            { n = G.UIT.T, config = { text = 'Shows upcoming shop cards in future rerolls with the costs to reach them.',
                                      scale = 0.3, colour = G.C.UI.TEXT_INACTIVE } },
        }},
    }}
end

G.FUNCS.pin_config_saved = function(e)
    PIN.CFG.peek_mode = (e and e.to_key) or PIN.CFG.peek_mode
    if SMODS.save_mod_config then SMODS.save_mod_config(PIN.mod) end
end

G.FUNCS.pin_peek_depth_saved = function(e)
    PIN.CFG.peek_depth = ({ 3, 5, 8 })[(e and e.to_key) or 2] or 5
    if SMODS.save_mod_config then SMODS.save_mod_config(PIN.mod) end
end
