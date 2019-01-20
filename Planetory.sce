clear()

// Le but de ce script est de simuler le sysTtème solaire (et dans un premier
// temps, la rotation de la terre autour du soleil). La structure initiale
// est la même que le projet précédent avec le billard.


//Définition des variables utilisé dans tout le programme
G = 6.67408e-11 // La constante de gravitTation universelle (en S.I.)
NB_CORPS = 9

global cMass
global cRadius
global cVit
global cPos
cMass = zeros(NB_CORPS, 1)
cRadius = zeros(NB_CORPS, 1)
cVit = zeros(NB_CORPS, 3)
cPos = zeros(NB_CORPS, 3)

//Couleur des planètes
cColor = ["yellow","magenta","yellow","blue","red","green","yellow","green","cyan"]

function loadPlanets()
    //Charge les données des astres
    
    global cMass
    global cRadius
    global cVit
    global cPos
    global xsTs
    global ysTs
    global zsTs
    
    //Bien que le code de cette fonction soit très redondant, elle permet une lecture
    //clair des information, et de les modifier au besoin
    
    i=1
    //SOLEIL
    cMass(i) = 1.989e30
    cRadius(i) = 695000e3
    cVit(i, 1) = 0
    cVit(i, 2) = 0
    cVit(i, 3) = 0
    cPos(i, 1) = 0
    cPos(i, 2) = 0
    cPos(i, 3) = 0
    xsTs(i, 1) = cPos(i, 1)
    ysTs(i, 1) = cPos(i, 2)
    zsTs(i, 1) = cPos(i, 3)

    i=2
    //Mercure
    cMass(i) = 3.301e23
    cRadius(i) = 2440e3
    cVit(i, 1) = 0
    cVit(i, 2) = 47870
    cVit(i, 3) = 0
    cPos(i, 1) = 5795e7*cosd(7.005)
    cPos(i, 2) = 0
    cPos(i, 3) = 5795e7*sind(7.005)
    xsTs(i, 1) = cPos(i, 1)
    ysTs(i, 1) = cPos(i, 2)
    zsTs(i, 1) = cPos(i, 3)
    
    i=3
    //Venus
    cMass(i) = 4.867e24
    cRadius(i) = 6052e3
    cVit(i, 1) = -35020
    cVit(i, 2) = 0
    cVit(i, 3) = 0
    cPos(i, 1) = 0
    cPos(i, 2) = 10811e7*cosd(3.39)
    cPos(i, 3) = -10811e7*sind(3.39)
    xsTs(i, 1) = cPos(i, 1)
    ysTs(i, 1) = cPos(i, 2)
    zsTs(i, 1) = cPos(i, 3)
    
    i=4
    //TERRE
    cMass(i) = 5.972e24
    cRadius(i) = 6378e3
    cVit(i, 1) = 0
    cVit(i, 2) = -29790
    cVit(i, 3) = 0
    cPos(i, 1) = -149e9
    cPos(i, 2) = 0
    cPos(i, 3) = 0
    xsTs(i, 1) = cPos(i, 1)
    ysTs(i, 1) = cPos(i, 2)
    zsTs(i, 1) = cPos(i, 3)
    
    i=5
    //Mars
    cMass(i) = 6.417e23
    cRadius(i) = 3397e3
    cVit(i, 1) = 24077
    cVit(i, 2) = 0
    cVit(i, 3) = 0
    cPos(i, 1) = 0
    cPos(i, 2) = -22784e7*cosd(1.8506)
    cPos(i, 3) = 22784e7*sind(1.8506)
    xsTs(i, 1) = cPos(i, 1)
    ysTs(i, 1) = cPos(i, 2)
    zsTs(i, 1) = cPos(i, 3)
    
    i=6
    //Jupiter
    cMass(i) = 1.899e27
    cRadius(i) = 71492e3
    cVit(i, 1) = 0
    cVit(i, 2) = 13070
    cVit(i, 3) = 0
    cPos(i, 1) = 77814e7*cosd(1.304)
    cPos(i, 2) = 0
    cPos(i, 3) = -77814e7*sind(1.304)
    xsTs(i, 1) = cPos(i, 1)
    ysTs(i, 1) = cPos(i, 2)
    zsTs(i, 1) = cPos(i, 3)
    
    i=7
    //Saturne
    cMass(i) = 5.685e26
    cRadius(i) = 60268e3
    cVit(i, 1) = -9690
    cVit(i, 2) = 0
    cVit(i, 3) = 0
    cPos(i, 1) = 0
    cPos(i, 2) = 1427e9*cosd(2.4845)
    cPos(i, 3) = 1427e9*sind(2.4845)
    xsTs(i, 1) = cPos(i, 1)
    ysTs(i, 1) = cPos(i, 2)
    zsTs(i, 1) = cPos(i, 3)
    
    i=8
    //Uranus
    cMass(i) = 8.682e25
    cRadius(i) = 25559e3
    cVit(i, 1) = 0
    cVit(i, 2) = -6810
    cVit(i, 3) = 0
    cPos(i, 1) = -28703e8*cosd(0.7725)
    cPos(i, 2) = 0
    cPos(i, 3) = -28703e8*sind(0.7725)
    xsTs(i, 1) = cPos(i, 1)
    ysTs(i, 1) = cPos(i, 2)
    zsTs(i, 1) = cPos(i, 3)
    
    i=9
    //Neptune
    cMass(i) = 1.024e26
    cRadius(i) = 24766e3
    cVit(i, 1) = 5430
    cVit(i, 2) = 0
    cVit(i, 3) = 0
    cPos(i, 1) = 0
    cPos(i, 2) = -44999e8*cosd(1.7692)
    cPos(i, 3) = 44999e8*sind(1.7692)
    xsTs(i, 1) = cPos(i, 1)
    ysTs(i, 1) = cPos(i, 2)
    zsTs(i, 1) = cPos(i, 3)
