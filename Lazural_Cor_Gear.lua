-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal','Acc')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Match','Normal', 'Acc','Proc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Refresh')
	state.HybridMode:options('Normal','DT')
	state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None', 'DWMax'}
	state.Weapons:options('Default','Ranged','Savage','Evisceration','DualWeapons','DualSavageWeapons','DualEvisceration','DualLeadenRanged','DualLeadenMelee','DualAeolian','DualLeadenMeleeAcc','DualRanged','DualProcWeapons','None')
	state.CompensatorMode:options('Always','300','1000','Never')

    gear.RAbullet = "Chrono Bullet"
    gear.WSbullet = "Chrono Bullet"
    gear.MAbullet = "Orichalc. Bullet" --For MAB WS, do not put single-use bullets here.
    gear.QDbullet = "Animikii Bullet"
    options.ammo_warning_limit = 15
    --Ikenga_vest_bonus = 190  -- It is 190 at R20. Uncomment if you need to manually adjust because you are using below R20

	gear.tp_ranger_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}}
	gear.snapshot_jse_back = { name="Camulus's Mantle", augments={'INT+2','Eva.+19 /Mag. Eva.+19','"Snapshot"+10',}}
	gear.tp_jse_back = { name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}
	gear.ranger_wsd_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}}
	gear.magic_wsd_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}}
	gear.str_wsd_jse_back = {name="Camulus's Mantle",augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}

    -- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` gs c elemental quickdraw')
	
	send_command('bind !backspace input /ja "Double-up" <me>')
	send_command('bind @backspace input /ja "Snake Eye" <me>')
	send_command('bind ^backspace input /ja "Fold" <me>')
	send_command('bind ^@!backspace input /ja "Crooked Cards" <me>')
	
	send_command('bind ^\\\\ input /ja "Random Deal" <me>')
    send_command('bind !\\\\ input /ja "Bolter\'s Roll" <me>')
	send_command('bind ^@!\\\\ gs c toggle LuzafRing')
	send_command('bind @f7 gs c toggle RngHelper')
    send_command('bind ^h gs c useitem ring2 Warp Ring')
    send_command('bind !h gs c useitem ring2 Dim. Ring (Holla)')

    send_command('bind !Numpad7 input /ws "Savage Blade" <t>')
    send_command('bind !Numpad8 input /ws "Last Stand" <t>')
    send_command('bind !Numpad9 input /ws "Leaden Salute" <t>')
    send_command('bind !Numpad6 input /ws "Wildfire" <t>')
    send_command('bind !Numpad0 input /ra <t>')

    send_command('bind !m input /ja "Spectral Chair" <me>')


	send_command('bind !r gs c weapons DualSavageWeapons;gs c update')
	send_command('bind ^q gs c weapons DualAeolian;gs c update')
	send_command('bind !q gs c weapons DualLeadenRanged;gs c update')
	send_command('bind @pause roller roll')

    select_default_macro_book()
end             

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets♠

    -- Precast sets to enhance JAs

	sets.precast.JA['Triple Shot'] = {body="Chasseur's Frac +1"}
    sets.precast.JA['Snake Eye'] = {legs="Lanun Trews"}
    sets.precast.JA['Wild Card'] = {feet="Lanun Bottes +3"}
    sets.precast.JA['Random Deal'] = {body="Lanun Frac +3"}
    sets.precast.FoldDoubleBust = {hands="Lanun Gants"}

    sets.precast.CorsairRoll = {main="Lanun Knife",range="Compensator",
        head="Lanun Tricorne +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Eabani Earring",
        body="Lanun Frac +2",hands="Chasseur's Gants +2",ring1="Defending Ring",ring2="Barataria Ring",
        back=gear.snapshot_jse_back,waist="Flume Belt +1",legs="Mummu Kecks +1",feet="Malignance Boots"}

    sets.precast.LuzafRing = {ring2="Luzaf's Ring"}
    
    sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Chas. Culottes +2"})
    sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Chass. Bottes +2"})
    sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chass. Tricorne"})
    sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac +1"})
    sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants +2"})
    
    sets.precast.CorsairShot = {ammo=gear.QDbullet,
        head="Ikenga's Hat",neck="Iskur Gorget",ear1="Dedition Earring",ear2="Telos Earring",
        body="Ikenga's Vest",hands="Ikenga's Gloves",ring1="Apate Ring",ring2="Petrov Ring",
        back=gear.tp_ranger_jse_back,waist="Yemaya Belt",legs="Ikenga's Trousers",feet="Ikenga's Clogs"}
		
	sets.precast.CorsairShot.Damage = {ammo=gear.QDbullet,
        head=gear.herc_head_MAB,neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
        body="Lanun Frac +3",hands="Leyline Gloves",ring1="Acumen Ring",ring2="Dingir Ring",
        back=gear.ranger_wsd_jse_back,waist="Eschan Stone",legs=gear.herc_legs_MAB,feet="Chass. Bottes +2"}
	
    sets.precast.CorsairShot.Proc = {ammo=gear.RAbullet,
        head="Wh. Rarab Cap +1",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Sanare Earring",
        body="Emet Harness +1",hands="Malignance Gloves",ring1="Defending Ring",ring2="Dark Ring",
        back="Moonbeam Cape",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Chass. Bottes +2"}

    sets.precast.CorsairShot['Light Shot'] = {ammo=gear.QDbullet,
        head="Carmine Mask",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Telos Earring",
        body="Lanun Frac +3",hands="Leyline Gloves",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
        back=gear.ranger_wsd_jse_back,waist="Eschan Stone",legs=gear.herc_legs_MAB,feet=gear.herc_feet_MAB}

    sets.precast.CorsairShot['Dark Shot'] = set_combine(sets.precast.CorsairShot['Light Shot'], {feet="Chass. Bottes +2"})

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head="Carmine Mask +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body=gear.herculean_waltz_body,hands=gear.herculean_waltz_hands,ring1="Defending Ring",ring2="Valseur's Ring",
        back="Moonbeam Cape",waist="Flume Belt +1",legs="Dashing Subligar",feet=gear.herculean_waltz_feet}
		
	sets.Self_Waltz = {head="Mummu Bonnet +2",body="Passion Jacket",ring1="Asklepian Ring"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
        head="Carmine Mask",neck="Baetyl Pendant",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
        body="Samnuha Coat",hands="Leyline Gloves",ring1="Weatherspoon Ring",ring2="Lebeche Ring",
        back="Moonbeam Cape",waist="Flume Belt +1",legs="Rawhide Trousers",feet="Carmine Greaves"}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {ear2="Mendi. Earring"})

    sets.precast.RA = {ammo=gear.RAbullet,
        head="Ikenga's Hat",neck="Comm. Charm +1",
        body="Laksa. Frac +2",hands="Carmine Fin. Ga.",ring1="Crepuscular Ring",
        back=gear.snapshot_jse_back,waist="Impulse Belt",legs="Adhemar Kecks",feet="Adhemar Gamashes"}
		
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {waist="Yemaya Belt",legs="Adhemar Kecks"})
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {waist="Yemaya Belt",legs="Adhemar Kecks"})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head=gear.herc_head_ACC,neck="Caro Necklace",ear1="Moonshade Earring",ear2="Telos Earring",
        body="Laksa. Frac +2",hands="Meg. Gloves +2",ring1="Apate Ring",ring2="Ifrit Ring +1",
        back=gear.str_wsd_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet="Lanun Bottes +3"}
		
    sets.precast.WS.Acc = {
        head="Carmine Mask",neck="Caro Necklace",ear1="Digni. Earring",ear2="Telos Earring",
        body=gear.herc_body_WSD,hands="Meg. Gloves +2",ring1="Rufescent Ring",ring2="Begrudging Ring",
        back=gear.str_wsd_jse_back,waist="Grunfeld Rope",legs="Carmine Cuisses +1",feet="Lanun Bottes +3"}		
		
    sets.precast.WS.Proc = {
        head="Carmine Mask +1",neck="Combatant's Torque",ear1="Digni. Earring",ear2="Mache Earring +1",
        body="Mummu Jacket +2",hands="Floral Gauntlets",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back=gear.tp_jse_back,waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Malignance Boots"}
		
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {head="Carmine Mask",ring2="Rufescent Ring",legs="Carmine Cuisses +1",feet="Carmine Greaves"})

	sets.precast.WS['Evisceration'] = {ammo=gear.WSbullet,
        head="Adhemar Bonnet +1",neck="Caro Necklace",ear1="Odr Earring",ear2="Moonshade Earring",
        body="Sayadio's Kaftan",hands=gear.herc_hands_AA,ring1="Hetairoi Ring",ring2="Begrudging Ring",
        back=gear.tp_jse_back,waist="Fotia Belt",legs="Mummu Kecks +1",feet=gear.herc_feet_TA}
		
	sets.precast.WS['Evisceration'].Acc = {ammo=gear.WSbullet,
        head="Mummu Bonnet +2",neck="Fotia Gorget",ear1="Odr Earring",ear2="Moonshade Earring",
        body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Regal Ring",ring2="Begrudging Ring",
        back=gear.tp_jse_back,waist="Fotia Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}

	sets.precast.WS['Savage Blade'] = {ammo=gear.WSbullet,
        head="Lilitu Headpiece",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",
        body="Laksa. Frac +2",hands="Meg. Gloves +2",ring1="Epaminondas's Ring",ring2="Ifrit Ring +1",
        back=gear.str_wsd_jse_back,waist="Sailfi Belt +1",legs="Meg. Chausses +2",feet="Lanun Bottes +3"}

    sets.precast.WS['Savage Blade'].Acc = {ammo=gear.WSbullet,
        head="Carmine Mask +1",neck="Combatant's Torque",ear1="Moonshade Earring",ear2="Telos Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Rufescent Ring",
        back=gear.str_wsd_jse_back,waist="Grunfeld Rope",legs="Carmine Cuisses +1",feet="Lanun Bottes +3"}
	
    sets.precast.WS['Last Stand'] = {ammo=gear.WSbullet,
        head="Lanun Tricorne +2",neck="Ocachi Gorget",ear1="Moonshade Earring",ear2="Ishvara Earring",
        body="Laksa. Frac +2",hands="Chasseur's Gants +2",ring1="Epaminondas's Ring",ring2="Ifrit Ring +1",
        back=gear.ranger_wsd_jse_back,waist="Fotia Belt",legs="Chas. Culottes +2",feet="Lanun Bottes +3"}

    sets.precast.WS['Last Stand'].Acc = {ammo=gear.WSbullet,
        head="Meghanada Visor +2",neck="Comm. Charm +1",ear1="Moonshade Earring",ear2="Telos Earring",
        body="Laksa. Frac +2",hands="Chasseur's Gants +2",ring1="Regal Ring",ring2="Dingir Ring",
        back=gear.ranger_wsd_jse_back,waist="Fotia Belt",legs="Chas. Culottes +2",feet="Lanun Bottes +3"}
		
    sets.precast.WS['Detonator'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Detonator'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Slug Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Slug Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Numbing Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Numbing Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Sniper Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Sniper Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Split Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Split Shot'].Acc = sets.precast.WS['Last Stand'].Acc
	
    sets.precast.WS['Leaden Salute'] = {ammo=gear.MAbullet,
        head="Pixie Hairpin +1",neck="Comm. Charm +1",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body="Lanun Frac +3",hands="Carmine Fin. Ga.",ring1="Archon Ring",ring2="Arvina Ringlet +1",
        back=gear.magic_wsd_jse_back,waist="Eschan Stone",legs=gear.herc_legs_MAB,feet="Lanun Bottes +3"}
		
    sets.precast.WS['Leaden Salute'].Acc = {ammo=gear.MAbullet,
        head="Pixie Hairpin +1",neck="Comm. Charm +1",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body="Lanun Frac +3",hands="Carmine Fin. Ga.",ring1="Archon Ring",ring2="Dingir Ring",
        back=gear.magic_wsd_jse_back,waist="Eschan Stone",legs="Nyame Flanchard",feet="Lanun Bottes +3"}

    sets.precast.WS['Aeolian Edge'] = {ammo="Animikii Bullet",
        head=gear.herc_head_MAB,neck="Baetyl Pendant",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body="Lanun Frac +3",hands="Carmine Fin. Ga.",ring1="Metamor. Ring +1",ring2="Dingir Ring",
        back=gear.magic_wsd_jse_back,waist="Eschan Stone",legs=gear.herc_legs_MAB,feet="Lanun Bottes +3"}

    sets.precast.WS['Wildfire'] = {ammo=gear.MAbullet,
        head=gear.herc_head_MAB,neck="Comm. Charm +1",ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Lanun Frac +3",hands="Carmine Fin. Ga. +1",ring1="Acumen Ring",ring2="Arvina Ringlet +1",
        back=gear.magic_wsd_jse_back,waist="Eschan Stone",legs=gear.herc_legs_MAB,feet="Lanun Bottes +3"}

    sets.precast.WS['Wildfire'].Acc = {ammo=gear.MAbullet,
        head=gear.herc_head_MAB,neck="Comm. Charm +1",ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Lanun Frac +3",hands="Chasseur's Gants +2",ring1="Regal Ring",ring2="Dingir Ring",
        back=gear.magic_wsd_jse_back,waist="Eschan Stone",legs="Nyame Flanchard",feet="Lanun Bottes +3"}
		
    sets.precast.WS['Hot Shot'] = sets.precast.WS['Wildfire']
    sets.precast.WS['Hot Shot'].Acc = sets.precast.WS['Wildfire'].Acc
		
		--Because omen skillchains.
    sets.precast.WS['Burning Blade'] = {ammo=gear.RAbullet,
        head="Meghanada Visor +2",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Sanare Earring",
        body="Meg. Cuirie +2",hands="Malignance Gloves",ring1="Defending Ring",ring2="Dark Ring",
        back="Moonbeam Cape",waist="Flume Belt +1",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}
        
    -- Midcast Sets
    sets.midcast.FastRecast = {
        head="Carmine Mask",neck="Baetyl Pendant",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
        body="Dread Jupon",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
        back="Moonbeam Cape",waist="Flume Belt +1",legs="Rawhide Trousers",feet="Carmine Greaves"}
        
    -- Specific spells

	sets.midcast.Cure = {
        head="Carmine Mask +1",neck="Phalaina Locket",ear1="Enchntr. Earring +1",ear2="Mendi. Earring",
        body="Dread Jupon",hands="Leyline Gloves",ring1="Janniston Ring",ring2="Lebeche Ring",
        back="Solemnity Cape",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}
	
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	
    sets.midcast.Utsusemi = sets.midcast.FastRecast

    -- Ranged gear
    sets.midcast.RA = {ammo=gear.RAbullet,
        head="Ikenga's Hat",neck="Ocachi Gorget",ear1="Enervating Earring",ear2="Telos Earring",
        body="Ikenga's Vest",hands="Ikenga's Gloves",ring1="Petrov Ring",ring2="Apate Ring",
        back=gear.tp_ranger_jse_back,waist="Yemaya Belt",legs="Chas. Culottes +2",feet="Ikenga's Clogs"}

    sets.midcast.RA.Acc = {ammo=gear.RAbullet,
        head="Ikenga's Hat",neck="Comm. Charm +1",ear1="Enervating Earring",ear2="Telos Earring",
        body="Ikenga's Vest",hands="Ikenga's Gloves",ring1="Longshot Ring",ring2="Paqichikaji Ring",
        back=gear.tp_ranger_jse_back,waist="Yemaya Belt",legs="Chas. Culottes +2",feet="Ikenga's Clogs"}
		
	sets.buff['Triple Shot'] = {body="Oshosi Vest"}
    
    -- Sets to return to when not performing an action.
	
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
    
    -- Resting sets
    sets.resting = {}
	sets.BulletPouch = {waist="Chr. Bul. Pouch"}

    -- Idle sets
    sets.idle = {ammo=gear.RAbullet,
        head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Alabaster Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Murky Ring",ring2="Shadow Ring",
        back="Moonbeam Cape",waist="Flume Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
    sets.idle.PDT = {ammo=gear.RAbullet,
        head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Dark Ring",
        back="Shadow Mantle",waist="Flume Belt +1",legs="Nyame Flanchard",feet="Malignance Boots"}
		
    sets.idle.Refresh = {ammo=gear.RAbullet,
        head=gear.herc_head_Ref,neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Lanun frac +3",hands=gear.herc_hands_Ref,ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back="Moonbeam Cape",waist="Flume Belt +1",legs="Rawhide Trousers",feet=gear.herc_feet_Ref}
    
    -- Defense sets
    sets.defense.PDT = {ammo=gear.RAbullet,
        head="Nyame Helm",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Tuisto Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Warden's Ring",
        back="Shadow Mantle",waist="Flume Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.defense.MDT = {ammo=gear.RAbullet,
        head="Nyame Helm",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
        back="Moonbeam Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
    sets.defense.MEVA = {ammo=gear.RAbullet,
        head="Nyame Helm",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
        back="Moonbeam Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.Kiting = {ring2="Shneddick Ring"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.DWMax = {ear1="Dudgeon Earring",ear2="Heartseeker Earring",body="Adhemar Jacket +1",hands="Floral Gauntlets",waist="Reiki Yotai"}

	-- Weapons sets
	sets.weapons.Default = {main="Naegling",sub="Nusku Shield",range="Fomalhaut"}
	sets.weapons.Ranged = {main="Kustawi +1",sub="Nusku Shield",range="Fomalhaut"}
	sets.weapons.Evisceration = {main="Tauret",sub="Nusku Shield",range="Ataktos"}
	sets.weapons.DualWeapons = {main="Naegling",sub="Gleti's Knife",range="Fomalhaut"}
	sets.weapons.DualSavageWeapons = {main="Naegling",sub="Blurred Knife +1",range="Ataktos"}
	sets.weapons.DualEvisceration = {main="Tauret",sub="Blurred Knife +1",range="Ataktos"}
	sets.weapons.Savage = {main="Naegling",sub="Nusku Shield",range="Ataktos"}
	sets.weapons.DualLeadenRanged = {main="Lanun Knife",sub="Tauret",range="Fomalhaut"}
	sets.weapons.DualLeadenMelee = {main="Naegling",sub="Atoyac",range="Fomalhaut"}
	sets.weapons.DualAeolian = {main="Lanun Knife",sub="Tauret",range="Ataktos"}
	sets.weapons.DualLeadenMeleeAcc = {main="Naegling",sub="Blurred Knife +1",range="Fomalhaut"}
	sets.weapons.DualRanged = {main="Lanun Knife",sub="Kustawi +1",range="Fomalhaut"}
	
    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
		head="Dampening Tam",neck="Ainia Collar",ear1="Dedition Earring",ear2="Telos Earring",
		body="Adhemar Jacket +1",hands="Adhemar Wristbands +1",ring1="Petrov Ring",ring2="Epona's Ring",
		back=gear.tp_jse_back,waist="Windbuffet Belt",legs="Samnuha Tights",feet=gear.herc_feet_TA}
    
    sets.engaged.Acc = {
		head="Malignance Chapeau",neck="Defiant Collar",ear1="Cessance Earring",ear2="Telos Earring",
		body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Chirich Ring",ring2="Chirich Ring",
		back=gear.tp_jse_back,waist="Olseni Belt",legs="Chas. Culottes +2",feet=gear.herc_feet_TA}
		
    sets.engaged.DT = {
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Murky Ring",ring2="Petrov Ring",
        back=gear.tp_jse_back,waist="Windbuffet Belt",legs="Chas. Culottes +2",feet="Malignance Boots"}
    
    sets.engaged.Acc.DT = {
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Telos Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Ramuh Ring",
        back=gear.tp_jse_back,waist="Olseni Belt",legs="Chas. Culottes +2",feet="Malignance Boots"}

    sets.engaged.DW = {
		head="Dampening Tam",neck="Ainia Collar",ear1="Dedition Earring",ear2="Telos Earring",
		body="Adhemar Jacket +1",hands="Adhemar Wristbands +1",ring1="Petrov Ring",ring2="Epona's Ring",
		back=gear.tp_jse_back,waist="Reiki Yotai",legs="Samnuha Tights",feet=gear.herc_feet_TA}
    
    sets.engaged.DW.Acc = {
		head="Malignance Chapeau",neck="Defiant Collar",ear1="Odr Earring",ear2="Telos Earring",
		body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Chirich Ring",ring2="Chirich Ring",
		back=gear.tp_jse_back,waist="Reiki Yotai",legs="Chas. Culottes +2",feet=gear.herc_feet_TA}
		
    sets.engaged.DW.DT = {
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Suppanomimi",ear2="Brutal Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Epona's Ring",
        back=gear.tp_jse_back,waist="Reiki Yotai",legs="Chas. Culottes +2",feet="Malignance Boots"}
    
    sets.engaged.DW.Acc.DT = {
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Suppanomimi",ear2="Telos Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Ramuh Ring +1",
        back=gear.tp_jse_back,waist="Reiki Yotai",legs="Chas. Culottes +2",feet="Malignance Boots"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    if player.sub_job == 'NIN' then
        set_macro_page(1, 14)
    elseif player.sub_job == 'DNC' then
		set_macro_page(1, 14)
    elseif player.sub_job == 'RNG' then
        set_macro_page(1, 14)
    elseif player.sub_job == 'DRG' then
        set_macro_page(1, 14)
    else
        set_macro_page(1, 14)
    end
end



autows_list = {['Default']='Savage Blade',['Evisceration']='Evisceration',['Savage']='Savage Blade',['Ranged']='Last Stand',['DualWeapons']='Savage Blade',['DualSavageWeapons']='Savage Blade',['DualEvisceration']='Evisceration',['DualLeadenRanged']='Leaden Salute',['DualLeadenMelee']='Leaden Salute',['DualAeolian']='Aeolian Edge',['DualRanged']='Last Stand'}
