function user_job_setup()

	-- Options: Override default values
    state.OffenseMode:options('Normal')
	state.CastingMode:options('Normal', 'Resistant', 'Fodder', 'Proc')
    state.IdleMode:options('Normal','PDT')
	state.PhysicalDefenseMode:options('PDT', 'NukeLock', 'GeoLock', 'PetPDT')
	state.MagicalDefenseMode:options('MDT', 'NukeLock')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Maxentius','DualWeapons')

	gear.nuke_jse_back = "Toro Cape"
	gear.idle_jse_back = "Nantosuelta's Cape"
	
	gear.obi_cure_back = "Tempered Cape"
	gear.obi_cure_waist = "Witful Belt"

	gear.obi_low_nuke_back = gear.nuke_jse_back
	gear.obi_low_nuke_waist = "Sekhmet Corset"

	gear.obi_high_nuke_back = gear.nuke_jse_back
	gear.obi_high_nuke_waist = "Refoccilation Stone"
	
	autoindi = "Haste"
	autogeo = "Frailty"
	
	-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` input /ja "Full Circle" <me>')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind ^backspace input /ja "Entrust" <me>')
	send_command('bind !backspace input /ja "Life Cycle" <me>')
	send_command('bind @backspace input /ma "Sleep II" <t>')
	send_command('bind ^delete input /ma "Aspir III" <t>')
	send_command('bind @delete input /ma "Sleep" <t>')
	
	indi_duration = 290
	
	select_default_macro_book()
end

function init_gear_sets()
	
	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
	sets.precast.JA.Bolster = {body="Bagua Tunic +1"}
	sets.precast.JA['Life Cycle'] = {body="Geo. Tunic +1",back=gear.idle_jse_back}
	sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals +2"}
	sets.precast.JA['Mending Halation'] = {legs="Bagua Pants +1"}
	sets.precast.JA['Full Circle'] = {head="Azimuth Hood +2",hands="Bagua Mitaines"}
	
	-- Indi Duration in slots that would normally have skill here to make entrust more efficient.
	sets.buff.Entrust = {}
	
	-- Relic hat for Blaze of Glory HP increase.
	sets.buff['Blaze of Glory'] = {}
	
	-- Fast cast sets for spells

	sets.precast.FC = {main="Solstice",sub="Culminus",ammo="Impatiens",
		head="Amalric Coif",neck="Voltsurge Torque",ear1="Loquacious Earring",ear2="Malignance Earring",
		body="Agwu's Robe",hands="Agwu's Gages",ring1="Kishar Ring",ring2="Lebeche Ring",
		back="Lifestream Cape",waist="Embla Sash",legs="Geo. Pants +1",feet="Regal Pumps +1"}

	sets.precast.FC.Geomancy = set_combine(sets.precast.FC, {range="Dunna",ammo=empty})
	
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {ear2="Malignance Earring",hands="Bagua Mitaines"})

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {main="Serenity",sub="Clerisy Strap"})
		
	sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	sets.Self_Healing = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}
	
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

	sets.precast.FC.Impact = {ammo="Impatiens",
		head=empty,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
		body="Twilight Cloak",hands="Agwu's Gages",ring1="Kishar Ring",ring2="Lebeche Ring",
		back="Lifestream Cape",waist="Embla Sash",legs="Geo. Pants +1",feet="Regal Pumps +1"}
		
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})
	
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {}


	--------------------------------------
	-- Midcast sets
	--------------------------------------

    sets.midcast.FastRecast = {main="Solstice",sub="Culminus",ammo="Impatiens",
	head="Amalric Coif",neck="Voltsurge Torque",ear1="Loquacious Earring",ear2="Malignance Earring",
	body="Agwu's Robe",hands="Agwu's Gages",ring1="Kishar Ring",ring2="Lebeche Ring",
	back="Swift Cape",waist="Witful Belt",legs="Geo. Pants +1",feet="Regal Pumps +1"}

	sets.midcast.Geomancy = {main="Solstice",sub="Culminus",range="Dunna",
		head="Azimuth Hood +2",neck="Bagua Charm +1",ear1="Gifted Earring",ear2="Calamitous Earring",
		body="Amalric Doublet",hands="Geomancy Mitaines +1",ring1="Defending Ring",ring2="Stikini Ring",
		back="Lifestream Cape",waist="Austerity Belt",legs="Geo. Pants +1",feet="Medium's Sabots"}


	--Extra Indi duration as long as you can keep your 900 skill cap.
	sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {back=gear.idle_jse_back,legs="Bagua Pants +1",feet="Azimuth Gaiters +2"})
	
    sets.midcast.Cure = {main="Daybreak",sub="Sors Shield",ammo="Hasty Pinion +1",
        head="Amalric Coif",neck="Incanter's Torque",ear1="Gifted Earring",ear2="Etiolation Earring",
        body="Shango Robe",hands="Telchine Gloves",ring1="Lebeche Ring",ring2="Sirona's Ring",
        back="Tempered Cape",waist="Witful Belt",legs="Geo. Pants +1",feet="Vanya Clogs"}
		
    sets.midcast.LightWeatherCure = {main="Chatoyant Staff",sub="Curatio Grip",ammo="Hasty Pinion +1",
        head="Amalric Coif",neck="Phalaina Locket",ear1="Gifted Earring",ear2="Etiolation Earring",
        body="Shango Robe",hands="Telchine Gloves",ring1="Lebeche Ring",ring2="Sirona's Ring",
        back="Twilight Cape",waist="Hachirin-no-Obi",legs="Gyve Trousers",feet="Vanya Clogs"}
		
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {main="Gada",sub="Sors Shield",ammo="Hasty Pinion +1",
        head="Amalric Coif",neck="Incanter's Torque",ear1="Gifted Earring",ear2="Etiolation Earring",
		body="Shango Robe",hands="Telchine Gloves",ring1="Lebeche Ring",ring2="Sirona's Ring",
        back="Twilight Cape",waist="Hachirin-no-Obi",legs="Geo. Pants +1",feet="Vanya Clogs"}

    sets.midcast.Curaga = set_combine(sets.midcast.Cure, {main="Daybreak",sub="Sors Shield"})

	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",hands="Hieros Mittens",
		back="Oretan. Cape +1",ring1="Haoma's Ring",ring2="Menelaus's Ring",waist="Witful Belt",feet="Vanya Clogs"})
	
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main=gear.grioavolr_fc_staff,sub="Clemency Grip"})
	
    sets.midcast['Elemental Magic'] = {main="Bunzi's Rod",sub="Culminus",ammo="Ghastly Tathlum +1",
        head="Azimuth Hood +2",neck="Baetyl Pendant",ear1="Barkaro. Earring",ear2="Malignance Earring",
        body="Azimuth Coat +2",hands="Azimuth Gloves +2",ring1="Shiva Ring +1",ring2="Acumen Ring",
        back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Azimuth's Tights +2",feet="Azimuth Gaiters +2"}

    sets.midcast['Elemental Magic'].Resistant = {main="Grioavolr",sub="Enki Strap",ammo="Pemphredo Tathlum",
        head="Merlinic Hood",neck="Sanctity Necklace",ear1="Barkaro. Earring",ear2="Malignance Earring",
        body="Jhakri Robe +2",hands="Amalric Gages",ring1="Shiva Ring +1",ring2="Acumen Ring",
        back=gear.nuke_jse_back,waist="Eschan Stone",legs="Azimuth's Tights +2",feet="Azimuth Gaiters +2"}
		
    sets.midcast['Elemental Magic'].Proc = {main=empty,sub=empty,ammo="Impatiens",
        head="Vanya Hood",neck="Loricate Torque +1",ear1="Gifted Earring",ear2="Loquac. Earring",
        body="Seidr Cotehardie",hands="Regal Cuffs",ring1="Kishar Ring",ring2="Prolix Ring",
        back="Swith Cape +1",waist="Witful Belt",legs="Assid. Pants +1",feet="Regal Pumps +1"}
		
    sets.midcast['Elemental Magic'].Fodder = {main="Daybreak",sub="Culminus",ammo="Ghastly Tathlum +1",
        head="Merlinic Hood",neck="Saevus Pendant +1",ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Jhakri Robe +2",hands="Mallquis Cuffs +2",ring1="Shiva Ring +1",ring2="Freke Ring",
        back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Azimuth's Tights +2",feet="Azimuth Gaiters +2"}
		
    sets.midcast['Elemental Magic'].HighTierNuke = {main="Bunzi's Rod",sub="Culminus",ammo="Pemphredo Tathlum",
        head="Azimuth Hood +2",neck="Baetyl Pendant",ear1="Barkaro. Earring",ear2="Malignance Earring",
        body="Azimuth Coat +2",hands="Azimuth Gloves +2",ring1="Shiva Ring +1",ring2="Acumen Ring",
        back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Azimuth's Tights +2",feet="Azimuth Gaiters +2"}
		
    sets.midcast['Elemental Magic'].HighTierNuke.Resistant = {main="Grioavolr",sub="Enki Strap",ammo="Pemphredo Tathlum",
        head="Merlinic Hood",neck="Sanctity Necklace",ear1="Regal Earring",ear2="Malignance Earring",
        body="Jhakri Robe +2",hands="Amalric Gages",ring1="Stikini Ring",ring2="Stikini Ring",
        back=gear.nuke_jse_back,waist="Eschan Stone",legs="Azimuth's Tights +2",feet="Azimuth Gaiters +2"}

	sets.midcast['Elemental Magic'].HighTierNuke.Fodder = {main="Daybreak",sub="Culminus",ammo="Pemphredo Tathlum",
        head="Merlinic Hood",neck="Saevus Pendant +1",ear1="Regal Earring",ear2="Malignance Earring",
        body="Jhakri Robe +2",hands="Amalric Gages",ring1="Metamor. Ring +1",ring2="Freke Ring",
        back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Merlinic Shalwar",feet=gear.Merlinic_feet_MAB}
		
    sets.midcast['Dark Magic'] = {main="Rubicundity",sub="Culminus",ammo="Pemphredo Tathlum",
        head="Merlinic Hood",neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
        body="Azimuth Coat +2",hands="Azimuth Gloves +2",ring1="Stikini Ring",ring2="Stikini Ring",
        back=gear.nuke_jse_back,waist="Eschan Stone",legs="Azimuth's Tights +2",feet=gear.Merlinic_feet_MAB}
		
    sets.midcast.Drain = {main="Rubicundity",sub="Culminus",ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
        body="Shango Robe",hands="Azimuth Gloves +2",ring1="Archon Ring",ring2="Evanescence Ring",
        back=gear.nuke_jse_back,waist="Fucho-no-obi",legs="Azimuth's Tights +2",feet="Azimuth Gaiters +2"}
    
    sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {main="Grioavolr",sub="Clerisy Strap",ammo="Hasty Pinion +1",
		head="Amalric Coif",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
		body="Agwu's Robe",hands="Agwu's Gages",ring1="Metamor. Ring +1",ring2="Stikini Ring",
		back="Lifestream Cape",waist="Witful Belt",legs="Psycloth Lappas",feet="Regal Pumps +1"}
		
	sets.midcast.Stun.Resistant = {main="Daybreak",sub="Culminus",ammo="Pemphredo Tathlum",
		head="Amalric Coif",neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
		body="Shango Robe",hands="Amalric Gages",ring1="Metamor. Ring +1",ring2="Stikini Ring",
		back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Azimuth's Tights +2",ffeet=gear.Merlinic_feet_MAB}
		
	sets.midcast.Impact = {main="Daybreak",sub="Culminus",ammo="Pemphredo Tathlum",
		head=empty,neck="Erra Pendant",ear1="Barkaro. Earring",ear2="Malignance Earring",
		body="Twilight Cloak",hands="Azimuth Gloves +2",ring1="Metamor. Ring +1",ring2="Stikini Ring",
		back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Azimuth's Tights +2",feet=gear.Merlinic_feet_MAB}
		
	sets.midcast.Dispel = {main="Daybreak",sub="Culminus",ammo="Pemphredo Tathlum",
		head="Amalric Coif",neck="Erra Pendant",ear1="Barkaro. Earring",ear2="Malignance Earring",
		body="Shango Robe",hands="Azimuth Gloves +2",ring1="Metamor. Ring +1",ring2="Stikini Ring",
		back=gear.nuke_jse_back,waist="Embla Sash",legs="Azimuth's Tights +2",feet=gear.Merlinic_feet_MAB}

	sets.midcast.Dispelga = set_combine(sets.midcast.Dispel, {main="Daybreak",sub="Culminus"})
		
	sets.midcast['Enfeebling Magic'] = {main="Grioavolr",sub="Enki Strap",ammo="Pemphredo Tathlum",
		head="Befouled Crown",neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
		body="Shango Robe",hands="Azimuth Gloves +2",ring1="Kishar Ring",ring2="Stikini Ring",
		back=gear.nuke_jse_back,waist="Luminary Sash",legs="Psycloth Lappas",feet="Uk'uxkaj Boots"}
		
	sets.midcast['Enfeebling Magic'].Resistant = {main="Grioavolr",sub="Enki Strap",ammo="Pemphredo Tathlum",
		head="Befouled Crown",neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
		body="Shango Robe",hands="Azimuth Gloves +2",ring1="Metamor. Ring +1",ring2="Stikini Ring",
		back=gear.nuke_jse_back,waist="Luminary Sash",legs="Psycloth Lappas",feet="Skaoi Boots"}
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif",ear2="Malignance Earring",waist="Acuity Belt +1"})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif",ear2="Malignance Earring",waist="Acuity Belt +1"})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif",ear2="Malignance Earring",waist="Acuity Belt +1"})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif",ear2="Malignance Earring",waist="Acuity Belt +1"})
	
	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {range=empty,ring1="Stikini Ring"})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {range=empty,ring1="Stikini Ring"})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {ring1="Stikini Ring"})
		
	sets.midcast['Enhancing Magic'] = {main="Gada",sub="Culminus",ammo="Hasty Pinion +1",
		head="Telchine Cap",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Gifted Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Perimede Cape",waist="Embla Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif"})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Genmei Shield",head="Amalric Coif",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Gifted Earring",ear2="Malignance Earring",waist="Sekhmet Corset"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Gifted Earring",ear2="Malignance Earring",waist="Sekhmet Corset"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Gifted Earring",ear2="Malignance Earring",waist="Sekhmet Corset"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Gifted Earring",ear2="Malignance Earring",waist="Sekhmet Corset"})

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Resting sets
	sets.resting = {main="Chatoyant Staff",sub="Oneiros Grip",
		head="Befouled Crown",neck="Chrys. Torque",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Jhakri Robe +2",hands="Bagua Mitaines",ring1="Defending Ring",ring2="Dark Ring",
		back="Moonbeam Cape",legs="Assid. Pants +1",feet=gear.merlinic_refresh_feet}

	-- Idle sets

	sets.idle = {main="Mpaca's Staff",sub="Oneiros Grip",ammo="Staunch Tathlum",
		head="Befouled Crown",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Azimuth Coat +2",hands="Bagua Mitaines",ring1="Shneddick Ring",ring2="Mephitas's Ring",
		back="Shadow Mantle",waist="Carrier's Sash",legs="Assid. Pants +1",feet="Amalric Nails"}
		
	sets.idle.PDT = {main="Malignance Pole",sub="Umbra Strap",ammo="Staunch Tathlum",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Jhakri Robe +2",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
		back="Shadow Mantle",waist="Carrier's Sash",legs="Assid. Pants +1",feet="Nyame Sollerets"}

	-- .Pet sets are for when Luopan is present.
	sets.idle.Pet = {main="Solstice",sub="Culminus",range="Dunna",
		head="Azimuth Hood +2",neck="Bagua Charm +1",ear1="Handler's Earring",ear2="Handler's Earring +1",
		body="Azimuth Coat +2",hands="Geomancy Mitaines +1",ring1="Defending Ring",ring2="Dark Ring",
		back=gear.idle_jse_back,waist="Isa Belt",legs="Psycloth Lappas",feet="Bagua Sandals +2"}

	sets.idle.PDT.Pet = {main="Malignance Pole",sub="Umbra Strap",range="Dunna",
		head="Azimuth Hood +2",neck="Bagua Charm +1",ear1="Handler's Earring",ear2="Handler's Earring +1",
		body="Jhakri Robe +2",hands="Geomancy Mitaines +1",ring1="Defending Ring",ring2="Dark Ring",
		back=gear.idle_jse_back,waist="Isa Belt",legs="Nyame Flanchard",feet="Bagua Sandals +2"}

	-- .Indi sets are for when an Indi-spell is active.
	sets.idle.Indi = set_combine(sets.idle, {})
	sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {}) 
	sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {}) 
	sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {})

	sets.idle.Weak = {main="Daybreak",sub="Culminus",ammo="Staunch Tathlum",
		head="Befouled Crown",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Agwu's Robe",hands="Bagua Mitaines",ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Carrier's Sash",legs="Assid. Pants +1",feet="Azimuth Gaiters +2"}

	-- Defense sets
	
	sets.defense.PDT = {main="Malignance Pole",sub="Umbra Strap",ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Handler's Earring +1",
		body="Mallquis Saio +2",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Azimuth Gaiters +2"}

	sets.defense.MDT = {main="Malignance Pole",sub="Umbra Strap",ammo="Staunch Tathlum +1",
		head="Azimuth Hood +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Handler's Earring +1",
		body="Mallquis Saio +2",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Azimuth Gaiters +2"}
		
    sets.defense.MEVA = {main="Malignance Pole",sub="Enki Strap",ammo="Staunch Tathlum +1",
        head="Azimuth Hood +2",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Jhakri Robe +2",hands="Telchine Gloves",ring1="Vengeful Ring",Ring2="Purity Ring",
        back=gear.idle_jse_back,waist="Luminary Sash",legs="Telchine Braconi",feet="Azimuth Gaiters +2"}
		
	sets.defense.PetPDT = sets.idle.PDT.Pet
		
	sets.defense.NukeLock = sets.midcast['Elemental Magic']
	
	sets.defense.GeoLock = sets.midcast.Geomancy.Indi

	sets.Kiting = {feet="Geomancy Sandals +1"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.TPEat = {neck="Chrys. Torque"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.merlinic_treasure_feet})
	
	sets.HPDown = {head="Pixie Hairpin +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape +1",legs="Shedir Seraweels",feet="Jhakri Pigaches +2"}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	--------------------------------------
	-- Engaged sets
	--------------------------------------

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee group
	sets.engaged = {ammo="Hasty Pinion +1",
		head="Befouled Crown",neck="Asperity Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Jhakri Robe +2",hands="Gazu Bracelet +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back="Moonlight Cape",waist="Witful Belt",legs="Assid. Pants +1",feet="Battlecast Gaiters"}
		
	sets.engaged.DW = {ammo="Hasty Pinion +1",
		head="Befouled Crown",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Jhakri Robe +2",hands="Regal Cuffs",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back="Moonlight Cape",waist="Witful Belt",legs="Assid. Pants +1",feet="Battlecast Gaiters"}

	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {main=gear.grioavolr_nuke_staff,sub="Alber Strap",head="Ea Hat +1",neck="Mizu. Kubikazari",body="Ea Houppe. +1",ring1="Mujin Band",legs="Ea Slops +1",feet="Jhakri Pigaches +2"}
	sets.ResistantMagicBurst = {main=gear.grioavolr_nuke_staff,sub="Enki Strap",head="Ea Hat +1",neck="Mizu. Kubikazari",body="Ea Houppe. +1",ring1="Mujin Band",legs="Ea Slops +1",feet="Jhakri Pigaches +2"}
	
	sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
	
	-- Weapons sets
	sets.weapons.Maxentius = {main='Maxentius',sub='Genmei Shield'}
	sets.weapons.DualWeapons = {main='Maxentius',sub='Nehushtan'}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 15)
end