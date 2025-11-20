## Idées d’évolutions pour Sokoban (simples et orientées objet)

### Issues du document

- Fonction “Undo” pour remonter l’historique des coups en réutilisant les objets représentant mouvements et état du board.
- Système de skins : classes distinctes `SkSkin`, `SkSkinManager` pour mapper chaque `SkElement` à une représentation graphique configurable.
- Éditeur de niveaux : objets `SkLevel`, `SkLevelBuilder`, `SkLevelSerializer` pour créer et sauvegarder des grilles.
- Solver / mode “Hint” : un objet `SkSolver` capable d’explorer l’arbre d’états et de fournir un mouvement conseillé.

### Pistes supplémentaires simples à coder

- Gestion de profils joueurs : classes `SkPlayerProfile` et `SkStatsTracker` stockant localement le nombre de pas et de niveaux terminés.
- Détection automatique de niveau terminé : un petit objet `SkCompletionChecker` déclenché après chaque mouvement.
- Système de feedback visuel simple (flash, surbrillance) via une classe `SkHighlightEffect` appliquée aux éléments dirty.
- Historique textuel des actions (“Vous poussez la caisse vers l’est”) en accumulant des objets `SkActionLogEntry`.
- Mode “pas à pas” : `SkStepController` qui avance le joueur d’une case via commandes objet (pattern Command).
- Paramètres de difficulté (limite de coups, timer souple) encapsulés dans `SkRuleSet`.
- Sauvegarde/chargement rapide d’une partie avec un objet `SkGameSnapshot` (pattern Memento).

### Encore plus d’idées rapides

- Tutoriel guidé : objets `SkTutorialStep` et `SkTutorialEngine` qui enchaînent des consignes simples.
- Effets sonores modulaires : `SkSoundPalette` pour associer sons et événements.
- Système de raccourcis clavier personnalisables via `SkKeyBinding` par action.
- Aide contextuelle : un `SkTipProvider` qui affiche des astuces selon l’état du board.
- Indicateurs “push count” et “move count” avec `SkCounterDisplay`.
- Détection de blocs coincés : `SkDeadlockDetector` qui met en évidence les caisses irrécupérables.
- Prévisualisation d’un mouvement : `SkMoveGhost` affiche la position future du joueur/boîte.
- Animation de victoire dédiée via `SkCelebrationSequence`.
- Gestion simple des thèmes sonores/visuels : `SkTheme` combinant palettes et sons.
- Menu d’accès rapide aux niveaux favoris avec `SkFavoriteLevelRegistry`.

### Plein d’autres pistes orientées objet

- Détection de patterns de jeu (poussées répétées, allers-retours) grâce à `SkPatternAnalyzer`.
- Mode “fantôme” affichant une solution enregistrée via `SkGhostRunner`.
- Gestion d’échecs/erreurs avec des exceptions dédiées (`SkInvalidMoveError`, `SkLevelLoadError`).
- Système de badges miniatures (bronze/argent/or) via `SkBadge` et `SkBadgeAwarder`.
- Journalisation vers disque avec `SkLogEntry` et `SkLogWriter` pour tracer les sessions.
- Commandes vocales expérimentales via un `SkVoiceCommandAdapter`.
- Import d’ensembles de niveaux externes encapsulé dans `SkLevelPack`.
- Calendrier d’événements (ex: “niveau bonus du jour”) géré par `SkEventScheduler`.
- Résumé post-partie avec `SkSessionReport` et ses `SkMetric`.
- Ajustement automatique de la caméra/zoom via `SkViewportController`.
- Système de checkpoints intermédiaires avec `SkCheckpoint` et `SkCheckpointManager`.
- Validation d’intégrité des fichiers de niveau via `SkLevelValidator`.
- Mode miroir (inversion horizontale) implémenté avec `SkBoardTransformer`.
- Mode “sans erreur” qui annule automatiquement un mouvement impossible grâce à `SkSafeMoveGuard`.
- Compatibilité tactile simplifiée avec `SkGestureInterpreter`.
- Support multilingue via `SkLocalizationCatalog`.
- Minimisation des allocations via un `SkObjectPool` pour réutiliser certaines instances fréquentes.

### Fonctionnalités très simples (niveau moyen)

- Compteur de mouvements/poussées visible : `SkMoveCounter` observe les actions et met à jour un petit widget.
- Chronomètre basique : `SkTimer` démarré à l’entrée du niveau, affiché dans le HUD.
- Bouton “Reset niveau” dédié (en plus de la barre espace) via `SkResetButton`.
- Surbrillance du joueur courant en changeant sa couleur momentanément (`SkPlayerHighlighter`).
- Message de bienvenue ou de rappel des touches via `SkMessageBanner`.
- Confirmation textuelle quand une caisse atteint une cible (`SkTargetNotifier`).
- Petite animation de “shake” lorsqu’un déplacement impossible est tenté (`SkInvalidMoveFeedback`).
- Mini logger dans la transcript/console avec `SkSimpleLogger` pour suivre les événements.
- Raccourci clavier pour afficher/masquer la grille ou les coordonnées (`SkGridToggleCommand`).
- Palette de couleurs simple définie dans une classe `SkColorScheme` pour modifier rapidement l’apparence.
- Icône animée lorsque tous les objectifs sont atteints (`SkGoalIndicator`).
- Compteur de resets réalisés (`SkResetCounter`).
- Effet sonore minimal pour les pousses via `SkSoundNotifier`.
- Affichage du niveau courant/nom via `SkLevelTitleBanner`.
- Indicateur d’état “niveau terminé / en cours” avec `SkStatusLamp`.
- Gestion d’un mode sombre/clair simple (`SkThemeSwitcher`).
- Curseur personnalisé pour le mode éditeur (`SkCursorManager`).
- Affichage des coordonnées du joueur (`SkPositionDisplay`).
- Alerte quand le joueur est resté inactif longtemps (`SkIdleReminder`).
- Prévisualisation des touches disponibles via `SkInputOverlay`.
- Indicateur visuel des cibles encore vides (`SkTargetCounter`).
- Petits “achievements” instantanés (ex: “Premier niveau terminé !”) via `SkMiniAchievement`.
- Option pour désactiver les animations via `SkAnimationToggle`.
- Historique des derniers resets (timestamp) avec `SkResetHistory`.
- Affichage simple de la profondeur d’annulation disponible (`SkUndoDepthIndicator`).
- Mode “pas de son” accessible via `SkMuteToggle`.
- Visualisation du chemin passé par le joueur (`SkPathTrail`).
- Notification contextuelle quand un niveau est impossible à résoudre (basée sur heuristique) via `SkImpossibilityHint`.
- Zoom simple +/- via `SkZoomController`.
- Effet de “bump” léger quand on heurte un mur (`SkWallBumpFeedback`).
