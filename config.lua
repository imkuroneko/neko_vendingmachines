Config = {}

Config.OutOfService = 'Esta máquina expendedora se encuentra fuera de servicio'

Config.Inventory = 'ox_inventory' -- qb-inventory / ox_inventory

Config.Drinks = {
    type = 'drinks',
    props = {
        'prop_vend_soda_01',
        'prop_vend_soda_02',
        'prop_vend_fridge01'
    },
    label = 'Máquina de Bebidas',
    icon = 'fas fa-beer',
    price = 45,
    items = {
        'lata_pepsi',
        'lata_mirinda',
        'lata_7up',
    }
}

Config.Snacks = {
    type = 'snacks',
    props = {
        'prop_vend_snak_01',
        'prop_vend_snak_01_tu',
    },
    label = 'Máquina de Snacks',
    icon = 'fas fa-burger',
    price = 35,
    items = {
        'cereal_zucaritas',
        'cereal_barra',
        'snacks_lays',
        'snacks_doritos',
        'snacks_cheetos',
    }
}

Config.Coffee = {
    type = 'coffee',
    props = {
        'prop_vend_coffe_01',
    },
    label = 'Máquina de Café',
    icon = 'fas fa-coffee',
    price = 50,
    items = {
        'cafe_espresso',
        'cafe_con_leche',
        'chocolate_con_leche',
    }
}

Config.Slush = {
    type = 'slush',
    props = {
        'prop_slush_dispenser'
    },
    label = 'Batidos',
    icon = 'fas fa-ice-cream',
    price = 40,
    items = {
        'slushie_frutilla',
        'slushie_menta',
        'slushie_naranja',
    }
}