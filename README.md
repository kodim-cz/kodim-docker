# Kódím.cz docker

Docker pro spuštění vlastního vývojového serveru pro materiály na [Kódím.cz](https://kodim.cz/).

## Docker Hub

[https://hub.docker.com/r/onset/kodimcz](https://hub.docker.com/r/onset/kodimcz)

## Použití

Spusťte následující příkaz uvnitř repozitáře s kurzem.

```sh
docker run --rm -it -p 3000:3000 -v $(pwd):/content/kurzy/kurz onset/kodimcz
```

## Vývoj tohoto docker image

### Přichystání nové verze

1. Udělejte změny v kódu tohoto repozitáře.
1. Spusťte `npm version 1.5.17` (číslo podle aktuální verze kodim).
1. Spusťte `npm run release`.
