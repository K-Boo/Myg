# Projet Sokoban - Évolutions

## Objectif Principal : Fonction "Undo" (Annuler)

L'objectif est de permettre au joueur de revenir en arrière coup par coup pour corriger ses erreurs sans avoir à recommencer tout le niveau.

### Roadmap

1.  **Phase 1 : Interface Graphique (UI)**
    *   Affichage d'un bouton "Annuler" visible dans l'interface du jeu.
    *   Ce bouton ne fera rien pour l'instant, il s'agit juste de la mise en place visuelle.

2.  **Phase 2 : Logique (Modèle)**
    *   Implémentation du **Pattern Command** pour encapsuler les mouvements.
    *   Création d'une pile d'historique pour stocker les actions passées.
    *   Gestion de l'annulation des déplacements simples et des poussées de caisses.

3.  **Phase 3 : Connexion**
    *   Relier le bouton "Annuler" à la logique d'annulation.
    *   Ajout éventuel d'un raccourci clavier.
