# README

0. `git checkout dev` pour basculer sur 'dev' (et pull par la même occasion)

1. Je crée une branch pour ma feature
`git checkout -b nom_de_la_branch` exemple de nom qui concerne une feature : `feature/user`

... je code ma feature

2. Je passe commit push le travail
> `git add .`
> `git commit -m "mon message"`
> `git push origin master`

S'il y a une erreur : 
> `git checkout dev`
> `git pull origin dev`
ensuite on merge 
> `git merge nom_de_la_branch` exemple : `git merge feature/user`
> `:wq` pour quitter l'éditeur
> Je gère les conflits qui ne se merge pas automatiquement : quel code je garde ou je supprime ?

3. Je push le travail sur dev
`git push origin dev`

4. Une fois par jour, je push en prod : 
> `git checkout master`
> `git merge dev`
> `rails assets:precompile`
> `rails s -e production`
--- Tester en local 
> `git push heroku master`


------------------------------------------
------------------------------------------


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...