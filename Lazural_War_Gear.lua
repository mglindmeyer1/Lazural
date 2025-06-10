function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Grip','SomeAcc','Acc','FullAcc','Fodder')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.HybridMode:options('Normal','Hybrid', 'PDT','Reraise','PDTTP')
    state.PhysicalDefenseMode:options('PDT', 'PDTReraise', 'PDTTP')
    state.MagicalDefenseMode:options('MDT', 'MDTReraise')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'PDT','Reraise')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
	state.Passive = M{['description'] = 'Passive Mode','None','Twilight'}
	state.Weapons:options('Savage','Chango','Greatsword','DualWeapons','Club','Polearm','None','ProcDagger','ProcSword','ProcGreatSword','ProcScythe','ProcPolearm','ProcGreatKatana','ProcKatana','ProcClub','ProcStaff')

	gear.da_jse_back = {name="Cichol's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10'}}
	gear.crit_jse_back = {name="Cichol's Mantle",augments={'STR+20','Accuracy+20 Attack+20','Crit.hit rate+10'}}
	gear.wsd_jse_back = {name="Cichol's Mantle",augments={'STR+20','Accuracy+20 Attack+20','Weapon Skill Damage +10%'}}

	autows = "Savage Blade"
	autofood = 'Grape Daifuku'
	-- Additional local binds
	send_command('bind @` input /ja "Hasso" <me>')
	send_command('bind ^` input /ja "Seigan" <me>')
	send_command('bind !` input /ja "Provoke" <t>')
	send_command('bind !r gs c weapons Savage;gs c update')
	send_command('bind !n gs c weapons None;gs c update')
	send_command('bind ^h gs c useitem ring2 Warp Ring')
	send_command('bind !h gs c useitem ring2 Dim. Ring (Holla)')

	--Ikenga_axe_bonus = 300  -- It is 300 at R25. Uncomment if you need to manually adjust because you are using below R25 or above
	
	select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	-- Precast Sets
	
    sets.Enmity = {head="Souv. Schaller +1",neck="Unmoving Collar +1",body="Souveran Cuirass +1",hands="Souv. Handsch. +1",legs="Souv. Diechlings +1",feet="Souveran schuhs +1"}
	sets.Knockback = {}
	sets.passive.Twilight = {head="Twilight Helm",body="Twilight Mail"}
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Berserk'] = {back="Cichol's Mantle",body="Pumm. Lorica +2",feet="Agoge Calligae +1"}
	sets.precast.JA['Warcry'] = {head="Agoge Mask +2"}
	sets.precast.JA['Defender'] = set_combine(sets.Enmity,{})
	sets.precast.JA['Aggressor'] = {body="Agoge Lorica +3"}
	sets.precast.JA['Mighty Strikes'] = {}
	sets.precast.JA["Warrior's Charge"] = {}
	sets.precast.JA['Tomahawk'] = {ammo="Thr. Tomahawk"}
	sets.precast.JA['Retaliation'] = set_combine(sets.Enmity,{})
	sets.precast.JA['Restraint'] = {}
	sets.precast.JA['Blood Rage'] = {body="Boii Lorica"}
	sets.precast.JA['Brazen Rush'] = {}
	sets.precast.JA['Provoke'] = set_combine(sets.Enmity,{})
                   
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
                   
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}
           
	sets.precast.Step = {}
	
	sets.precast.Flourish1 = {}
		   
	-- Fast cast sets for spells

	sets.precast.FC = {ammo="Impatiens",
		head="Sakpata's Helm",neck="Voltsurge Torque",ear1="Etiolation Earring",ear2="Loquac. Earring",
		body="Odyss. Chestplate",hands="Leyline Gloves",ring1="Weatherspoon Ring",ring2="Prolix Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Founder's Hose",feet="Odyssean Greaves"}
	
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

	-- Midcast Sets
	sets.midcast.FastRecast = {ammo="Staunch Tathlum",
		head="Sakpata's Helm",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Odyss. Chestplate",hands="Leyline Gloves",ring1="Weatherspoon Ring",ring2="Prolix Ring",
		back="Moonbeam Cape",waist="Ioskeha Belt",legs="Founder's Hose",feet="Odyssean Greaves"}
	
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {back="Mujin Mantle"})
                   
	sets.midcast.Cure = {neck="Phalaina Locket",body="Souveran Cuirass +1",feet="Odyssean Greaves",back="Solemnity Cape"}
	
	sets.Self_Healing = {Head="Souv. Schaller +1",body="Souveran Cuirass +1",ring2="Kunaji Ring",waist="Gishdubar Sash",legs="Souv. Diechlings +1"}
	sets.Cure_Received = {Head="Souv. Schaller +1",body="Sakpata's Plate",ring2="Kunaji Ring",waist="Gishdubar Sash",legs="Souv. Diechlings +1"}
	sets.Phalanx_Received = {hands="Souv. Handsch. +1",legs="Sakpata's Cuisses",feet="Souveran schuhs +1"}					                   
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Knobkierrie",
		head="Agoge Mask +2",neck="Warrior's Beads",ear1="Brutal Earring",ear2="Moonshade Earring",
		body="Pumm. Lorica +2",hands="Boii Mufflers +2",ring1="Apate Ring",ring2="Niqmaddu Ring",
		back=gear.wsd_jse_back,waist="Fotia Belt",legs="Boii Cuisses +2",feet="Sulev. Leggings +2"}

	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS.Fodder = set_combine(sets.precast.WS, {})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.	
    sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {ear1="Thrud Earring",feet="Sulev. Leggings +2"})
    sets.precast.WS['Savage Blade'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Savage Blade'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Savage Blade'].Fodder = set_combine(sets.precast.WS.Fodder, {})

	sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast.WS, {head="Nyame Helm", ear1="Thrud Earring",body="Nyame Mail", hands="Nyame Gauntlets", legs="Nyame Flanchard",feet="Nyame Sollerets"})
    sets.precast.WS['Sanguine Blade'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Sanguine Blade'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Sanguine Blade'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Sanguine Blade'].Fodder = set_combine(sets.precast.WS.Fodder, {})

	sets.precast.WS['Full Break'] = set_combine(sets.precast.WS, {head="Flam. Zucchetto +2",body="Flamma Korazin +2",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"})
    sets.precast.WS['Full Break'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Full Break'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Full Break'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Full Break'].Fodder = set_combine(sets.precast.WS.Fodder, {})

	sets.precast.WS['Steel Cyclone'] = set_combine(sets.precast.WS, {ear1="Thrud Earring",feet="Sulev. Leggings +2"})
    sets.precast.WS['Steel Cyclone'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Steel Cyclone'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Steel Cyclone'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Steel Cyclone'].Fodder = set_combine(sets.precast.WS.Fodder, {})

	sets.precast.WS['Mistral Axe'] = set_combine(sets.precast.WS, {ear1="Thrud Earring",feet="Sulev. Leggings +2"})
    sets.precast.WS['Mistral Axe'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Mistral Axe'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Mistral Axe'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Mistral Axe'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Upheaval'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Upheaval'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Upheaval'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Upheaval'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Upheaval'].Fodder = set_combine(sets.precast.WS.Fodder, {})
     
    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Resolution'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Resolution'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Resolution'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
    sets.precast.WS['Ruinator'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Ruinator'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Ruinator'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Ruinator'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Ruinator'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
    sets.precast.WS['Rampage'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Rampage'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Rampage'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Rampage'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Rampage'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
    sets.precast.WS['Raging Rush'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Raging Rush'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Raging Rush'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Raging Rush'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Raging Rush'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
    sets.precast.WS["Ukko's Fury"] = set_combine(sets.precast.WS, {ring1="Begrudging Ring"})
    sets.precast.WS["Ukko's Fury"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS["Ukko's Fury"].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS["Ukko's Fury"].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS["Ukko's Fury"].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
    sets.precast.WS["King's Justice"] = set_combine(sets.precast.WS, {})
    sets.precast.WS["King's Justice"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS["King's Justice"].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS["King's Justice"].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS["King's Justice"].Fodder = set_combine(sets.precast.WS.Fodder, {})

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Thrud Earring",ear2="Brutal Earring",}
	sets.AccMaxTP = {ear1="Mache Earring",ear2="Telos Earring"}
	sets.AccDayMaxTPWSEars = {ear1="Mache Earring",ear2="Telos Earring"}
	sets.DayMaxTPWSEars = {ear1="Thrud Earring",ear2="Brutal Earring",}
	sets.AccDayWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.DayWSEars = {ear1="Brutal Earring",ear2="Moonshade Earring"}
	
	--Specialty WS set overwrites.
	sets.AccWSMightyCharge = {}
	sets.AccWSCharge = {}
	sets.AccWSMightyCharge = {}
	sets.WSMightyCharge = {}
	sets.WSCharge = {}
	sets.WSMighty = {}

     -- Sets to return to when not performing an action.

	 
           
     -- Resting sets
     sets.resting = {}
           
	-- Idle sets
	sets.idle = {ammo="Staunch Tathlum",
		head="Sakpata's Helm",neck="Loricate Torque +1",ear1="Tuisto Earring",ear2="Ethereal Earring",
		body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring1="Moonlight Ring",ring2="Gelatinous Ring +1",
		back="Shadow Mantle",waist="Flume Belt",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
		
	sets.idle.Weak = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})
		
	sets.idle.Reraise = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})
	
	-- Defense sets
	sets.defense.PDT = {ammo="Staunch Tathlum",
		head="Sakpata's Helm",neck="Loricate Torque +1",ear1="Tuisto Earring",ear2="Ethereal Earring",
		body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring1="Moonlight Ring",ring2="Gelatinous Ring +1",
		back="Shadow Mantle",waist="Flume Belt",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
		
	sets.defense.PDTReraise = set_combine(sets.defense.PDT, {head="Twilight Helm",body="Twilight Mail"})

	sets.defense.PDTTP = set_combine(sets.defense.PDT, {head="Arke Zuchetto",body="Arke Corazza",hands="Arke Manopolas",legs="Arke Cosciales",feet="Arke Gambieras"})

	sets.defense.MDT = {ammo="Staunch Tathlum",
		head="Nyame Helm",neck="Warder's Charm +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Tartarus Platemail",hands="Sulev. Gauntlets +2",ring1="Moonlight Ring",ring2="Gelatinous Ring +1",
		back="Moonbeam Cape",waist="Flume Belt",legs="Sulev. Cuisses +2",feet="Amm Greaves"}
		
	sets.defense.MDTReraise = set_combine(sets.defense.MDT, {head="Twilight Helm",body="Twilight Mail"})
		
	sets.defense.MEVA = {ammo="Staunch Tathlum",
		head="Nyame Helm",neck="Warder's Charm +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Tartarus Platemail",hands="Sulev. Gauntlets +2",ring1="Moonlight Ring",ring2="Gelatinous Ring +1",
		back="Moonbeam Cape",waist="Flume Belt +1",legs="Volte Hose",feet="Amm Greaves"}

	sets.Kiting = {feet="Hermes' Sandals"}
	sets.Reraise = {head="Twilight Helm",body="Twilight Mail"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
    
            -- Engaged sets
	sets.engaged = {ammo="Aurgelmir Orb",
		head="Flam. Zucchetto +2",neck="Warrior's Beads",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Agoge Lorica +3",hands="Sulev. Gauntlets +2",ring1="Moonlight Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back,waist="Ioskeha Belt",legs="Pumm. Cuisses +2",feet="Flam. Gambieras +2"}
	
	sets.engaged.PDTTP = set_combine(sets.engaged, {head="Arke Zuchetto",body="Arke Corazza",hands="Arke Manopolas",legs="Arke Cosciales",feet="Arke Gambieras"})
    
	sets.engaged.Hybrid = set_combine(sets.engaged,{head="Hjarrandi Helm",body="Hjarrandi Breast.",ear1="Dedition Earring"})

	sets.engaged.PDT = set_combine(sets.engaged,{head="Hjarrandi Helm",body="Sakpata's Plate",ear1="Dedition Earring",hands="Sakpata's Gauntlets",legs="Sakpata's Cuisses",feet="Sakpata's Leggings" })
	
	sets.engaged.Reraise = set_combine(sets.engaged,{neck="Loricate Torque +1",head="Twilight Helm",body="Twilight Mail",Ring1="Defending Ring",Ring2="Moonlight Ring",ear1="Dedition Earring"}) 

	sets.engaged['Chango'] = {ammo="Aurgelmir Orb",
		head="Flam. Zucchetto +2",neck="Warrior's Beads",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Agoge Lorica +3",hands="Sulev. Gauntlets +2",ring1="Moonlight Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back,waist="Ioskeha Belt",legs="Pumm. Cuisses +2",feet="Flam. Gambieras +2"}
	sets.engaged['Chango'].PDT = set_combine(sets.engaged['Chango'],{head="Hjarrandi Helm",body="Sakpata's Plate",ear1="Dedition Earring"})


	sets.engaged['Greatsword'] = {ammo="Aurgelmir Orb",
		head="Flam. Zucchetto +2",neck="Warrior's Beads",ear1="Telos Earring",ear2="Cessance Earring",
		body="Agoge Lorica +3",hands="Sulev. Gauntlets +2",ring1="Moonlight Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back,waist="Ioskeha Belt",legs="Pumm. Cuisses +2",feet="Flam. Gambieras +2"}	
	
	sets.engaged['DualWeapons'] = {ammo="Aurgelmir Orb",
		head="Flam. Zucchetto +2",neck="Warrior's Beads",ear1="Eabani earring",ear2="Suppanomimi",
		body="Agoge Lorica +3",hands="Sulev. Gauntlets +2",ring1="Moonlight Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back,waist="Ioskeha Belt", Legs="Pumm. Cuisses +2",feet="Pumm. Calligae +2"}

	sets.engaged.SomeAcc = {ammo="Seething Bomblet",
		head="Flam. Zucchetto +2",neck="Warrior's Beads",ear1="Telos Earring",ear2="Cessance Earring",
		body="Agoge Lorica +3",hands="Valorous Mitts",ring1="Moonlight Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back,waist="Ioskeha Belt",legs="Pumm. Cuisses +2",feet="Pumm. Calligae +2"}
	sets.engaged.Acc = {ammo="Aurgelmir Orb",
		head="Flam. Zucchetto +2",neck="Warrior's Beads",ear1="Digni. Earring",ear2="Telos Earring",
		body=gear.valorous_wsd_body,hands=gear.valorous_acc_hands,ring1="Flamma Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back,waist="Ioskeha Belt",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.FullAcc = {ammo="Aurgelmir Orb",
		head="Flam. Zucchetto +2",neck="Warrior's Beads",ear1="Mache Earring +1",ear2="Telos Earring",
		body=gear.valorous_wsd_body,hands=gear.valorous_acc_hands,ring1="Flamma Ring",ring2="Ramuh Ring +1",
		back=gear.da_jse_back,waist="Ioskeha Belt",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.Fodder = {ammo="Aurgelmir Orb",
		head="Flam. Zucchetto +2",neck="Warrior's Beads",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Agoge Lorica +3",hands="Sulev. Gauntlets +2",ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back,waist="Ioskeha Belt",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}


	
	--Extra Special Sets
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Retaliation = {}
	sets.buff.Restraint = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {legs="Volte Hose"})
	
	-- Weapons sets
	sets.weapons.Chango = {main="Lycurgos",sub="Utu Grip"}
	sets.weapons.Polearm = {main="Kaja Lance",sub="Utu Grip"}
	sets.weapons.DualWeapons = {main="Naegling",sub="Reikiko"}
	sets.weapons.Greatsword = {main="Montante",sub="Utu Grip"}
	sets.weapons.Savage = {main="Naegling", sub="Blurred Shield +1"}
	sets.weapons.Club = {main="Loxotic Mace +1", sub="Blurred Shield +1"}
	sets.weapons.ProcDagger = {main="Mercurial kris",sub=empty}
	sets.weapons.ProcSword = {main="Bronze Sword",sub=empty}
	sets.weapons.ProcGreatSword = {main="Rusty Greatsword",sub=empty}
	sets.weapons.ProcScythe = {main="Ark Scythe",sub=empty}
	sets.weapons.ProcPolearm = {main="Pitchfork",sub=empty}
	sets.weapons.ProcGreatKatana = {main="Zanmato",sub=empty}
	sets.weapons.ProcKatana = {main="Trainee Burin",sub=empty}
	sets.weapons.ProcClub = {main="Kitty rod",sub=empty}
	sets.weapons.ProcStaff = {main="Cobra Staff",sub=empty}
	

end
	
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
     --Default macro set/book
    if player.sub_job == 'SAM' then
        set_macro_page(2, 21)
    elseif player.sub_job == 'DNC' then
        set_macro_page(4, 21)
    elseif player.sub_job == 'NIN' then
        set_macro_page(5, 21)
    elseif player.sub_job == 'THF' then
        set_macro_page(6, 21)
    else
        set_macro_page(2, 21)
   end
end

function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Weapons' then
        if newValue == "Savage" then
            set_macro_page(2, 21) -- Macro Page 1, Book 10
        elseif newValue == "Chango" then
            set_macro_page(1, 21) -- Macro Page 2, Book 10
        elseif newValue == "Greatsword" then
            set_macro_page(2, 21) -- Macro Page 3, Book 10	
		else
			set_macro_page(3, 21)
        end
    end
	 if stateField == 'Weapon Mode' then
        select_engaged_set()
    end
end


function user_job_lockstyle()
	windower.chat.input('/lockstyleset 017') --Catchall just in case something's weird.
end



function status_change(new, old)
    check_hp_and_equip()
end

function precast(spell)
    check_hp_and_equip()
end

function aftercast(spell)
    check_hp_and_equip()
end

function job_handle_equipping_gear(status, eventArgs)
    select_engaged_set()
end

--function job_state_change(stateField, newValue, oldValue)
    --if stateField == 'Weapon Mode' then
        --select_engaged_set()
    --end
--end
function select_engaged_set()
    local mainWeapon = player.equipment.main or 'Default'
    
    -- Equip the corresponding engaged set if it exists
    if sets.engaged[mainWeapon] then
        equip(sets.engaged[mainWeapon])
    else
        equip(sets.engaged.Default) -- Fallback engaged set
    end
end
function job_aftercast(spell, action, spellMap, eventArgs)
    if not spell.interrupted then
        select_engaged_set()
    end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
    select_engaged_set()
end

function job_status_change(newStatus, oldStatus)
    if newStatus == 'Engaged' then
        select_engaged_set()
    end
end

reraise_mode = false  -- Tracks whether Reraise gear is locked in

function check_hp_and_equip()
    local hp_percent = (player.hp / player.max_hp) * 100

    if hp_percent < 25 and not reraise_mode then
        equip(sets.Reraise)
        disable("head", "body")  -- Lock Reraise gear
        reraise_mode = true
        add_to_chat(123, "HP critically low! Locking Reraise gear.")
    elseif hp_percent >= 50 and reraise_mode then
        enable("head", "body")  -- Unlock gear slots
        reraise_mode = false
        send_command('gs c update')  -- Restore normal gear
        add_to_chat(123, "HP recovered! Unlocking Reraise gear.")
    end
end

--[[
    sets.engaged.Charge = {}
	sets.engaged.SomeAcc.Charge = {}
	sets.engaged.Acc.Charge = {}
	sets.engaged.FullAcc.Charge = {}
	sets.engaged.Fodder.Charge = {}
	
    sets.engaged.Mighty = {}
	sets.engaged.SomeAcc.Mighty = {}
	sets.engaged.Acc.Mighty = {}
	sets.engaged.FullAcc.Mighty = {}
	sets.engaged.Fodder.Mighty = {}

    sets.engaged.Charge.Mighty = {}
	sets.engaged.SomeAcc.Charge.Mighty = {}
	sets.engaged.Acc.Charge.Mighty = {}
	sets.engaged.FullAcc.Charge.Mighty = {}
	sets.engaged.Fodder.Charge.Mighty = {}
	
    sets.engaged.Adoulin = {}
	sets.engaged.SomeAcc.Adoulin = {}
	sets.engaged.Acc.Adoulin = {}
	sets.engaged.FullAcc.Adoulin = {}
	sets.engaged.Fodder.Adoulin = {}
	
    sets.engaged.Adoulin.Charge = {}
	sets.engaged.SomeAcc.Adoulin.Charge = {}
	sets.engaged.Acc.Adoulin.Charge = {}
	sets.engaged.FullAcc.Adoulin.Charge = {}
	sets.engaged.Fodder.Adoulin.Charge = {}
	
    sets.engaged.Adoulin.Mighty = {}
	sets.engaged.SomeAcc.Adoulin.Mighty = {}
	sets.engaged.Acc.Adoulin.Mighty = {}
	sets.engaged.FullAcc.Adoulin.Mighty = {}
	sets.engaged.Fodder.Adoulin.Mighty = {}
	
    sets.engaged.Adoulin.Charge.Mighty = {}
	sets.engaged.SomeAcc.Adoulin.Charge.Mighty = {}
	sets.engaged.Acc.Adoulin.Charge.Mighty = {}
	sets.engaged.FullAcc.Adoulin.Charge.Mighty = {}
	sets.engaged.Fodder.Adoulin.Charge.Mighty = {}

    sets.engaged.PDT = {}
	sets.engaged.SomeAcc.PDT = {}
	sets.engaged.Acc.PDT = {}
	sets.engaged.FullAcc.PDT = {}
	sets.engaged.Fodder.PDT = {}
	
    sets.engaged.PDT.Charge = {}
	sets.engaged.SomeAcc.PDT.Charge = {}
	sets.engaged.Acc.PDT.Charge = {}
	sets.engaged.FullAcc.PDT.Charge = {}
	sets.engaged.Fodder.PDT.Charge = {}
	
    sets.engaged.PDT.Mighty = {}
	sets.engaged.SomeAcc.PDT.Mighty = {}
	sets.engaged.Acc.PDT.Mighty = {}
	sets.engaged.FullAcc.PDT.Mighty = {}
	sets.engaged.Fodder.PDT.Mighty = {}

    sets.engaged.PDT.Charge.Mighty = {}
	sets.engaged.SomeAcc.PDT.Charge.Mighty = {}
	sets.engaged.Acc.PDT.Charge.Mighty = {}
	sets.engaged.FullAcc.PDT.Charge.Mighty = {}
	sets.engaged.Fodder.PDT.Charge.Mighty = {}
	
    sets.engaged.PDT.Adoulin = {}
	sets.engaged.SomeAcc.PDT.Adoulin = {}
	sets.engaged.Acc.PDT.Adoulin = {}
	sets.engaged.FullAcc.PDT.Adoulin = {}
	sets.engaged.Fodder.PDT.Adoulin = {}
	
    sets.engaged.PDT.Adoulin.Charge = {}
	sets.engaged.SomeAcc.PDT.Adoulin.Charge = {}
	sets.engaged.Acc.PDT.Adoulin.Charge = {}
	sets.engaged.FullAcc.PDT.Adoulin.Charge = {}
	sets.engaged.Fodder.PDT.Adoulin.Charge = {}
	
    sets.engaged.PDT.Adoulin.Mighty = {}
	sets.engaged.SomeAcc.PDT.Adoulin.Mighty = {}
	sets.engaged.Acc.PDT.Adoulin.Mighty = {}
	sets.engaged.FullAcc.PDT.Adoulin.Mighty = {}
	sets.engaged.Fodder.PDT.Adoulin.Mighty = {}
	
    sets.engaged.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.SomeAcc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Acc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.FullAcc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Fodder.PDT.Adoulin.Charge.Mighty = {}

    sets.engaged.MDT = {}
	sets.engaged.SomeAcc.MDT = {}
	sets.engaged.Acc.MDT = {}
	sets.engaged.FullAcc.MDT = {}
	sets.engaged.Fodder.MDT = {}
	
    sets.engaged.MDT.Charge = {}
	sets.engaged.SomeAcc.MDT.Charge = {}
	sets.engaged.Acc.MDT.Charge = {}
	sets.engaged.FullAcc.MDT.Charge = {}
	sets.engaged.Fodder.MDT.Charge = {}
	
    sets.engaged.MDT.Mighty = {}
	sets.engaged.SomeAcc.MDT.Mighty = {}
	sets.engaged.Acc.MDT.Mighty = {}
	sets.engaged.FullAcc.MDT.Mighty = {}
	sets.engaged.Fodder.MDT.Mighty = {}

    sets.engaged.MDT.Charge.Mighty = {}
	sets.engaged.SomeAcc.MDT.Charge.Mighty = {}
	sets.engaged.Acc.MDT.Charge.Mighty = {}
	sets.engaged.FullAcc.MDT.Charge.Mighty = {}
	sets.engaged.Fodder.MDT.Charge.Mighty = {}
	
    sets.engaged.MDT.Adoulin = {}
	sets.engaged.SomeAcc.MDT.Adoulin = {}
	sets.engaged.Acc.MDT.Adoulin = {}
	sets.engaged.FullAcc.MDT.Adoulin = {}
	sets.engaged.Fodder.MDT.Adoulin = {}
	
    sets.engaged.MDT.Adoulin.Charge = {}
	sets.engaged.SomeAcc.MDT.Adoulin.Charge = {}
	sets.engaged.Acc.MDT.Adoulin.Charge = {}
	sets.engaged.FullAcc.MDT.Adoulin.Charge = {}
	sets.engaged.Fodder.MDT.Adoulin.Charge = {}
	
    sets.engaged.MDT.Adoulin.Mighty = {}
	sets.engaged.SomeAcc.MDT.Adoulin.Mighty = {}
	sets.engaged.Acc.MDT.Adoulin.Mighty = {}
	sets.engaged.FullAcc.MDT.Adoulin.Mighty = {}
	sets.engaged.Fodder.MDT.Adoulin.Mighty = {}
	
    sets.engaged.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.SomeAcc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Acc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.FullAcc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Fodder.MDT.Adoulin.Charge.Mighty = {}
	
            -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
            -- sets if more refined versions aren't defined.
            -- If you create a set with both offense and defense modes, the offense mode should be first.
            -- EG: sets.engaged.Dagger.Accuracy.Evasion

-- Conqueror melee sets
    sets.engaged.Conqueror = {}
	sets.engaged.Conqueror.SomeAcc = {}
	sets.engaged.Conqueror.Acc = {}
	sets.engaged.Conqueror.FullAcc = {}
	sets.engaged.Conqueror.Fodder = {}
	
    sets.engaged.Conqueror.Adoulin = {}
	sets.engaged.Conqueror.SomeAcc.Adoulin = {}
	sets.engaged.Conqueror.Acc.Adoulin = {}
	sets.engaged.Conqueror.FullAcc.Adoulin = {}
	sets.engaged.Conqueror.Fodder.Adoulin = {}
	
    sets.engaged.Conqueror.AM = {}
	sets.engaged.Conqueror.SomeAcc.AM = {}
	sets.engaged.Conqueror.Acc.AM = {}
	sets.engaged.Conqueror.FullAcc.AM = {}
	sets.engaged.Conqueror.Fodder.AM = {}
	
    sets.engaged.Conqueror.Adoulin.AM = {}
	sets.engaged.Conqueror.SomeAcc.Adoulin.AM = {}
	sets.engaged.Conqueror.Acc.Adoulin.AM = {}
	sets.engaged.Conqueror.FullAcc.Adoulin.AM = {}
	sets.engaged.Conqueror.Fodder.Adoulin.AM = {}

    sets.engaged.Conqueror.Charge = {}
	sets.engaged.Conqueror.SomeAcc.Charge = {}
	sets.engaged.Conqueror.Acc.Charge = {}
	sets.engaged.Conqueror.FullAcc.Charge = {}
	sets.engaged.Conqueror.Fodder.Charge = {}
	
    sets.engaged.Conqueror.Adoulin.Charge = {}
	sets.engaged.Conqueror.SomeAcc.Adoulin.Charge = {}
	sets.engaged.Conqueror.Acc.Adoulin.Charge = {}
	sets.engaged.Conqueror.FullAcc.Adoulin.Charge = {}
	sets.engaged.Conqueror.Fodder.Adoulin.Charge = {}
	
    sets.engaged.Conqueror.Charge.AM = {}
	sets.engaged.Conqueror.SomeAcc.Charge.AM = {}
	sets.engaged.Conqueror.Acc.Charge.AM = {}
	sets.engaged.Conqueror.FullAcc.Charge.AM = {}
	sets.engaged.Conqueror.Fodder.Charge.AM = {}
	
    sets.engaged.Conqueror.Adoulin.Charge.AM = {}
	sets.engaged.Conqueror.SomeAcc.Adoulin.Charge.AM = {}
	sets.engaged.Conqueror.Acc.Adoulin.Charge.AM = {}
	sets.engaged.Conqueror.FullAcc.Adoulin.Charge.AM = {}
	sets.engaged.Conqueror.Fodder.Adoulin.Charge.AM = {}

	sets.engaged.Conqueror.PDT = {}
	sets.engaged.Conqueror.SomeAcc.PDT = {}
	sets.engaged.Conqueror.Acc.PDT = {}
	sets.engaged.Conqueror.FullAcc.PDT = {}
	sets.engaged.Conqueror.Fodder.PDT = {}
	
	sets.engaged.Conqueror.PDT.Adoulin = {}
	sets.engaged.Conqueror.SomeAcc.PDT.Adoulin = {}
	sets.engaged.Conqueror.Acc.PDT.Adoulin = {}
	sets.engaged.Conqueror.FullAcc.PDT.Adoulin = {}
	sets.engaged.Conqueror.Fodder.PDT.Adoulin = {}
	
	sets.engaged.Conqueror.PDT.AM = {}
	sets.engaged.Conqueror.SomeAcc.PDT.AM = {}
	sets.engaged.Conqueror.Acc.PDT.AM = {}
	sets.engaged.Conqueror.FullAcc.PDT.AM = {}
	sets.engaged.Conqueror.Fodder.PDT.AM = {}
	
	sets.engaged.Conqueror.PDT.Adoulin.AM = {}
	sets.engaged.Conqueror.SomeAcc.PDT.Adoulin.AM = {}
	sets.engaged.Conqueror.Acc.PDT.Adoulin.AM = {}
	sets.engaged.Conqueror.FullAcc.PDT.Adoulin.AM = {}
	sets.engaged.Conqueror.Fodder.PDT.Adoulin.AM = {}
	
	sets.engaged.Conqueror.PDT.Charge = {}
	sets.engaged.Conqueror.SomeAcc.PDT.Charge = {}
	sets.engaged.Conqueror.Acc.PDT.Charge = {}
	sets.engaged.Conqueror.FullAcc.PDT.Charge = {}
	sets.engaged.Conqueror.Fodder.PDT.Charge = {}
	
	sets.engaged.Conqueror.PDT.Adoulin.Charge = {}
	sets.engaged.Conqueror.SomeAcc.PDT.Adoulin.Charge = {}
	sets.engaged.Conqueror.Acc.PDT.Adoulin.Charge = {}
	sets.engaged.Conqueror.FullAcc.PDT.Adoulin.Charge = {}
	sets.engaged.Conqueror.Fodder.PDT.Adoulin.Charge = {}
	
	sets.engaged.Conqueror.PDT.Charge.AM = {}
	sets.engaged.Conqueror.SomeAcc.PDT.Charge.AM = {}
	sets.engaged.Conqueror.Acc.PDT.Charge.AM = {}
	sets.engaged.Conqueror.FullAcc.PDT.Charge.AM = {}
	sets.engaged.Conqueror.Fodder.PDT.Charge.AM = {}
	
	sets.engaged.Conqueror.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Conqueror.SomeAcc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Conqueror.Acc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Conqueror.FullAcc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Conqueror.Fodder.PDT.Adoulin.Charge.AM = {}

	sets.engaged.Conqueror.MDT = {}
	sets.engaged.Conqueror.SomeAcc.MDT = {}
	sets.engaged.Conqueror.Acc.MDT = {}
	sets.engaged.Conqueror.FullAcc.MDT = {}
	sets.engaged.Conqueror.Fodder.MDT = {}
	
	sets.engaged.Conqueror.MDT.Adoulin = {}
	sets.engaged.Conqueror.SomeAcc.MDT.Adoulin = {}
	sets.engaged.Conqueror.Acc.MDT.Adoulin = {}
	sets.engaged.Conqueror.FullAcc.MDT.Adoulin = {}
	sets.engaged.Conqueror.Fodder.MDT.Adoulin = {}
	
	sets.engaged.Conqueror.MDT.AM = {}
	sets.engaged.Conqueror.SomeAcc.MDT.AM = {}
	sets.engaged.Conqueror.Acc.MDT.AM = {}
	sets.engaged.Conqueror.FullAcc.MDT.AM = {}
	sets.engaged.Conqueror.Fodder.MDT.AM = {}
	
	sets.engaged.Conqueror.MDT.Adoulin.AM = {}
	sets.engaged.Conqueror.SomeAcc.MDT.Adoulin.AM = {}
	sets.engaged.Conqueror.Acc.MDT.Adoulin.AM = {}
	sets.engaged.Conqueror.FullAcc.MDT.Adoulin.AM = {}
	sets.engaged.Conqueror.Fodder.MDT.Adoulin.AM = {}
	
	sets.engaged.Conqueror.MDT.Charge = {}
	sets.engaged.Conqueror.SomeAcc.MDT.Charge = {}
	sets.engaged.Conqueror.Acc.MDT.Charge = {}
	sets.engaged.Conqueror.FullAcc.MDT.Charge = {}
	sets.engaged.Conqueror.Fodder.MDT.Charge = {}
	
	sets.engaged.Conqueror.MDT.Adoulin.Charge = {}
	sets.engaged.Conqueror.SomeAcc.MDT.Adoulin.Charge = {}
	sets.engaged.Conqueror.Acc.MDT.Adoulin.Charge = {}
	sets.engaged.Conqueror.FullAcc.MDT.Adoulin.Charge = {}
	sets.engaged.Conqueror.Fodder.MDT.Adoulin.Charge = {}
	
	sets.engaged.Conqueror.MDT.Charge.AM = {}
	sets.engaged.Conqueror.SomeAcc.MDT.Charge.AM = {}
	sets.engaged.Conqueror.Acc.MDT.Charge.AM = {}
	sets.engaged.Conqueror.FullAcc.MDT.Charge.AM = {}
	sets.engaged.Conqueror.Fodder.MDT.Charge.AM = {}
	
	sets.engaged.Conqueror.MDT.Adoulin.Charge.AM = {}
	sets.engaged.Conqueror.SomeAcc.MDT.Adoulin.Charge.AM = {}
	sets.engaged.Conqueror.Acc.MDT.Adoulin.Charge.AM = {}
	sets.engaged.Conqueror.FullAcc.MDT.Adoulin.Charge.AM = {}
	sets.engaged.Conqueror.Fodder.MDT.Adoulin.Charge.AM = {}
	
    sets.engaged.Conqueror.Mighty = {}
	sets.engaged.Conqueror.SomeAcc.Mighty = {}
	sets.engaged.Conqueror.Acc.Mighty = {}
	sets.engaged.Conqueror.FullAcc.Mighty = {}
	sets.engaged.Conqueror.Fodder.Mighty = {}
	
    sets.engaged.Conqueror.Adoulin.Mighty = {}
	sets.engaged.Conqueror.SomeAcc.Adoulin.Mighty = {}
	sets.engaged.Conqueror.Acc.Adoulin.Mighty = {}
	sets.engaged.Conqueror.FullAcc.Adoulin.Mighty = {}
	sets.engaged.Conqueror.Fodder.Adoulin.Mighty = {}
	
    sets.engaged.Conqueror.Mighty.AM = {}
	sets.engaged.Conqueror.SomeAcc.Mighty.AM = {}
	sets.engaged.Conqueror.Acc.Mighty.AM = {}
	sets.engaged.Conqueror.FullAcc.Mighty.AM = {}
	sets.engaged.Conqueror.Fodder.Mighty.AM = {}
	
    sets.engaged.Conqueror.Adoulin.Mighty.AM = {}
	sets.engaged.Conqueror.SomeAcc.Adoulin.Mighty.AM = {}
	sets.engaged.Conqueror.Acc.Adoulin.Mighty.AM = {}
	sets.engaged.Conqueror.FullAcc.Adoulin.Mighty.AM = {}
	sets.engaged.Conqueror.Fodder.Adoulin.Mighty.AM = {}

    sets.engaged.Conqueror.Charge.Mighty = {}
	sets.engaged.Conqueror.SomeAcc.Charge.Mighty = {}
	sets.engaged.Conqueror.Acc.Charge.Mighty = {}
	sets.engaged.Conqueror.FullAcc.Charge.Mighty = {}
	sets.engaged.Conqueror.Fodder.Charge.Mighty = {}
	
    sets.engaged.Conqueror.Adoulin.Charge.Mighty = {}
	sets.engaged.Conqueror.SomeAcc.Adoulin.Charge.Mighty = {}
	sets.engaged.Conqueror.Acc.Adoulin.Charge.Mighty = {}
	sets.engaged.Conqueror.FullAcc.Adoulin.Charge.Mighty = {}
	sets.engaged.Conqueror.Fodder.Adoulin.Charge.Mighty = {}
	
    sets.engaged.Conqueror.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.SomeAcc.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.Acc.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.FullAcc.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.Fodder.Charge.Mighty.AM = {}
	
    sets.engaged.Conqueror.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.SomeAcc.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.Acc.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.FullAcc.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.Fodder.Adoulin.Charge.Mighty.AM = {}

	sets.engaged.Conqueror.PDT.Mighty = {}
	sets.engaged.Conqueror.SomeAcc.PDT.Mighty = {}
	sets.engaged.Conqueror.Acc.PDT.Mighty = {}
	sets.engaged.Conqueror.FullAcc.PDT.Mighty = {}
	sets.engaged.Conqueror.Fodder.PDT.Mighty = {}
	
	sets.engaged.Conqueror.PDT.Adoulin.Mighty = {}
	sets.engaged.Conqueror.SomeAcc.PDT.Adoulin.Mighty = {}
	sets.engaged.Conqueror.Acc.PDT.Adoulin.Mighty = {}
	sets.engaged.Conqueror.FullAcc.PDT.Adoulin.Mighty = {}
	sets.engaged.Conqueror.Fodder.PDT.Adoulin.Mighty = {}
	
	sets.engaged.Conqueror.PDT.Mighty.AM = {}
	sets.engaged.Conqueror.SomeAcc.PDT.Mighty.AM = {}
	sets.engaged.Conqueror.Acc.PDT.Mighty.AM = {}
	sets.engaged.Conqueror.FullAcc.PDT.Mighty.AM = {}
	sets.engaged.Conqueror.Fodder.PDT.Mighty.AM = {}
	
	sets.engaged.Conqueror.PDT.Adoulin.Mighty.AM = {}
	sets.engaged.Conqueror.SomeAcc.PDT.Adoulin.Mighty.AM = {}
	sets.engaged.Conqueror.Acc.PDT.Adoulin.Mighty.AM = {}
	sets.engaged.Conqueror.FullAcc.PDT.Adoulin.Mighty.AM = {}
	sets.engaged.Conqueror.Fodder.PDT.Adoulin.Mighty.AM = {}
	
	sets.engaged.Conqueror.PDT.Charge.Mighty = {}
	sets.engaged.Conqueror.SomeAcc.PDT.Charge.Mighty = {}
	sets.engaged.Conqueror.Acc.PDT.Charge.Mighty = {}
	sets.engaged.Conqueror.FullAcc.PDT.Charge.Mighty = {}
	sets.engaged.Conqueror.Fodder.PDT.Charge.Mighty = {}
	
	sets.engaged.Conqueror.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Conqueror.SomeAcc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Conqueror.Acc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Conqueror.FullAcc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Conqueror.Fodder.PDT.Adoulin.Charge.Mighty = {}
	
	sets.engaged.Conqueror.PDT.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.SomeAcc.PDT.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.Acc.PDT.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.FullAcc.PDT.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.Fodder.PDT.Charge.Mighty.AM = {}
	
	sets.engaged.Conqueror.PDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.SomeAcc.PDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.Acc.PDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.FullAcc.PDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.Fodder.PDT.Adoulin.Charge.Mighty.AM = {}

	sets.engaged.Conqueror.MDT.Mighty = {}
	sets.engaged.Conqueror.SomeAcc.MDT.Mighty = {}
	sets.engaged.Conqueror.Acc.MDT.Mighty = {}
	sets.engaged.Conqueror.FullAcc.MDT.Mighty = {}
	sets.engaged.Conqueror.Fodder.MDT.Mighty = {}
	
	sets.engaged.Conqueror.MDT.Adoulin.Mighty = {}
	sets.engaged.Conqueror.SomeAcc.MDT.Adoulin.Mighty = {}
	sets.engaged.Conqueror.Acc.MDT.Adoulin.Mighty = {}
	sets.engaged.Conqueror.FullAcc.MDT.Adoulin.Mighty = {}
	sets.engaged.Conqueror.Fodder.MDT.Adoulin.Mighty = {}
	
	sets.engaged.Conqueror.MDT.Mighty.AM = {}
	sets.engaged.Conqueror.SomeAcc.MDT.Mighty.AM = {}
	sets.engaged.Conqueror.Acc.MDT.Mighty.AM = {}
	sets.engaged.Conqueror.FullAcc.MDT.Mighty.AM = {}
	sets.engaged.Conqueror.Fodder.MDT.Mighty.AM = {}
	
	sets.engaged.Conqueror.MDT.Adoulin.Mighty.AM = {}
	sets.engaged.Conqueror.SomeAcc.MDT.Adoulin.Mighty.AM = {}
	sets.engaged.Conqueror.Acc.MDT.Adoulin.Mighty.AM = {}
	sets.engaged.Conqueror.FullAcc.MDT.Adoulin.Mighty.AM = {}
	sets.engaged.Conqueror.Fodder.MDT.Adoulin.Mighty.AM = {}
	
	sets.engaged.Conqueror.MDT.Charge.Mighty = {}
	sets.engaged.Conqueror.SomeAcc.MDT.Charge.Mighty = {}
	sets.engaged.Conqueror.Acc.MDT.Charge.Mighty = {}
	sets.engaged.Conqueror.FullAcc.MDT.Charge.Mighty = {}
	sets.engaged.Conqueror.Fodder.MDT.Charge.Mighty = {}
	
	sets.engaged.Conqueror.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Conqueror.SomeAcc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Conqueror.Acc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Conqueror.FullAcc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Conqueror.Fodder.MDT.Adoulin.Charge.Mighty = {}
	
	sets.engaged.Conqueror.MDT.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.SomeAcc.MDT.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.Acc.MDT.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.FullAcc.MDT.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.Fodder.MDT.Charge.Mighty.AM = {}
	
	sets.engaged.Conqueror.MDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.SomeAcc.MDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.Acc.MDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.FullAcc.MDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.Fodder.MDT.Adoulin.Charge.Mighty.AM = {}
	
-- Bravura melee sets
    sets.engaged.Bravura = {}
	sets.engaged.Bravura.SomeAcc = {}
	sets.engaged.Bravura.Acc = {}
	sets.engaged.Bravura.FullAcc = {}
	sets.engaged.Bravura.Fodder = {}
	
    sets.engaged.Bravura.Adoulin = {}
	sets.engaged.Bravura.SomeAcc.Adoulin = {}
	sets.engaged.Bravura.Acc.Adoulin = {}
	sets.engaged.Bravura.FullAcc.Adoulin = {}
	sets.engaged.Bravura.Fodder.Adoulin = {}
	
    sets.engaged.Bravura.AM = {}
	sets.engaged.Bravura.SomeAcc.AM = {}
	sets.engaged.Bravura.Acc.AM = {}
	sets.engaged.Bravura.FullAcc.AM = {}
	sets.engaged.Bravura.Fodder.AM = {}
	
    sets.engaged.Bravura.Adoulin.AM = {}
	sets.engaged.Bravura.SomeAcc.Adoulin.AM = {}
	sets.engaged.Bravura.Acc.Adoulin.AM = {}
	sets.engaged.Bravura.FullAcc.Adoulin.AM = {}
	sets.engaged.Bravura.Fodder.Adoulin.AM = {}

    sets.engaged.Bravura.Charge = {}
	sets.engaged.Bravura.SomeAcc.Charge = {}
	sets.engaged.Bravura.Acc.Charge = {}
	sets.engaged.Bravura.FullAcc.Charge = {}
	sets.engaged.Bravura.Fodder.Charge = {}
	
    sets.engaged.Bravura.Adoulin.Charge = {}
	sets.engaged.Bravura.SomeAcc.Adoulin.Charge = {}
	sets.engaged.Bravura.Acc.Adoulin.Charge = {}
	sets.engaged.Bravura.FullAcc.Adoulin.Charge = {}
	sets.engaged.Bravura.Fodder.Adoulin.Charge = {}
	
    sets.engaged.Bravura.Charge.AM = {}
	sets.engaged.Bravura.SomeAcc.Charge.AM = {}
	sets.engaged.Bravura.Acc.Charge.AM = {}
	sets.engaged.Bravura.FullAcc.Charge.AM = {}
	sets.engaged.Bravura.Fodder.Charge.AM = {}
	
    sets.engaged.Bravura.Adoulin.Charge.AM = {}
	sets.engaged.Bravura.SomeAcc.Adoulin.Charge.AM = {}
	sets.engaged.Bravura.Acc.Adoulin.Charge.AM = {}
	sets.engaged.Bravura.FullAcc.Adoulin.Charge.AM = {}
	sets.engaged.Bravura.Fodder.Adoulin.Charge.AM = {}

	sets.engaged.Bravura.PDT = {}
	sets.engaged.Bravura.SomeAcc.PDT = {}
	sets.engaged.Bravura.Acc.PDT = {}
	sets.engaged.Bravura.FullAcc.PDT = {}
	sets.engaged.Bravura.Fodder.PDT = {}
	
	sets.engaged.Bravura.PDT.Adoulin = {}
	sets.engaged.Bravura.SomeAcc.PDT.Adoulin = {}
	sets.engaged.Bravura.Acc.PDT.Adoulin = {}
	sets.engaged.Bravura.FullAcc.PDT.Adoulin = {}
	sets.engaged.Bravura.Fodder.PDT.Adoulin = {}
	
	sets.engaged.Bravura.PDT.AM = {}
	sets.engaged.Bravura.SomeAcc.PDT.AM = {}
	sets.engaged.Bravura.Acc.PDT.AM = {}
	sets.engaged.Bravura.FullAcc.PDT.AM = {}
	sets.engaged.Bravura.Fodder.PDT.AM = {}
	
	sets.engaged.Bravura.PDT.Adoulin.AM = {}
	sets.engaged.Bravura.SomeAcc.PDT.Adoulin.AM = {}
	sets.engaged.Bravura.Acc.PDT.Adoulin.AM = {}
	sets.engaged.Bravura.FullAcc.PDT.Adoulin.AM = {}
	sets.engaged.Bravura.Fodder.PDT.Adoulin.AM = {}
	
	sets.engaged.Bravura.PDT.Charge = {}
	sets.engaged.Bravura.SomeAcc.PDT.Charge = {}
	sets.engaged.Bravura.Acc.PDT.Charge = {}
	sets.engaged.Bravura.FullAcc.PDT.Charge = {}
	sets.engaged.Bravura.Fodder.PDT.Charge = {}
	
	sets.engaged.Bravura.PDT.Adoulin.Charge = {}
	sets.engaged.Bravura.SomeAcc.PDT.Adoulin.Charge = {}
	sets.engaged.Bravura.Acc.PDT.Adoulin.Charge = {}
	sets.engaged.Bravura.FullAcc.PDT.Adoulin.Charge = {}
	sets.engaged.Bravura.Fodder.PDT.Adoulin.Charge = {}
	
	sets.engaged.Bravura.PDT.Charge.AM = {}
	sets.engaged.Bravura.SomeAcc.PDT.Charge.AM = {}
	sets.engaged.Bravura.Acc.PDT.Charge.AM = {}
	sets.engaged.Bravura.FullAcc.PDT.Charge.AM = {}
	sets.engaged.Bravura.Fodder.PDT.Charge.AM = {}
	
	sets.engaged.Bravura.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Bravura.SomeAcc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Bravura.Acc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Bravura.FullAcc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Bravura.Fodder.PDT.Adoulin.Charge.AM = {}

	sets.engaged.Bravura.MDT = {}
	sets.engaged.Bravura.SomeAcc.MDT = {}
	sets.engaged.Bravura.Acc.MDT = {}
	sets.engaged.Bravura.FullAcc.MDT = {}
	sets.engaged.Bravura.Fodder.MDT = {}
	
	sets.engaged.Bravura.MDT.Adoulin = {}
	sets.engaged.Bravura.SomeAcc.MDT.Adoulin = {}
	sets.engaged.Bravura.Acc.MDT.Adoulin = {}
	sets.engaged.Bravura.FullAcc.MDT.Adoulin = {}
	sets.engaged.Bravura.Fodder.MDT.Adoulin = {}
	
	sets.engaged.Bravura.MDT.AM = {}
	sets.engaged.Bravura.SomeAcc.MDT.AM = {}
	sets.engaged.Bravura.Acc.MDT.AM = {}
	sets.engaged.Bravura.FullAcc.MDT.AM = {}
	sets.engaged.Bravura.Fodder.MDT.AM = {}
	
	sets.engaged.Bravura.MDT.Adoulin.AM = {}
	sets.engaged.Bravura.SomeAcc.MDT.Adoulin.AM = {}
	sets.engaged.Bravura.Acc.MDT.Adoulin.AM = {}
	sets.engaged.Bravura.FullAcc.MDT.Adoulin.AM = {}
	sets.engaged.Bravura.Fodder.MDT.Adoulin.AM = {}
	
	sets.engaged.Bravura.MDT.Charge = {}
	sets.engaged.Bravura.SomeAcc.MDT.Charge = {}
	sets.engaged.Bravura.Acc.MDT.Charge = {}
	sets.engaged.Bravura.FullAcc.MDT.Charge = {}
	sets.engaged.Bravura.Fodder.MDT.Charge = {}
	
	sets.engaged.Bravura.MDT.Adoulin.Charge = {}
	sets.engaged.Bravura.SomeAcc.MDT.Adoulin.Charge = {}
	sets.engaged.Bravura.Acc.MDT.Adoulin.Charge = {}
	sets.engaged.Bravura.FullAcc.MDT.Adoulin.Charge = {}
	sets.engaged.Bravura.Fodder.MDT.Adoulin.Charge = {}
	
	sets.engaged.Bravura.MDT.Charge.AM = {}
	sets.engaged.Bravura.SomeAcc.MDT.Charge.AM = {}
	sets.engaged.Bravura.Acc.MDT.Charge.AM = {}
	sets.engaged.Bravura.FullAcc.MDT.Charge.AM = {}
	sets.engaged.Bravura.Fodder.MDT.Charge.AM = {}
	
	sets.engaged.Bravura.MDT.Adoulin.Charge.AM = {}
	sets.engaged.Bravura.SomeAcc.MDT.Adoulin.Charge.AM = {}
	sets.engaged.Bravura.Acc.MDT.Adoulin.Charge.AM = {}
	sets.engaged.Bravura.FullAcc.MDT.Adoulin.Charge.AM = {}
	sets.engaged.Bravura.Fodder.MDT.Adoulin.Charge.AM = {}
	
    sets.engaged.Bravura.Mighty = {}
	sets.engaged.Bravura.SomeAcc.Mighty = {}
	sets.engaged.Bravura.Acc.Mighty = {}
	sets.engaged.Bravura.FullAcc.Mighty = {}
	sets.engaged.Bravura.Fodder.Mighty = {}
	
    sets.engaged.Bravura.Adoulin.Mighty = {}
	sets.engaged.Bravura.SomeAcc.Adoulin.Mighty = {}
	sets.engaged.Bravura.Acc.Adoulin.Mighty = {}
	sets.engaged.Bravura.FullAcc.Adoulin.Mighty = {}
	sets.engaged.Bravura.Fodder.Adoulin.Mighty = {}
	
    sets.engaged.Bravura.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.Mighty.AM = {}
	sets.engaged.Bravura.Acc.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.Mighty.AM = {}
	
    sets.engaged.Bravura.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.Acc.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.Adoulin.Mighty.AM = {}

    sets.engaged.Bravura.Charge.Mighty = {}
	sets.engaged.Bravura.SomeAcc.Charge.Mighty = {}
	sets.engaged.Bravura.Acc.Charge.Mighty = {}
	sets.engaged.Bravura.FullAcc.Charge.Mighty = {}
	sets.engaged.Bravura.Fodder.Charge.Mighty = {}
	
    sets.engaged.Bravura.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.SomeAcc.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.Acc.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.FullAcc.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.Fodder.Adoulin.Charge.Mighty = {}
	
    sets.engaged.Bravura.Charge.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Acc.Charge.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.Charge.Mighty.AM = {}
	
    sets.engaged.Bravura.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Acc.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.Adoulin.Charge.Mighty.AM = {}

	sets.engaged.Bravura.PDT.Mighty = {}
	sets.engaged.Bravura.SomeAcc.PDT.Mighty = {}
	sets.engaged.Bravura.Acc.PDT.Mighty = {}
	sets.engaged.Bravura.FullAcc.PDT.Mighty = {}
	sets.engaged.Bravura.Fodder.PDT.Mighty = {}
	
	sets.engaged.Bravura.PDT.Adoulin.Mighty = {}
	sets.engaged.Bravura.SomeAcc.PDT.Adoulin.Mighty = {}
	sets.engaged.Bravura.Acc.PDT.Adoulin.Mighty = {}
	sets.engaged.Bravura.FullAcc.PDT.Adoulin.Mighty = {}
	sets.engaged.Bravura.Fodder.PDT.Adoulin.Mighty = {}
	
	sets.engaged.Bravura.PDT.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.PDT.Mighty.AM = {}
	sets.engaged.Bravura.Acc.PDT.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.PDT.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.PDT.Mighty.AM = {}
	
	sets.engaged.Bravura.PDT.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.PDT.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.Acc.PDT.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.PDT.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.PDT.Adoulin.Mighty.AM = {}
	
	sets.engaged.Bravura.PDT.Charge.Mighty = {}
	sets.engaged.Bravura.SomeAcc.PDT.Charge.Mighty = {}
	sets.engaged.Bravura.Acc.PDT.Charge.Mighty = {}
	sets.engaged.Bravura.FullAcc.PDT.Charge.Mighty = {}
	sets.engaged.Bravura.Fodder.PDT.Charge.Mighty = {}
	
	sets.engaged.Bravura.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.SomeAcc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.Acc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.FullAcc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.Fodder.PDT.Adoulin.Charge.Mighty = {}
	
	sets.engaged.Bravura.PDT.Charge.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.PDT.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Acc.PDT.Charge.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.PDT.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.PDT.Charge.Mighty.AM = {}
	
	sets.engaged.Bravura.PDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.PDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Acc.PDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.PDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.PDT.Adoulin.Charge.Mighty.AM = {}

	sets.engaged.Bravura.MDT.Mighty = {}
	sets.engaged.Bravura.SomeAcc.MDT.Mighty = {}
	sets.engaged.Bravura.Acc.MDT.Mighty = {}
	sets.engaged.Bravura.FullAcc.MDT.Mighty = {}
	sets.engaged.Bravura.Fodder.MDT.Mighty = {}
	
	sets.engaged.Bravura.MDT.Adoulin.Mighty = {}
	sets.engaged.Bravura.SomeAcc.MDT.Adoulin.Mighty = {}
	sets.engaged.Bravura.Acc.MDT.Adoulin.Mighty = {}
	sets.engaged.Bravura.FullAcc.MDT.Adoulin.Mighty = {}
	sets.engaged.Bravura.Fodder.MDT.Adoulin.Mighty = {}
	
	sets.engaged.Bravura.MDT.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.MDT.Mighty.AM = {}
	sets.engaged.Bravura.Acc.MDT.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.MDT.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.MDT.Mighty.AM = {}
	
	sets.engaged.Bravura.MDT.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.MDT.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.Acc.MDT.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.MDT.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.MDT.Adoulin.Mighty.AM = {}
	
	sets.engaged.Bravura.MDT.Charge.Mighty = {}
	sets.engaged.Bravura.SomeAcc.MDT.Charge.Mighty = {}
	sets.engaged.Bravura.Acc.MDT.Charge.Mighty = {}
	sets.engaged.Bravura.FullAcc.MDT.Charge.Mighty = {}
	sets.engaged.Bravura.Fodder.MDT.Charge.Mighty = {}
	
	sets.engaged.Bravura.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.SomeAcc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.Acc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.FullAcc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.Fodder.MDT.Adoulin.Charge.Mighty = {}
	
	sets.engaged.Bravura.MDT.Charge.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.MDT.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Acc.MDT.Charge.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.MDT.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.MDT.Charge.Mighty.AM = {}
	
	sets.engaged.Bravura.MDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.MDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Acc.MDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.MDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.MDT.Adoulin.Charge.Mighty.AM = {}
	
-- Ragnarok melee sets
    sets.engaged.Ragnarok = {}
	sets.engaged.Ragnarok.SomeAcc = {}
	sets.engaged.Ragnarok.Acc = {}
	sets.engaged.Ragnarok.FullAcc = {}
	sets.engaged.Ragnarok.Fodder = {}
	
    sets.engaged.Ragnarok.Adoulin = {}
	sets.engaged.Ragnarok.SomeAcc.Adoulin = {}
	sets.engaged.Ragnarok.Acc.Adoulin = {}
	sets.engaged.Ragnarok.FullAcc.Adoulin = {}
	sets.engaged.Ragnarok.Fodder.Adoulin = {}
	
    sets.engaged.Ragnarok.AM = {}
	sets.engaged.Ragnarok.SomeAcc.AM = {}
	sets.engaged.Ragnarok.Acc.AM = {}
	sets.engaged.Ragnarok.FullAcc.AM = {}
	sets.engaged.Ragnarok.Fodder.AM = {}
	
    sets.engaged.Ragnarok.Adoulin.AM = {}
	sets.engaged.Ragnarok.SomeAcc.Adoulin.AM = {}
	sets.engaged.Ragnarok.Acc.Adoulin.AM = {}
	sets.engaged.Ragnarok.FullAcc.Adoulin.AM = {}
	sets.engaged.Ragnarok.Fodder.Adoulin.AM = {}

    sets.engaged.Ragnarok.Charge = {}
	sets.engaged.Ragnarok.SomeAcc.Charge = {}
	sets.engaged.Ragnarok.Acc.Charge = {}
	sets.engaged.Ragnarok.FullAcc.Charge = {}
	sets.engaged.Ragnarok.Fodder.Charge = {}
	
    sets.engaged.Ragnarok.Adoulin.Charge = {}
	sets.engaged.Ragnarok.SomeAcc.Adoulin.Charge = {}
	sets.engaged.Ragnarok.Acc.Adoulin.Charge = {}
	sets.engaged.Ragnarok.FullAcc.Adoulin.Charge = {}
	sets.engaged.Ragnarok.Fodder.Adoulin.Charge = {}
	
    sets.engaged.Ragnarok.Charge.AM = {}
	sets.engaged.Ragnarok.SomeAcc.Charge.AM = {}
	sets.engaged.Ragnarok.Acc.Charge.AM = {}
	sets.engaged.Ragnarok.FullAcc.Charge.AM = {}
	sets.engaged.Ragnarok.Fodder.Charge.AM = {}
	
    sets.engaged.Ragnarok.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.SomeAcc.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.Acc.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.FullAcc.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.Fodder.Adoulin.Charge.AM = {}

	sets.engaged.Ragnarok.PDT = {}
	sets.engaged.Ragnarok.SomeAcc.PDT = {}
	sets.engaged.Ragnarok.Acc.PDT = {}
	sets.engaged.Ragnarok.FullAcc.PDT = {}
	sets.engaged.Ragnarok.Fodder.PDT = {}
	
	sets.engaged.Ragnarok.PDT.Adoulin = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Adoulin = {}
	sets.engaged.Ragnarok.Acc.PDT.Adoulin = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Adoulin = {}
	sets.engaged.Ragnarok.Fodder.PDT.Adoulin = {}
	
	sets.engaged.Ragnarok.PDT.AM = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.AM = {}
	sets.engaged.Ragnarok.Acc.PDT.AM = {}
	sets.engaged.Ragnarok.FullAcc.PDT.AM = {}
	sets.engaged.Ragnarok.Fodder.PDT.AM = {}
	
	sets.engaged.Ragnarok.PDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.Acc.PDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.Fodder.PDT.Adoulin.AM = {}
	
	sets.engaged.Ragnarok.PDT.Charge = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Charge = {}
	sets.engaged.Ragnarok.Acc.PDT.Charge = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Charge = {}
	sets.engaged.Ragnarok.Fodder.PDT.Charge = {}
	
	sets.engaged.Ragnarok.PDT.Adoulin.Charge = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Adoulin.Charge = {}
	sets.engaged.Ragnarok.Acc.PDT.Adoulin.Charge = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Adoulin.Charge = {}
	sets.engaged.Ragnarok.Fodder.PDT.Adoulin.Charge = {}
	
	sets.engaged.Ragnarok.PDT.Charge.AM = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Charge.AM = {}
	sets.engaged.Ragnarok.Acc.PDT.Charge.AM = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Charge.AM = {}
	sets.engaged.Ragnarok.Fodder.PDT.Charge.AM = {}
	
	sets.engaged.Ragnarok.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.Acc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.Fodder.PDT.Adoulin.Charge.AM = {}

	sets.engaged.Ragnarok.MDT = {}
	sets.engaged.Ragnarok.SomeAcc.MDT = {}
	sets.engaged.Ragnarok.Acc.MDT = {}
	sets.engaged.Ragnarok.FullAcc.MDT = {}
	sets.engaged.Ragnarok.Fodder.MDT = {}
	
	sets.engaged.Ragnarok.MDT.Adoulin = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Adoulin = {}
	sets.engaged.Ragnarok.Acc.MDT.Adoulin = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Adoulin = {}
	sets.engaged.Ragnarok.Fodder.MDT.Adoulin = {}
	
	sets.engaged.Ragnarok.MDT.AM = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.AM = {}
	sets.engaged.Ragnarok.Acc.MDT.AM = {}
	sets.engaged.Ragnarok.FullAcc.MDT.AM = {}
	sets.engaged.Ragnarok.Fodder.MDT.AM = {}
	
	sets.engaged.Ragnarok.MDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.Acc.MDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.Fodder.MDT.Adoulin.AM = {}
	
	sets.engaged.Ragnarok.MDT.Charge = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Charge = {}
	sets.engaged.Ragnarok.Acc.MDT.Charge = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Charge = {}
	sets.engaged.Ragnarok.Fodder.MDT.Charge = {}
	
	sets.engaged.Ragnarok.MDT.Adoulin.Charge = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Adoulin.Charge = {}
	sets.engaged.Ragnarok.Acc.MDT.Adoulin.Charge = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Adoulin.Charge = {}
	sets.engaged.Ragnarok.Fodder.MDT.Adoulin.Charge = {}
	
	sets.engaged.Ragnarok.MDT.Charge.AM = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Charge.AM = {}
	sets.engaged.Ragnarok.Acc.MDT.Charge.AM = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Charge.AM = {}
	sets.engaged.Ragnarok.Fodder.MDT.Charge.AM = {}
	
	sets.engaged.Ragnarok.MDT.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.Acc.MDT.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.Fodder.MDT.Adoulin.Charge.AM = {}
	
    sets.engaged.Ragnarok.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.Mighty = {}
	sets.engaged.Ragnarok.Acc.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.Mighty = {}
	sets.engaged.Ragnarok.Fodder.Mighty = {}
	
    sets.engaged.Ragnarok.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.Acc.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.Fodder.Adoulin.Mighty = {}
	
    sets.engaged.Ragnarok.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.Mighty.AM = {}
	
    sets.engaged.Ragnarok.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.Adoulin.Mighty.AM = {}

    sets.engaged.Ragnarok.Charge.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.Charge.Mighty = {}
	sets.engaged.Ragnarok.Acc.Charge.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.Charge.Mighty = {}
	sets.engaged.Ragnarok.Fodder.Charge.Mighty = {}
	
    sets.engaged.Ragnarok.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.Acc.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.Fodder.Adoulin.Charge.Mighty = {}
	
    sets.engaged.Ragnarok.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.Charge.Mighty.AM = {}
	
    sets.engaged.Ragnarok.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.Adoulin.Charge.Mighty.AM = {}

	sets.engaged.Ragnarok.PDT.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Mighty = {}
	sets.engaged.Ragnarok.Acc.PDT.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Mighty = {}
	sets.engaged.Ragnarok.Fodder.PDT.Mighty = {}
	
	sets.engaged.Ragnarok.PDT.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.Acc.PDT.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.Fodder.PDT.Adoulin.Mighty = {}
	
	sets.engaged.Ragnarok.PDT.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.PDT.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.PDT.Mighty.AM = {}
	
	sets.engaged.Ragnarok.PDT.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.PDT.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.PDT.Adoulin.Mighty.AM = {}
	
	sets.engaged.Ragnarok.PDT.Charge.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Charge.Mighty = {}
	sets.engaged.Ragnarok.Acc.PDT.Charge.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Charge.Mighty = {}
	sets.engaged.Ragnarok.Fodder.PDT.Charge.Mighty = {}
	
	sets.engaged.Ragnarok.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.Acc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.Fodder.PDT.Adoulin.Charge.Mighty = {}
	
	sets.engaged.Ragnarok.PDT.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.PDT.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.PDT.Charge.Mighty.AM = {}
	
	sets.engaged.Ragnarok.PDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.PDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.PDT.Adoulin.Charge.Mighty.AM = {}

	sets.engaged.Ragnarok.MDT.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Mighty = {}
	sets.engaged.Ragnarok.Acc.MDT.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Mighty = {}
	sets.engaged.Ragnarok.Fodder.MDT.Mighty = {}
	
	sets.engaged.Ragnarok.MDT.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.Acc.MDT.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.Fodder.MDT.Adoulin.Mighty = {}
	
	sets.engaged.Ragnarok.MDT.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.MDT.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.MDT.Mighty.AM = {}
	
	sets.engaged.Ragnarok.MDT.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.MDT.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.MDT.Adoulin.Mighty.AM = {}
	
	sets.engaged.Ragnarok.MDT.Charge.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Charge.Mighty = {}
	sets.engaged.Ragnarok.Acc.MDT.Charge.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Charge.Mighty = {}
	sets.engaged.Ragnarok.Fodder.MDT.Charge.Mighty = {}
	
	sets.engaged.Ragnarok.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.Acc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.Fodder.MDT.Adoulin.Charge.Mighty = {}
	
	sets.engaged.Ragnarok.MDT.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.MDT.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.MDT.Charge.Mighty.AM = {}
	
	sets.engaged.Ragnarok.MDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.MDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.MDT.Adoulin.Charge.Mighty.AM = {}
	
]]--