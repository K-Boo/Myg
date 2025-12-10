# Readme - Implémentation du Compteur et de l'Annulation

Ce document récapitule les ajouts que j'ai effectués sur le projet Sokoban, concernant principalement l'implémentation du compteur de mouvements et son intégration avec la fonctionnalité "Annuler" ajouté par l'un des membres du groupe (Undo).

## Objectifs

L'objectif était double :
1.  **Affichage du Compteur** : Permettre au joueur de voir son nombre de coups en temps réel.
2.  **Harmonisation avec l'Undo** : Garantir que l'annulation d'un coup décrémente correctement ce compteur.

## Méthodologie

J'ai adopté une approche **TDD (Test Driven Development)** pour chaque étape du développement, suivant le cycle *Red (Test échoue) -> Green (Test passe) -> Refactor*(si besoin).

---

## 1. Implémentation du Compteur de Mouvements

### Analyse et Conception
Le jeu suit une architecture semblable à un MVC. Le compteur existait déjà dans le modèle (`MygSkGameManager`) mais n'était pas affiché dans la vue.

*   **Modèle** : `MygSkGameManager` gère `currentMoveCount`.
*   **Vue** : `MygSkBoardElement` devait être modifié pour inclure un label textuel.

### Étapes de Réalisation (TDD)

1.  **Création des tests (`MygSkBoardElementTest`)** :
    *   `testInitialMoveCountDisplay` : Vérifie que le label "Moves: 0" est bien présent au lancement.
    *   `testMoveCountUpdatesOnMove` : Simule un mouvement et vérifie que le texte change dynamiquement ("Moves: 1").

2.  **Développement (`MygSkBoardElement`)** :
    *   Ajout de `moveCountLabel` (un `BlTextElement` dans un conteneur stylisé).
    *   Implémentation de `updateMoveCountDisplay` pour synchroniser la vue avec le modèle.
    *   Appel de cette mise à jour dans `manageEvent:` lors d'un mouvement réussi.

---

## 2. Intégration de la Décrémentation (Undo)

### Problème
La fonctionnalité "Annuler" existante remettait bien le joueur à sa position précédente, mais le compteur de mouvements continuait d'augmenter ou restait stable, faussant le score. L'undo d'un mouvement doit décrémenter le compteur de mouvements.

### Étapes de Réalisation (TDD)

1.  **Test de reproduction (`MygSkGameManagerTest`)** :
    *   `testUndoDecrementsMoveCount` : Scénario complet (Mouvement -> Compteur=1 -> Undo -> Vérification que Compteur=0).

2.  **Correction du Modèle** :
    *   Ajout de la méthode `decrementMoveCount` dans `MygSkGameManager`.
    *   Modification de `MygSkBoard >> undo` pour appeler cette décrémentation lorsque l'historique est dépilé.

---

## Conclusion

Les fonctionnalités sont désormais pleinement opérationnelles et testées. Le compteur réagit correctement. 
