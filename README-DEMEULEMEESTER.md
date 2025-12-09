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


## Etape 3 : Ajout de la logique de verification pour gagner une partie
On va devoir 
