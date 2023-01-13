#mettre à jour la base de donnee docker
php bin/console d:m:m --no-interaction
#commande pour creer un user pour la demo
php bin/console app:create-user demo@demo.com password
#ne pas arreter le container apres avoir executer les commandes
exec apache2-foreground