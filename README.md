# Kódím.cz docker

Docker pro spuštění vlastního vývojového serveru pro materiály na [Kódím.cz](https://kodim.cz/).

## Použití

Spusťte následující příkaz uvnitř repozitáře s kurzem.

```sh
docker run --rm -it -v $(pwd):/content/kurzy/kurz onset/kodimcz
```

## Vývoj tohoto docker image

### Přichystání nové verze

1. Udělejte změny v kódu tohoto repozitáře.
1. Spusťte `npm version patch` (nebo místo `patch` například `minor`, `major`).
1. Spusťte `npm run release`.
