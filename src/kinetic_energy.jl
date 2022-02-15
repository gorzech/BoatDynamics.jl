# const xmax = 7.91    # xmax=m – współrzędna dziobu łodzi,
# const xmin = 0       # xmin=m – współrzędna rufy łodzi,
# const lb = 7.91      # lb=xmax–xmin=m długość łodzi,
# const hb = 0.23      # hb=m – wysokość łodzi,
# const bb = 0.30      # bb=m – szerokość łodzi,
# const xmax0 = 5.01   # xmax0=m – współrzędna przejęcia strefy dziobowej na strefę walcową,
# const xmin0 = 2.56   # xmin0=m – współrzędna przejęcia strefy rufowej na strefę walcową,
# const zmax = 0.23	# zmax=m – współrzędna stępki w strefie walcowej,

# const deltab = 0.0015	# deltab=m – grubość kadłuba łodzi,
# const deltad = 0.0015	# deltad=m – grubość pokładu łodzi,
# const deltag = 0.0015	# deltag=m – grubość podłogi łodzi,

# const rhob = 2000	# rhob=kg/m3 – gęstość objętościowa materiału kadłuba,
# const rhod = 2000	# rhod=kg/m3 – gęstość objętościowa materiału pokładu,
# const rhog = 2000	# rhog=kg/m3 – gęstość objętościowa materiału podłogi,

# const bbe = 0.26		# bbe=m – szerokość kokpitu,
# const xmaxe = 4.57	# xmaxe=m – współrzędna dziobowa kokpitu,
# const xmine = 2.68	# xmine=m – współrzędna rufowa kokpitu,
# const bbg = 0.23		# bbg=m – szerokość podłogi,
# const xmaxg = 4.55	# xmaxg=m – współrzędna dziobowa podłogi,
# const xming = 2.71	# xming=m – współrzędna rufowa podłogi,
# const hbg = 0.11		# Hbg=m – głębokość podłogi od pokładu

# const rhoh2o = 1000	# rhoh2o=1000 kg/m3 – gęstość wody
# const rhoair = 1.225	# rhoair=1.225kg/m3 .-gęstość powietrza
# const bro = 0.43		# bro=m – szerokość tułowia,
# const hro = 0.84		# hro=m – wysokość tułowia,
const l_k = 0.84# lk=m – wysokość bryły I (wysokość czubka g?owy od kr?tarza) 
# const sro = 0.3612	# sro=m2 – pole powierzchni tułowia, (pole czo?owe bryły I, pole prostok?ta)
const x_SB = 3.28# xsb=m - współrzędna po?o?enia podnó?ka,
const l_t = 0.51# lt=m – długość uda,
const l_s = 0.49# ls=m – długość podudzia,

# Masses
m_B = 10                # kg - masa łodzi
# const mzaw = 85		    # kg – masa wioślarza
const m_f = 1.7    # kg – masa stopy, (2% Masy wioślarza)
const m_t = 10.2# kg – masa uda, (12% Masy wioślarza)
const m_s = 4.25# kg – masa podudzia, (5% Masy wioślarza)
const m_k = 52.7# kg masa bryły I (głowa+tułów+2(ręka+ przedramię+ramię))
const m_w = 0.5    # kg – masa wózka,
const m_fs = 1.5# kg – masa podnóżka,
const m_RG = 1.0# kg – masa odsadni,
const m_OA = 1.6# kg – masa wiosła,
const m_total = m_B + m_RG + m_w + m_fs + m_k + 2m_t + 2m_f + 2m_s + 2m_OA # Masa łodzi i wioślarza
const m_move = m_w + m_k + 2m_t # masa w ruchu - wózek + bryła ciała + uda

const l_OAMX = 2.00# loamx=m – współrzędna max wiosła
const l_OAMN = -0.89# loamn=-m – współrzędna min wiosła
# const loa = 2.89		# loa=loamx-loamn=m – długość wiosła,
const x_OAB = 5.18# xoab=m – położenie dulki od płaszczyzny yz (Odległość dulki od rufy) 
const y_OAB = 0.83# yoab=m – położenie dulki od płaszczyzny xz, (Odległość od płaszczyzny symetrii
# const g = 9.80665	# g=9.80665 m/s2 - przyspieszenie ziemskie,
# const nuh2o = 1.14e-6	# nuh2o=1.14×10-6 m2/s – współczynnik lepko?ci kinematycznej wody dla T=288°K 
# const nuair = 1.445e-5	# nuair=1.445×10-5 m2/s – współczynnik lepko?ci kinematycznej powietrza dla T=288°K, 1013 hPa,
# const cf0 = 0.075	# cf0=0.075 – współczynnik odniesienia oporu lepko?ciowego wody dla reh2o=0,
# const cdw = 0.02		# cdw=0.02 – współczynnik hydrodynamicznego oporu falowego,
# const cdx = 0.01		# cdx=0.01 – współczynnik oporu hydrodynamicznego kształtu,
# const cdro = 1.05	# cdro – współczynnik oporu aerodynamicznego tułowia wioślarza.

# const lomax = 2      # lomax=m - współrzędna max pióra wiosła
# const lomin = 1.56   # lomin=m - współrzędna min pióra wiosła
# const boac = 0.23    # boa=m - szerokość pióra wiosła

const J_By = 65.796483126826487 # Moment bezwładności łodzi