endfunction

function calculeTrajectoire()
    global cVit
    global cPos
    global xsTs
    global ysTs
    global zsTs
    
    tic()
    progression = 0
    i = 1
    planetDestroy = %f
    while ~planetDestroy & i <= NB_PAS
        for k=1:NB_CORPS
            
            //récupération des variables à utiliser
            posT = cPos(k,:)
            vitT = cVit(k,:)
            
            posT = posT + dt * vitT
        
            AT = 0
            for y=1:NB_CORPS
                
                if y <> k
                    //récupération des variables à utiliser
                    posS = cPos(y,:)
                    MS = cMass(y)
                    
                    TS = posS-posT
                    nTS = norm(TS)
                    
                    if nTS < cRadius(k) + cRadius(y)
                        planetDestroy = %t
                        disp("Deux planètes sont entrés en collision!")
                        disp("Arrêt du calcul et afichage des trajectoires jusqu''au moment de la collision")
                    end
                    
                    AT = AT + (((G*MS)/nTS^3)*TS)
                end 
                
            end
            
            vitT = vitT + dt * AT
        
            // On mémorise les coordonnées
            xsTs(k, i) = posT(1)
            ysTs(k, i) = posT(2)
            zsTs(k, i) = posT(3)
            
            //On enregistre dans les tableaux
            cVit(k,:) = vitT
            cPos(k,:) = posT
        end
        
        if toc() >= 1
            //Affichage du pourcentage de progression des calculs
            disp(string(round(100 * (i/NB_PAS))) + "%")
            tic()
        end
        
    i = i + 1
    end
endfunction

function afficheAstre3D(n)
    comet3d(xsTs(n,:), ysTs(n,:), zsTs(n,:), "colors", color(cColor(n)))
endfunction

function afficheAstre2D(n)
    comet(xsTs(n,:), ysTs(n,:), "colors", color(cColor(n)))
endfunction

function afficheTrajectoire()
    clf()
    if repres == 2
        for i=1:NB_CORPS
            afficheAstre2D(i)
        end
    else
        for i=1:NB_CORPS
            afficheAstre3D(i)
        end
    end
endfunction

function afficheTitre()
    printf("#########################################################################################\n")
    printf("##   _______  _        _______  _        _______ _________ _______  _______            ##\n")
    printf("##  (  ____ )( \\      (  ___  )( (    /|(  ____ \\\\__   __/(  ___  )(  ____ )|\\     /|  ##\n")
    printf("##  | (    )|| (      | (   ) ||  \\  ( || (    \\/   ) (   | (   ) || (    )|( \\   / )  ##\n")
    printf("##  | (____)|| |      | (___) ||   \\ | || (__       | |   | |   | || (____)| \\ (_) /   ##\n")
    printf("##  |  _____)| |      |  ___  || (\\ \\) ||  __)      | |   | |   | ||     __)  \\   /    ##\n")
    printf("##  | (      | |      | (   ) || | \\   || (         | |   | |   | || (\\ (      ) (     ##\n")
    printf("##  | )      | (____/\\| )   ( || )  \\  || (____/\\   | |   | (___) || ) \\ \\__   | |     ##\n")
    printf("##  |/       (_______/|/     \\||/    )_)(_______/   )_(   (_______)|/   \\__/   \\_/     ##\n")
    printf("#########################################################################################\n")
