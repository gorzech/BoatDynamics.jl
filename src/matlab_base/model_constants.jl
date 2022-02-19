## All are used in kinetic energy
const l_k = 0.84# lk=m – wysokość bryły I (wysokość czubka g?owy od kr?tarza) 
const x_SBME = 3.28# xsb=m - współrzędna po?o?enia podnó?ka,
const l_t = 0.51# lt=m – długość uda,
const l_s = 0.49# ls=m – długość podudzia,

#### const m_B = 10                # kg - masa łodzi
# const mzaw = 85		    # kg – masa wioślarza
const m_f = 0.0#1.7    # kg – masa stopy, (2% Masy wioślarza)
const m_t = 0.0#10.2# kg – masa uda, (12% Masy wioślarza)
const m_s = 0.0#4.25# kg – masa podudzia, (5% Masy wioślarza)
const m_k = 0.0#52.7# kg masa bryły I (głowa+tułów+2(ręka+ przedramię+ramię))
const m_w = 0.5    # kg – masa wózka,
const m_fs = 0.0#1.5# kg – masa podnóżka,
const m_RG = 1.0# kg – masa odsadni,
const m_OA = 0.0#1.6# kg – masa wiosła,

const l_OAMX = 2.00# loamx=m – współrzędna max wiosła
const l_OAMN = -0.89# loamn=-m – współrzędna min wiosła
const x_OABME = 5.18# xoab=m – położenie dulki od płaszczyzny yz (Odległość dulki od rufy) 
const y_OAB = 0.83# yoab=m – położenie dulki od płaszczyzny xz, (Odległość od płaszczyzny symetrii

# θ_t - kąt pomiędzy udem a osią x
# Jest funkcją czasu ale dla testów załóżmy, że jest stały
const θ_t = deg2rad(22.5) # normalnie w przedziale 0-45
const θ′_t = 0.0
const θ′′_t = 0.0
# θ_k kąty pomiędzy tułowiem a osią x
const θ_k = deg2rad(90.0) # 120 to 60
const θ′_k = 0.0
const θ′′_k = 0.0

# kąty obrotu wiosla
const γ_OA = deg2rad(75.0) # normalnie 30 do 120
const γ′_OA = 0.0
const γ′′_OA = 0.0

## Many others
const g = 9.80665	# g=9.80665 m/s2 - przyspieszenie ziemskie,
const rhoh2o = 1000	# rhoh2o=1000 kg/m3 – gęstość wody

const xmax = 7.91    # xmax=m – współrzędna dziobu łodzi,
const xmin = 0       # xmin=m – współrzędna rufy łodzi,
# const lb = 7.91      # lb=xmax–xmin=m długość łodzi,
const hb = 0.23      # hb=m – wysokość łodzi,
const bb = 0.30      # bb=m – szerokość łodzi,
const xmax0 = 5.01   # xmax0=m – współrzędna przejęcia strefy dziobowej na strefę walcową,
const xmin0 = 2.56   # xmin0=m – współrzędna przejęcia strefy rufowej na strefę walcową,
const zmax = 0.23	# zmax=m – współrzędna stępki w strefie walcowej,

const deltab = 0.0015	# deltab=m – grubość kadłuba łodzi,
const deltad = 0.0015	# deltad=m – grubość pokładu łodzi,
const deltag = 0.0015	# deltag=m – grubość podłogi łodzi,

const rhob = 2000	# rhob=kg/m3 – gęstość objętościowa materiału kadłuba,
const rhod = 2000	# rhod=kg/m3 – gęstość objętościowa materiału pokładu,
const rhog = 2000	# rhog=kg/m3 – gęstość objętościowa materiału podłogi,

const bbe = 0.26		# bbe=m – szerokość kokpitu,
const xmaxe = 4.57	# xmaxe=m – współrzędna dziobowa kokpitu,
const xmine = 2.68	# xmine=m – współrzędna rufowa kokpitu,
const bbg = 0.23		# bbg=m – szerokość podłogi,
const xmaxg = 4.55	# xmaxg=m – współrzędna dziobowa podłogi,
const xming = 2.71	# xming=m – współrzędna rufowa podłogi,
const hbg = 0.11		# Hbg=m – głębokość podłogi od pokładu

const rhoair = 1.225	# rhoair=1.225kg/m3 .-gęstość powietrza
const bro = 0.43		# bro=m – szerokość tułowia,
const hro = 0.84		# hro=m – wysokość tułowia,
# Masses
# const loa = 2.89		# loa=loamx-loamn=m – długość wiosła,
# const nuh2o = 1.14e-6	# nuh2o=1.14×10-6 m2/s – współczynnik lepko?ci kinematycznej wody dla T=288°K 
# const nuair = 1.445e-5	# nuair=1.445×10-5 m2/s – współczynnik lepko?ci kinematycznej powietrza dla T=288°K, 1013 hPa,
const cf0 = 0.075	# cf0=0.075 – współczynnik odniesienia oporu lepko?ciowego wody dla reh2o=0,
const cdw = 0.02		# cdw=0.02 – współczynnik hydrodynamicznego oporu falowego,
const cdx = 0.01		# cdx=0.01 – współczynnik oporu hydrodynamicznego kształtu,
const cdro = 1.05	# cdro – współczynnik oporu aerodynamicznego tułowia wioślarza.

# const lomax = 2      # lomax=m - współrzędna max pióra wiosła
# const lomin = 1.56   # lomin=m - współrzędna min pióra wiosła
# const boac = 0.23    # boa=m - szerokość pióra wiosła
const sro = bro * hro #0.3612	# sro=m2 – pole powierzchni tułowia, (pole czo?owe bryły I, pole prostok?ta)

# But can be computed using r_reynolds
const freh2o = 1.0
const freair = 1.0