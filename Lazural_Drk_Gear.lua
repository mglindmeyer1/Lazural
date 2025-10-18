function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc','Fodder','Tank')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.HybridMode:options('Normal', 'Hybrid', 'HybridTP')
    state.PhysicalDefenseMode:options('PDT', 'PDTReraise')
    state.MagicalDefenseMode:options('MDT', 'MDTReraise')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'PDT','Refresh','Reraise')
	state.Weapons:options('GS','Scythe','Savage','GA','Club')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','DTGrip'}
	state.Passive = M{['description'] = 'Passive Mode','None','MP','Twilight'}
	state.DrainSwapWeaponMode = M{'Always','Never','300','1000'}

	gear.da_jse_back ={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}
	gear.wsd_jse_back ={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon Skill Damage +10%',}}
	gear.wsdv_jse_back ={ name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','Weapon Skill Damage +10%',}}

	-- Additional local binds
	send_command('bind ^` input /ja "Hasso" <me>')
	send_command('bind !` input /ja "Seigan" <me>')
	send_command('bind @` gs c cycle SkillchainMode')
	
	select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	-- Precast Sets
	-- Precast sets to enhance JAs
	sets.precast.JA['Diabolic Eye'] = {}
	sets.precast.JA['Arcane Circle'] = {}
	sets.precast.JA['Souleater'] = {}
	sets.precast.JA['Weapon Bash'] = {}
	sets.precast.JA['Nether Void'] = {}
	sets.precast.JA['Blood Weapon'] = {}
	sets.precast.JA['Dark Seal'] = {}
	sets.precast.JA['Last Resort'] = {back="Ankou's Mantle"}
                   
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
                   
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}
           
	sets.precast.Step = {}
	
	sets.precast.Flourish1 = {}
		   
	-- Fast cast sets for spells

	sets.precast.FC = {ammo="Sapience Orb",
		head="Carmine Mask",neck="Voltsurge Torque",ear1="Loquac. Earring",ear2="Malignance Earring",
		body="Odyss. Chestplate",hands="Leyline Gloves",ring1="Weatherspoon Ring",ring2="Kishar Ring",
		back="Moonlight Cape",waist="Flume Belt",legs="Eschite Cuisses",feet="Carmine Greaves"}

	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
		
	-- Midcast Sets
	sets.midcast.FastRecast = {ammo="Staunch Tathlum",
		head="Carmine Mask",neck="Voltsurge Torque",ear1="Loquac. Earring",ear2="Malignance Earring",
		body="Odyss. Chestplate",hands="Leyline Gloves",ring1="Weatherspoon Ring",ring2="Kishar Ring",
		back="Moonlight Cape",waist="Tempus Fugit",legs="Eschite Cuisses",feet="Carmine Greaves"}
                   
	-- Specific spells
 
	sets.midcast['Dark Magic'] = {ammo="Pemphredo Tathlum",
		head="Heath. Burgeon. +2",neck="Erra Pendant",ear1="Digni. Earring",ear2="Malignance Earring",
		body="Ig. Cuirass +4",hands="Fall. Fin. Gaunt. +3",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Niht Mantle",waist="Eschan Stone",legs="Heathen's Flanchard +2",feet="Ratri Sollerets"}
           
	sets.midcast['Enfeebling Magic'] = {ammo="Pemphredo Tathlum",
		head="Carmine Mask",neck="Erra Pendant",ear1="Digni. Earring",ear2="Malignance Earring",
		body="Ig. Cuirass +4",hands="Flam. Manopolas +2",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Toro Cape",waist="Eschan Stone",legs="Flamma Dirs +2",feet="Heath. Sollerets +2"}
		   
	sets.midcast['Dread Spikes'] = set_combine(sets.midcast['Dark Magic'], 
	{head="Ratri Sallet",neck="Dualism Collar +1", ammo="Egoist's Tathlum",ear1="Tuisto Earring",ear2="Odnowa Earring +1",
	body="Heath. Cuirass +2",hands="Ratri Gadlings",ring1="Moonlight Ring", ring2="Gelatinous Ring +1",
	waist="Oneiros Belt",legs="Ratri Cuisses", back="Moonbeam Cape"})

	sets.midcast.Absorb = set_combine(sets.midcast['Dark Magic'], {back="Ankou's Mantle"})
           
	sets.midcast.Stun = {ammo="Pemphredo Tathlum",
		head="Carmine Mask",neck="Erra Pendant",ear1="Digni. Earring",ear2="Malignance Earring",
		body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Toro Cape",waist="Eschan Stone",legs="Eschite Cuisses",feet="Flam. Gambieras +2"}
                   
	sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {ring1="Evanescence Ring",ring2="Archon Ring",back="Niht Mantle"})
	
	sets.DrainWeapon = {main="Misanthropy",sub="Niobid Strap"}
	
	--sets.AbsorbWeapon = {main="Liberator",sub="Khonsu",range="Ullr",ammo=empty}
	--sets.DreadWeapon = {main="Crepuscular Scythe",sub="Utu Grip",} 	
                   
	sets.midcast.Aspir = sets.midcast.Drain
	
	sets.midcast.Impact = set_combine(sets.midcast['Dark Magic'], {head=empty,body="Twilight Cloak"})
	
	sets.midcast.Cure = {}
	
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
						                   
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Knobkierrie",
		head="Heath. Burgeon. +2",neck="Abyssal Beads +1",ear1="Lugra Earring +1",ear2="Moonshade Earring",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Sroda Ring",ring2="Niqmaddu Ring",
		back=gear.wsd_jse_back,waist="Fotia Belt",legs="Sulev. Cuisses +2",feet="Sakpata's Leggings"}

	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {neck="Combatant's Torque"})
	sets.precast.WS.Fodder = set_combine(sets.precast.WS, {ammo="Knobkierrie",
		head="Hjarrandi Helm",neck="Abyssal Beads +1",ear1="Lugra Earring +1",ear2="Moonshade Earring",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Sroda Ring",ring2="Niqmaddu Ring",
		back=gear.wsd_jse_back,waist="Fotia Belt",legs="Sulev. Cuisses +2",feet="Sakpata's Leggings"})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Torcleaver'] = set_combine(sets.precast.WS, {ear1="Thrud Earring",body="Ignominy Cuirass +4",waist="Sailfi Belt +1",legs="Fall. Flanchard +4", feet="Heath. Sollerets +2",back=gear.wsdv_jse_back})
    sets.precast.WS['Torcleaver'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Torcleaver'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Torcleaver'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Torcleaver'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
    sets.precast.WS['Catastrophe'] = set_combine(sets.precast.WS, {head="Heath. Burgeon. +2",ear2="Thrud Earring",body="Ignominy Cuirass +4",hand="Ratri Gadlings", waist="Sailfi Belt +1",legs="Fall. Flanchard +4", feet="Heath. Sollerets +2"})
    sets.precast.WS['Catastrophe'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Catastrophe'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Catastrophe'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Catastrophe'].Fodder = set_combine(sets.precast.WS.Fodder, {head="Ratri Sallet",ear2="Thrud Earring",body="Ignominy Cuirass +4",hand="Ratri Gadlings", waist="Sailfi Belt +1",legs="Fall. Flanchard +4", feet="Heath. Sollerets +2"})
	
	sets.precast.WS['Quietus'] = sets.precast.WS['Catastrophe']
    sets.precast.WS['Quietus'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Quietus'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Quietus'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Quietus'].Fodder = set_combine(sets.precast.WS.Fodder, {})

	sets.precast.WS['Cross Reaper'] = sets.precast.WS['Catastrophe']
    sets.precast.WS['Cross Reaper'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Cross Reaper'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Cross Reaper'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Cross Reaper'].Fodder = set_combine(sets.precast.WS.Fodder, {})

	sets.precast.WS['Insurgency'] = set_combine(sets.precast.WS['Catastrophe'], {legs="Ratri Cuisses", feet="Sakpata's Leggings"})
    sets.precast.WS['Insurgency'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Insurgency'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Insurgency'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Insurgency'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Entropy'] = set_combine(sets.precast.WS['Catastrophe'], {ammo="Seething Bomblet",ear2="Malignance Earring"})
    sets.precast.WS['Entropy'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Entropy'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Entropy'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Entropy'].Fodder = set_combine(sets.precast.WS.Fodder, {})
     
    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, {ear2="Thrud Earring",head="Heath. Burgeon. +2", Legs="Sakpata's Cuisses", back=gear.da_jse_back})
    sets.precast.WS['Resolution'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Resolution'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Resolution'].Fodder = set_combine(sets.precast.WS.Fodder, {})

	sets.precast.WS['Upheaval'] = set_combine(sets.precast.WS, {ear2="Thrud Earring",head="Heath. Burgeon. +2", Legs="Sakpata's Cuisses", back=gear.wsdv_jse_back})
    sets.precast.WS['Upheaval'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Upheaval'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Upheaval'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Upheaval'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
	sets.precast.WS['Savage Blade'] =set_combine(sets.precast.WS['Torcleaver'], {back=gear.wsd_jse_back})
    sets.precast.WS['Savage Blade'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Savage Blade'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Savage Blade'].Fodder = set_combine(sets.precast.WS.Fodder, {})

	sets.precast.WS['Judgment'] = sets.precast.WS['Savage Blade']
    sets.precast.WS['Judgment'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Judgment'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Judgment'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Judgment'].Fodder = set_combine(sets.precast.WS.Fodder, {})
           
     -- Sets to return to when not performing an action.
           
     -- Resting sets
     sets.resting = {}
           
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Lugra Earring +1",ear2="Brutal Earring",}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.AccDayMaxTPWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.DayMaxTPWSEars = {ear1="Ishvara Earring",ear2="Brutal Earring",}
	sets.AccDayWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.DayWSEars = {ear1="Brutal Earring",ear2="Moonshade Earring",}
     
            -- Idle sets
           
    sets.idle = {ammo="Staunch Tathlum",
		head="Hjarrandi Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Hjarrandi Breast.",hands="Nyame Gauntlets",ring1="Moonlight Ring",ring2="Gelatinous Ring +1",
		back="Moonbeam Cape",waist="Flume Belt",legs="Carmine Cuisses +1",feet="Nyame Sollerets"}
		
    sets.idle.PDT = {ammo="Staunch Tathlum",
	head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
	body="Sakpata's Plate",hands="Nyame Gauntlets",ring1="Moonlight Ring",ring2="Gelatinous Ring +1",
	back="Moonbeam Cape",waist="Flume Belt",legs="Carmine Cuisses +1",feet="Nyame Sollerets"}

	sets.idle.Weak = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})
		
	sets.idle.Reraise = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})

	sets.idle.Refresh = set_combine(sets.idle, {head="Jumalik Helm",body="Jumalik Mail", neck="Coatl Gorget +1"})
           
    -- Defense sets
	sets.defense.PDT = {ammo="Staunch Tathlum",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Sakpata's Plate",hands="Nyame Gauntlets",ring1="Moonlight Ring",ring2="Gelatinous Ring +1",
		back="Shadow Mantle",waist="Flume Belt",legs="Carmine Cuisses +1",feet="Nyame Sollerets"}
		
	sets.defense.PDTReraise = set_combine(sets.defense.PDT, {head="Twilight Helm",body="Twilight Mail"})

	sets.defense.MDT = {ammo="Staunch Tathlum +1",
		head="Loess Barbuta +1",neck="Warder's Charm +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Tartarus Platemail",hands="Sulev. Gauntlets +2",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs="Sulev. Cuisses +2",feet="Amm Greaves"}
		
	sets.defense.MDTReraise = set_combine(sets.defense.MDT, {head="Twilight Helm",body="Twilight Mail"})
		
	sets.defense.MEVA = {ammo="Staunch Tathlum +1",
		head="Loess Barbuta +1",neck="Warder's Charm +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Tartarus Platemail",hands="Sulev. Gauntlets +2",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs="Sulev. Cuisses +2",feet="Amm Greaves"}
     
	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.passive.Reraise = {head="Twilight Helm",body="Twilight Mail"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.buff['Dark Seal'] = {} --head="Fallen's Burgeonet +3"

	--extra melee gear
	sets.DTGrip = {sub="Kaja Grip"}
     
	-- Engaged sets
	sets.engaged = {ammo="Aurgelmir Orb",
		head="Flam. Zucchetto +2",neck="Abyssal Beads +1",ear1="Dedition Earring",ear2="Cessance Earring",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Moonlight Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back,waist="Ioskeha Belt +1",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
	
	sets.engaged.Hybrid = {ammo="Aurgelmir Orb",
		head="Hjarrandi Helm",neck="Abyssal Beads +1",ear1="Odnowa Earring +1",ear2="Telos Earring",
		body="Hjarrandi Breast.",hands="Sakpata's Gauntlets",ring1="Moonlight Ring",ring2="Chirich Ring",
		back=gear.da_jse_back,waist="Ioskeha Belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}

	sets.engaged.HybridTP = {ammo="Aurgelmir Orb",
		head="Hjarrandi Helm",neck="Abyssal Beads +1",ear1="Cessance Earring",ear2="Telos Earring",
		body="Hjarrandi Breast.",hands="Sakpata's Gauntlets",ring1="Moonlight Ring",ring2="Chirich Ring",
		back=gear.da_jse_back,waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Flam. Gambieras +2"}

    sets.engaged.Acc = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Abyssal Beads +1",ear1="Telos Earring",ear2="Cessance Earring",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Moonlight Ring",ring2="Chirich Ring",
		back=gear.da_jse_back,waist="Ioskeha Belt +1",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}

    sets.engaged.Fodder = {ammo="Aurgelmir Orb",
		head="Hjarrandi Helm",neck="Abyssal Beads +1",ear1="Telos Earring",ear2="Cessance Earring",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Chirich Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back,waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Flam. Gambieras +2"}

	sets.engaged.Tank = {ammo="Staunch Tathlum",
		head="Hjarrandi Helm",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
		body="Hjarrandi Breast.",hands="Sakpata's Gauntlets",ring1="Moonlight Ring",ring2="Chirich Ring",
		back="Moonbeam Cape",waist="Ioskeha Belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
--Example sets:
--[[
    sets.engaged.Adoulin = {}
	sets.engaged.SomeAcc.Adoulin = {}
	sets.engaged.Acc.Adoulin = {}
	sets.engaged.FullAcc.Adoulin = {}
	sets.engaged.Fodder.Adoulin = {}
	
	sets.engaged.PDT = {}
	sets.engaged.SomeAcc.PDT = {}
	sets.engaged.Acc.PDT = {}
	sets.engaged.FullAcc.PDT = {}
	sets.engaged.Fodder.PDT = {}
	
	sets.engaged.PDT.Adoulin = {}
	sets.engaged.SomeAcc.PDT.Adoulin = {}
	sets.engaged.Acc.PDT.Adoulin = {}
	sets.engaged.FullAcc.PDT.Adoulin = {}
	sets.engaged.Fodder.PDT.Adoulin = {}
	
	sets.engaged.MDT = {}
	sets.engaged.SomeAcc.MDT = {}
	sets.engaged.Acc.MDT = {}
	sets.engaged.FullAcc.MDT = {}
	sets.engaged.Fodder.MDT = {}
	
	sets.engaged.MDT.Adoulin = {}
	sets.engaged.SomeAcc.MDT.Adoulin = {}
	sets.engaged.Acc.MDT.Adoulin = {}
	sets.engaged.FullAcc.MDT.Adoulin = {}
	sets.engaged.Fodder.MDT.Adoulin = {}
	
            -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
            -- sets if more refined versions aren't defined.
            -- If you create a set with both offense and defense modes, the offense mode should be first.
            -- EG: sets.engaged.Dagger.Accuracy.Evasion

-- Liberator melee sets
    sets.engaged.Liberator = {}
	sets.engaged.Liberator.SomeAcc = {}
	sets.engaged.Liberator.Acc = {}
	sets.engaged.Liberator.FullAcc = {}
	sets.engaged.Liberator.Fodder = {}
	
    sets.engaged.Liberator.Adoulin = {}
	sets.engaged.Liberator.SomeAcc.Adoulin = {}
	sets.engaged.Liberator.Acc.Adoulin = {}
	sets.engaged.Liberator.FullAcc.Adoulin = {}
	sets.engaged.Liberator.Fodder.Adoulin = {}
	
    sets.engaged.Liberator.AM = {}
	sets.engaged.Liberator.SomeAcc.AM = {}
	sets.engaged.Liberator.Acc.AM = {}
	sets.engaged.Liberator.FullAcc.AM = {}
	sets.engaged.Liberator.Fodder.AM = {}
	
    sets.engaged.Liberator.Adoulin.AM = {}
	sets.engaged.Liberator.SomeAcc.Adoulin.AM = {}
	sets.engaged.Liberator.Acc.Adoulin.AM = {}
	sets.engaged.Liberator.FullAcc.Adoulin.AM = {}
	sets.engaged.Liberator.Fodder.Adoulin.AM = {}

	sets.engaged.Liberator.PDT = {}
	sets.engaged.Liberator.SomeAcc.PDT = {}
	sets.engaged.Liberator.Acc.PDT = {}
	sets.engaged.Liberator.FullAcc.PDT = {}
	sets.engaged.Liberator.Fodder.PDT = {}
	
	sets.engaged.Liberator.PDT.Adoulin = {}
	sets.engaged.Liberator.SomeAcc.PDT.Adoulin = {}
	sets.engaged.Liberator.Acc.PDT.Adoulin = {}
	sets.engaged.Liberator.FullAcc.PDT.Adoulin = {}
	sets.engaged.Liberator.Fodder.PDT.Adoulin = {}
	
	sets.engaged.Liberator.PDT.AM = {}
	sets.engaged.Liberator.SomeAcc.PDT.AM = {}
	sets.engaged.Liberator.Acc.PDT.AM = {}
	sets.engaged.Liberator.FullAcc.PDT.AM = {}
	sets.engaged.Liberator.Fodder.PDT.AM = {}
	
	sets.engaged.Liberator.PDT.Adoulin.AM = {}
	sets.engaged.Liberator.SomeAcc.PDT.Adoulin.AM = {}
	sets.engaged.Liberator.Acc.PDT.Adoulin.AM = {}
	sets.engaged.Liberator.FullAcc.PDT.Adoulin.AM = {}
	sets.engaged.Liberator.Fodder.PDT.Adoulin.AM = {}
	
	sets.engaged.Liberator.MDT = {}
	sets.engaged.Liberator.SomeAcc.MDT = {}
	sets.engaged.Liberator.Acc.MDT = {}
	sets.engaged.Liberator.FullAcc.MDT = {}
	sets.engaged.Liberator.Fodder.MDT = {}
	
	sets.engaged.Liberator.MDT.Adoulin = {}
	sets.engaged.Liberator.SomeAcc.MDT.Adoulin = {}
	sets.engaged.Liberator.Acc.MDT.Adoulin = {}
	sets.engaged.Liberator.FullAcc.MDT.Adoulin = {}
	sets.engaged.Liberator.Fodder.MDT.Adoulin = {}
	
	sets.engaged.Liberator.MDT.AM = {}
	sets.engaged.Liberator.SomeAcc.MDT.AM = {}
	sets.engaged.Liberator.Acc.MDT.AM = {}
	sets.engaged.Liberator.FullAcc.MDT.AM = {}
	sets.engaged.Liberator.Fodder.MDT.AM = {}
	
	sets.engaged.Liberator.MDT.Adoulin.AM = {}
	sets.engaged.Liberator.SomeAcc.MDT.Adoulin.AM = {}
	sets.engaged.Liberator.Acc.MDT.Adoulin.AM = {}
	sets.engaged.Liberator.FullAcc.MDT.Adoulin.AM = {}
	sets.engaged.Liberator.Fodder.MDT.Adoulin.AM = {}
]]--
	--Extra Special Sets
	
	sets.buff.Souleater = {}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.GS = {main="Agwu's Claymore",sub="Utu Grip"}
	sets.weapons.Scythe = {main="Apocalypse",sub="Utu Grip"}
	sets.weapons.Savage = {main="Naegling",sub="Blurred Shield +1"}
	sets.weapons.GA = {main="Lycurgos",sub="Utu Grip"}
	sets.weapons.Club = {main="Loxotic Mace +1",sub="Blurred Shield +1"}
	
	
    end
	
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(2, 9)
    elseif player.sub_job == 'SAM' then
        set_macro_page(1, 9)
    elseif player.sub_job == 'DNC' then
        set_macro_page(3, 9)
    elseif player.sub_job == 'THF' then
        set_macro_page(1, 9)
    else
        set_macro_page(1, 9)
    end
end