endfunction

function affichePresentation()
    disp("Bienvenue dans une simulation du sytème solaire en scilab.")
    disp("Ce programme vous permet de visualiser les mouvements des 8 planetes du système solaire")
    disp("Sur un intervalle de temps donné.")
    disp("ATTENTION! Il s''agit d''une pseudo représentation du système solaire, cela signifie")
    disp("que les positions initiales des astres ne sont pas tout à fait réels.")
    disp("Bien que les distances astre-soleil, vitesses orbitals et inclinaisons des orbites soit respectées,")
    disp("les positions de départ des planetes sur leur orbites ont été choisie arbitrairement, et ne")
    disp("représente pas l''état réel du système solaire à un temps donné")
    disp("De plus, en raison des approximation de calcul et du manque de complexité du programme, les trajectoires")
    disp("peuvent êtres altérées.")
endfunction

function bool=est_entier(var)
    //Prend une variable en argument et indique s'il s'agit d'un nombre entier
    if type(var) == 1 & var == round(var)
        bool = %t;
    else
        bool = %f;
    end
    //Ici j'utilise la fonction type qui me permet de déterminer s'il s'agit bien d'un nombre,
    //et la fonction round qui permet d'obtenir l'entier arrondi d'un nombre.
    //Si la valeur retournée par round est différent de l'argument d'entrée, il ne peut pas s'agir d'un entier.
endfunction

function rep = choixRepresentation()
    disp("ce programme est capable de vous afficher une répresentation du système solaire en 2D ou en 3D.")
    rep = 0
    while ~est_entier(rep) | rep < 2 | rep > 3
        rep = input("Choissier votre modèle (2 = 2D / 3 = 3D) : ")
    end
endfunction

function rep = confirmationDuree()
    conf = 0
    while ~est_entier(conf) | conf < 1 | conf > 2
        conf = input("Confirmer vous cette durée? (1 = Oui / 2 = Non) : ")
    end
    
    rep = %f
    if conf == 1 then
        rep = %t
    end
endfunction

function rep = choixDuree()
    dureeWarning = 100
    
    disp("Veulliez choisir la durée de la simulation en années ")
    rep = 0
    while ~est_entier(rep) | rep <= 0
        rep = input("Entrer le nombre d''années : ")
        if est_entier(rep) & rep > dureeWarning
            disp("ATTENTION, vous vous aprétez à faire tourner la simulation au-delà de " + string(dureeWarning) + " ans.")
            disp("Cela risque de prendre pas mal de temps pour calculer les trajectoires.")
            if ~confirmationDuree()
                rep = 0
            end
        end
    end
endfunction

function fixeVue()
    if repres == 2
        a = get("current_axes")
        a.data_bounds = [-6e12 6e12 -6e12 6e12] // x_min x_max y_min y_max
        a.isoview = "on"
    else
        a = get("current_axes")
        a.data_bounds = [-6e12 6e12 -6e12 6e12 -6e12 6e12] // x_min x_max y_min y_max z_min z_max
        a.isoview = "on"
    end
endfunction

//////////////////////
//DEBUT DU PROGRAMME//
//////////////////////

afficheTitre()
affichePresentation()


repres = choixRepresentation()
duree = choixDuree()

disp("Calcul en cours...")

// "NB_PAS" est le nombre de pas qui vont être réalisés.
NB_PAS = 365.25*duree
dt = 3600*24

//Création des tableau
global xsTs
global ysTs
global zsTs
xsTs = zeros(NB_CORPS, NB_PAS)
ysTs = zeros(NB_CORPS, NB_PAS)
zsTs = zeros(NB_CORPS, NB_PAS)

loadPlanets()

calculeTrajectoire()

afficheTrajectoire()

fixeVue()

disp("Fin de la simulation")

//////////////////////
//FIN DU PROGRAMME//
//////////////////////
