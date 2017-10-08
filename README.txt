                                       # PoiNavig 

     PoiNavig est une application qui permet la gestion d'un ensemble d'emplacements (restaurants, 
magasins...) désignés par leur nomination, description ainsi que leur localisation ; ceux-ci sont 
appelés "points d'intérêt".

     Pour que la gestion de ceux-ci soit rigoureuse un mécanisme de sécurité est mis en place et 
ceci grace au module "Spring Security", qui permet de distinguer l'ensemble de droits (rôles) suivants:
administrateur, modérateur et utilisateur simple. 
  
     Pour le démarrage de l'application, une authentification préalable est requise par le biais
 d'un login et d'un mot de passe, et ceci pour tout type d'utilisateur.

     Un menu personalisé est affiché après la connection d'un utilisateur, et ceci selon le 
role qu'il lui est attribué.

     A sa connexion sur son compte, l'administrateur va pouvoir visualiser divers statistiques comme 
le nombre d'utilisateurs de l'application, le nombre de points d'interet ainsi que le nombre de groupe de POIs.
Il pourra aussi visualiser l'effectif des points d'interet par groupe de POIs ainsi que  l'évolution 
des inscriptions des utilisateurs

     L'administrateur est le seul qui peut gérer au sens propre du terme les points d'interets ainsi 
que  les groupes de POIs (ajout, modification et suppression). Il a aussi le droit de gérer la liste 
des utilisateurs(ajout, modification et suppression).Il peut aussi rechercher un point d'interet et ceci 
en tapant sa nomination.

     Pour crée un point d'interet, l'administrateur doit saisir les champs suivants: son nom,
sa description, son adresse, sa latitude, sa longétude ainsi que le groupe de POI auquel il appartient.
Il peut aussi ajouter une ou plusieur image pour illustrer le point d'interet en question.
Une fois le point est crée, il est ajouté à la liste des points d'interets et il est aussitot géolocalisé
sur une map interactive.

      Le modérateur quant à lui, a uniquement le droit de gérer la liste des utilisateurs (ajout, modification 
et suppression) .

      En ce qui concerne l'utilisateur, il peut uniquement consulter la liste des POIs existants et 
effectuer des opérations de  recherche sur ceux-ci et ceci selon leur nomination.


## Modèle de données:

## 1) Loc (localisation)

|    Attribut    |    Type     |
| -------------- |:-----------:|
| name           |String       |
| lng            |String       |
| lat            |String       |
| poi            |Poi          |
     
## 2) Media

|    Attribut    |    Type     |
| -------------- |:-----------:|
| name           |String       |
| description    |String       |
| uri            |String       |
| poi            |Poi          |

## 3) Poi

|    Attribut    |    Type     |
| -------------- |:-----------:|
| name           |String       |
| description    |String       |
| loc            |Loc          |
| poigroupes     |PoiGroupe    |
| medias         |Media        |        

## 4) PoiGroupe

|    Attribut    |    Type     |
| -------------- |:-----------:|
| pois           |Poi          |
| user           |User         |
 