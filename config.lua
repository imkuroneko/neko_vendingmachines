Config = {}

Config.QbTargetDistance = 1.6 -- distance for interact (qb-target)

Config.Machines = {
    drinks = {
        label = 'Máquina de Bebidas',
        icon = 'fas fa-beer',
        price = 45,
        props = {
            'prop_vend_soda_01',
            'prop_vend_soda_02',
            'prop_vend_fridge01'
        },
        items = {
            'lata_pepsi',
            'lata_mirinda',
            'lata_7up',
        }
    },
    snacks = {
        label = 'Máquina de Snacks',
        icon = 'fas fa-burger',
        price = 35,
        props = {
            'prop_vend_snak_01',
            'prop_vend_snak_01_tu',
        },
        items = {
            'cereal_zucaritas',
            'cereal_barra',
            'snacks_lays',
            'snacks_doritos',
            'snacks_cheetos',
        }
    },
    coffee = {
        label = 'Máquina de Café',
        icon = 'fas fa-coffee',
        price = 50,
        props = {
            'prop_vend_coffe_01',
        },
        items = {
            'cafe_espresso',
            'cafe_con_leche',
            'chocolate_con_leche',
        }
    },
    slush = {
        label = 'Máquina de Batidos',
        icon = 'fas fa-ice-cream',
        price = 40,
        props = {
            'prop_slush_dispenser'
        },
        items = {
            'slushie_frutilla',
            'slushie_menta',
            'slushie_naranja',
        }
    }
}