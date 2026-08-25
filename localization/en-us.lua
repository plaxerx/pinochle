return {
    misc = {
        v_text = {
            -- localize{type='text'} returns after the FIRST line, so one entry per rule row
            ch_c_pin_sandbox       = { "Training for Ante 39 goals" },
            ch_c_pin_ensign        = { "{C:attention}Chips/Mult{} operator becomes {C:chips,s:1.5}+{}" },
            ch_c_pin_commander     = { "{C:attention}Chips/Mult{} operator becomes {C:dark_edition}^{}" },
            ch_c_pin_captain       = { "{C:attention}Chips/Mult{} operator becomes {C:dark_edition}^^{}" },
            ch_c_pin_blind_scaling = { "Custom blind scaling" },
        },
    },
    descriptions = {
        Sleeve = {
            sleeve_pin_prismatic_alt = {
                name = "Prismatic Sleeve",
                text = {
                    "Provides the upside of each sleeve",
                    "{C:red}Achievements are disabled{}",
                },
            },
            sleeve_pin_vanilla_alt = {
                name = "Vanilla Sleeve",
                text = {
                    "Only {C:attention}vanilla content{}",
                    "can appear",
                },
            },
        },
    },
}
