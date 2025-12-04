# Gautam Demeulemeester

Je vais implémenter une nouvelle fonctionnalité pour le jeud Sokoban et y introduire la notion de couleur. Pour l'instant chaque boîte peut aller sur chaque cible. Je veux maintenant que une boite rouge soit valide seulement si elle est sur une cible rouge, une boite verte sur cible verte etc... La partie sera gagante si et seulement si toutes les boites sont sur des cibles de la même couleur.

### Voici les étapes que je vais essayer de suivre pour l'ajout de cette fonctionnalité :

1 - Ecriture des tests (TDD)

2 - Ajout de la notion de couleur Pour les Box et les Target

3 - Ajout de la logique de verification pour gagner une partie

4 - Affichage visuel

Nous utiliseront la notion de DoubleDispatch sur l'acceptation des cibles/boites aini que le polymorphisme sur la méthode d'acceptation des boites (acceptsBox).
