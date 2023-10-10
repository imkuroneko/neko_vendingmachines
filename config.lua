Config = {}

Config.OutOfService = 'Esta máquina expendedora se encuentra fuera de servicio'

Config.Drinks = {
    props = {
        'prop_vend_soda_01',
        'prop_vend_soda_02',
        'prop_vend_fridge01'
    },
    label = 'Máquina de Bebidas',
    icon = 'fas fa-beer',
    items = {
        [1] = { name = 'lata_pepsi',       price = 45, amount = 200, info = {}, type = 'item', slot = 1 },
        [2] = { name = 'lata_mirinda',     price = 45, amount = 200, info = {}, type = 'item', slot = 2 },
        [3] = { name = 'lata_7up',         price = 45, amount = 200, info = {}, type = 'item', slot = 3 },
    }
}

Config.Snacks = {
    props = {
        'prop_vend_snak_01',
        'prop_vend_snak_01_tu',
    },
    label = 'Máquina de Snacks',
    icon = 'fas fa-burger',
    items = {
        [1] = { name = 'cereal_zucaritas', price = 35, amount = 200, info = {}, type = 'item', slot = 1 },
        [2] = { name = 'cereal_barra',     price = 35, amount = 200, info = {}, type = 'item', slot = 2 },
        [3] = { name = 'snacks_lays',      price = 35, amount = 200, info = {}, type = 'item', slot = 3 },
        [4] = { name = 'snacks_doritos',   price = 35, amount = 200, info = {}, type = 'item', slot = 4 },
        [5] = { name = 'snacks_cheetos',   price = 35, amount = 200, info = {}, type = 'item', slot = 5 },
    }
}

Config.Coffee = {
    props = {
        'prop_vend_coffe_01',
    },
    label = 'Máquina de Café',
    icon = 'fas fa-coffee',
    items = {
        [1] = { name = 'cafe_espresso',        price = 50, amount = 200, info = {}, type = 'item', slot = 1 },
        [2] = { name = 'cafe_con_leche',       price = 50, amount = 200, info = {}, type = 'item', slot = 2 },
        [3] = { name = 'chocolate_con_leche',  price = 50, amount = 200, info = {}, type = 'item', slot = 3 },
    }
}