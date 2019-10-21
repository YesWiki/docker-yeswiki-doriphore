# docker-yeswiki

Container pour le developpement de YesWiki.


## Construire l'image localement

```bash
$ docker build -t yeswiki .
```

## Lancer un environnement complet ([Docker Compose][])

```bash
$ docker-compose up
```

YesWiki est accessible sur [`localhost:8080`](localhost).
L'installation est à terminer à la main :

| **Adresse de la base de données** |     `localhost` |
| **Nom de la base de données** |         `yeswiki_dev` |
| **Utilisateur de la base de données** | `root` |
| **Mot de passe de la base de données** |`root` |


## Personnaliser l'installation pour une autre version de YesWiki

Les [arguments de build Docker][docker-args] servent à indiquer
[quelle version de YesWiki](https://repository.yeswiki.net/) installer localement.
Il s'agit des variables `YESWIKI_RELEASE_NAME` et `YESWIKI_VERSION`.

```bash
docker build -t yeswiki \
  --build-arg YESWIKI_RELEASE_NAME=bachibouzouk \
  --build-arg YESWIKI_VERSION=2016-03-25-1 \
  .
```


[YesWiki]: https://yeswiki.net/
[Docker]: https://www.docker.com/
[Dockerfile]: https://docs.docker.com/engine/reference/builder/
[Docker Compose]: https://docs.docker.com/compose/compose-file/
[localhost]: http://localhost:8080/
[docker-args]: https://docs.docker.com/engine/reference/commandline/build/#set-build-time-variables---build-arg
