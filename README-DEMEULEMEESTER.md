# Gautam Demeulemeester

Je vais implémenter une nouvelle fonctionnalité pour le jeud Sokoban et y introduire la notion de couleur. Pour l'instant chaque boîte peut aller sur chaque cible. Je veux maintenant que une boite rouge soit valide seulement si elle est sur une cible rouge, une boite verte sur cible verte etc... La partie sera gagante si et seulement si toutes les boites sont sur des cibles de la même couleur.

### Voici les étapes que je vais essayer de suivre pour l'ajout de cette fonctionnalité :

1 - Ecriture des tests (TDD)

2 - Ajout de la notion de couleur Pour les Box et les Target

3 - Ajout de la logique de verification pour gagner une partie

4 - Affichage visuel

Je pense utiliser la notion de DoubleDispatch sur l'acceptation des cibles/boites aini que le polymorphisme sur la méthode d'acceptation des boites (acceptsBox). Une petite notion de l'héritage sera aussi utiliser sur les objets du jeu.

## Etape 1 : Les tests (TDD)
Je vais d'abord écrire des cas de tests afin de cibler ce que je dois developper par la suite. Je test que je peux assigner une couleur aux boites et aux cibles (testColorAssignment), que les cibles n'acceptent que les boites de leur couleur (testTargetAcceptsMatchingBox, testTargetRefusesDifferentBox) et que la partie est gagnée seulement si toutes les boites sont sur les cibles de bonne couleur (testBoardFinishedWithMatchingColors, testBoardNotFinishedWithMismatchingColors). Ces tests sont trouvables dans le package Myg-Sokoban-Tests/MygSkColorTests.

## Etape 2 : Ajout de la notion de couleur Pour les Box et les Target
On va déclarer la variable color dans la classe parente de MygSkTarget et MygSkBox : MygSkObject. L'héritage permettra d'appliquer la couleur aux cibles et aux boites en ne definissant qu'une seule fois les méthodes. 

Actuellement une partie était déclaré comme cela :
```
at: 8 put: '  ####
  #  #
 ##  ###
## $* #
#  *. @#
#   ####
#  ##
####';
```
@ : position initiale du joueur

$ : boite

. : cible

* : boite sur une cible
  
\# : mur

Je souhaitais ajouter les symboles representant les boites et cibles de couleur (r : boite rouge et R: cible rouge) sauf que je n'ai pas reussi à implementer cette fonctionnalité de parsing malgrès le temps passé dessus. De plus cette logique de jeu ne m'aurait pas permis de placer des boites sur des cibles à l'initialisation de la partie.

J'ai donc revu ma logique de jeu et j'ai opté pour une désignation d'une couleur au hasard pour les boites et cibles, en m'assurant de garder le même nombre de cibles/boites de même couleur. j'ai commancé par ajouter le test testBalancedColorsAssignment vérifiant qu'au lancement d'une partie classique chaque boite et chaque cible à une couleur parmis le rouge, le bleu et le vert et qu'il y a le même nombre de cible et de boite de chaque couleur.

J'ai ensuite modifié la méthode MygSkBoard >> assignBalancedColor qui permet de répartir équitablement les couleurs tirées au hasard sur les cibles et les boites. En appelant cette méthode dans MygSkBoard >> configureGrid: aCTNewArray2D, mes boites et cibles possdent desormais une couleur lors de l'initialisation d'une partie.  
 

## Etape 3 : Ajout de la logique de verification pour gagner une partie
Pour que la partie se termine, il faut que chaque boite soit sur une cible de sa couleur, j'ai donc modifié la méthode MygSkTarget >> acceptsBox: aBox qui verifie que sa couleur correspond à celle de la boite. J'ai également modifié MygSkBoard >> isFinished pour verifier que chaque cible doit "acceptBox" sa boite pour que la partie soit gagnante :
```
MygSkBoard >> isFinished
	"Le niveau est fini si chaque boîte est sur une cible qui l'accepte"
	^ self boxes allSatisfy: [ :each |
		each background isTarget and: [ each background acceptsBox: each ]
	]
```
Cette logique utilise le double dispatch, le plateau dit juste à la case : "gères-tu cette boîte ?". Le plateau délègue à la cible (target acceptsBox: box) puis la cible demande sa couleur à la boîte (box color).
La logique de jeu est maintenant implémenté dans le code, mais non visible par l'utilisateur.

## Etape 4 : Affichage visuel
Pour afficher visulement les couleurs, j'ai modifié la méthode MygSkBoxElement >> box: aSkElement pour qu'a la création d'un élement du plateau, si c'est une boite une pastille de sa couleur soit dessus et si c'est une cible un cadre de sa couleur soit dessus. 

Actuellement une boite devient sombre quand elle est valide (sur une cible). J'ai donc également modifié MygSkBox >> backgroundRepresentation pour ajouter que la boite soit sombre si elle est sur une cible ET que sa couleur corresponde à celle de la cible.

J'ai modifié le niveau 9 de Loma pour un niveau plus simple (dans MygSkGameManager) :
```
'#########
#       #
# @ $ . #
#   $ . #
#   $ . #
#   $ . #
#   $ . #
#   $ . #
#       #
#########';
```
Cela donne le niveau suivant :


Cela permet de tester ma fonctionnalité mais aussi celles de mes collegues (compteur de mouvement et bouton "Annulé") ainsi que de faire une démonstration.