# θ_t - kąt pomiędzy udem a osią x
# Jest funkcją czasu ale dla testów załóżmy, że jest stały
const θ_t = 22.5 # normalnie w przedziale 0-45
const θ′_t = 0.0
const θ′′_t = 0.0
# θ_k kąty pomiędzy tułowiem a osią x
const θ_k = 90.0 # 120 to 60
const θ′_k = 0.0
const θ′′_k = 0.0

# kąty obrotu wiosla
const γ_OA = 75.0 # normalnie 30 do 120
const γ′_OA = 0.0
const γ′′_OA = 0.0



function kinetic_energy(u, w, θ′)
    jt =
        l_s^2 * cos(F_0(θ_t))^2 +
        x_SB^2 +
        l_t^2 / 3 +
        l_t * l_s * cos(F_0(θ_t)) * cos(θ_t) +
        x_SB * l_t * cos(θ_t) +
        2x_SB * l_s * cos(F_0(θ_t))

    wltls = 2 # But in energy in matlab this is one
    jk =
        l_t^2 * cos(θ_t)^2 +
        l_s^2 * cos(F_0(θ_t))^2 +
        l_k^2 / 3 +
        x_SB^2 +
        wltls * l_t * l_s * cos(F_0(θ_t)) * cos(θ_t) - l_t * l_k * cos(θ_t) * cos(θ_k) +
        2x_SB * l_t * cos(θ_t) - l_s * l_k * cos(F_0(θ_t)) * cos(θ_k) +
        2x_SB * l_s * cos(F_0(θ_t)) - x_SB * l_k * cos(θ_k)

    jjk =
        l_t^2 * cos(θ_t)^2 +
        l_s^2 * cos(F_0(θ_t))^2 +
        x_SB^2 +
        2l_t * l_s * cos(θ_t) * cos(F_0(θ_t)) +
        2x_SB * l_t * cos(θ_t) +
        2x_SB * l_s * cos(F_0(θ_t)) - l_k * l_t / 2 * cos(θ_k) * cos(θ_t) -
        l_k * l_s / 2 * cos(θ_k) * cos(F_0(θ_t)) - x_SB * l_k / 2 * cos(θ_k)

    jjt =
        l_t^2 / 2 * cos(θ_t)^2 +
        l_s^2 * cos(F_0(θ_t))^2 +
        x_SB^2 +
        3l_t * l_s / 2 * cos(θ_t) * cos(F_0(θ_t)) +
        3x_SB * l_t / 2 * cos(θ_t) +
        2x_SB * l_s * cos(F_0(θ_t))

    0.5m_total * (u^2 + w^2) +
    0.5J_By * θ′^2 +
    0.5m_move * (l_s * F_1(θ_t) + l_t)^2 * θ′_t^2 * sin(θ_t)^2 +
    0.5m_move * jt * (θ′ + θ′_t)^2 +
    0.5m_move * jk * (θ′ + θ′_k)^2 +
    (m_s + m_f + 0.5m_fs) * θ′^2 * x_SB^2 +
    0.5m_RG * θ′^2 * x_OAB^2 + # czy to powinno tu być?
    m_s * (l_s^2 / 3 + x_SB^2 + x_SB * l_s * cos(F_0(θ_t))) * (θ′ - θ′_t * F_1(θ_t))^2 +
    m_OA *
    (
        (l_OAMX^2 + l_OAMX * l_OAMN + l_OAMN^2) / 3 +
        y_OAB^2 +
        y_OAB * (l_OAMX + l_OAMN) * sin(γ_OA)
    )γ′_OA^2 - m_move * (l_s * F_1(θ_t) + l_t)θ′_t * u * sin(θ_t) +
    m_k *
    (
        u * l_k / 2 * sin(θ_k) -
        w * (l_t * cos(θ_t) + l_s * cos(F_0(θ_t)) - l_k / 2 * cos(θ_k) + x_SB)
    ) *
    (θ′ + θ′_k) +
    2m_t *
    (u * l_t / 2 * sin(θ_t) - w * (l_t / 2 * cos(θ_t) + l_s * cos(F_0(θ_t)) + x_SB)) *
    (θ′ + θ′_t) +
    2m_s *
    (u * l_s / 2 * sin(F_0(θ_t)) - w * (l_s / 2 * cos(F_0(θ_t)) + x_SB)) *
    (θ′ - θ′_t * F_1(θ_t)) -
    m_move * (l_t / 2 * cos(θ_t) + l_s * cos(F_0(θ_t)) + x_SB) * θ′ * w + # po dodaniu tego, otrzymywałem ujemne wartości energii kinetycznej
    m_k * jjk * θ′ * (θ′ + θ′_k) +
    2m_t * jjt * θ′ * (θ′ + θ′_t) +
    2m_s * x_SB * (l_s / 2 * cos(F_0(θ_t)) + x_SB) * θ′ * (θ′ - θ′_t * F_1(θ_t)) -
    m_t * l_t * (l_s * F_1(θ_t) + l_t) * θ′_t * (θ′ + θ′_t) * sin(θ_t)^2 -
    0.5m_k * l_k * (l_s * F_1(θ_t) + l_t) * θ′_t * (θ′ + θ′_k) * sin(θ_t) * sin(θ_k) -
    2(m_f + m_s + 0.5m_fs)x_SB * θ′ * w + m_RG * x_OAB * θ′ * w -
    2m_OA * (y_OAB + (l_OAMX + l_OAMN) / 2 * sin(γ_OA)) * γ′_OA * u
end

F_0(θ_t) = asin(l_t / l_s * sin(θ_t))
F_1(θ_t) = (l_t / l_s * cos(θ_t)) / (1 - (l_t / l_s * sin(θ_t))^2)^0.5
