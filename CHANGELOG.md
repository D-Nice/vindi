# CHANGELOG

## [1.4.0](https://github.com/D-Nice/vindi/compare/v1.3.1...v1.4.0) (2021-02-02)


### Features

* **plug:** add vim-loclist-follow ([dc564cf](https://github.com/D-Nice/vindi/commit/dc564cf5c3e69758ec062a2fb5b5f428466c5ed8))
* add blacklist ft for auto retab ([c40192d](https://github.com/D-Nice/vindi/commit/c40192dea1f946f5dcf5f8cc2e4753d2c9cd3411))
* add history/shada persistence ([92968e8](https://github.com/D-Nice/vindi/commit/92968e89c7ac132cc12490621aa37b685e1e90e4))
* add svelte & emmet plugins ([7c93dd0](https://github.com/D-Nice/vindi/commit/7c93dd0e6d70ddb84b31a170501197b53c1c63ac))
* auto retab & dangling line remover ([e7ecdb0](https://github.com/D-Nice/vindi/commit/e7ecdb074c9015abf28f70ac874ff8445d6c1766))
* improve indenting ([8a5730f](https://github.com/D-Nice/vindi/commit/8a5730f2b8c3fcb8e7e581dca8ec89433438a22a))


### Bug Fixes

* airline/ui lag w/ lazyredraw ([4206a08](https://github.com/D-Nice/vindi/commit/4206a0807163ad77bdebd6f9d77f89aac4e06c63))
* autocomplete & transparency ([090b3c3](https://github.com/D-Nice/vindi/commit/090b3c34bee1c1b0ce7680e63db986282ecbfda5))
* check that buf var has key ([122d918](https://github.com/D-Nice/vindi/commit/122d918d14f2c38911109f4d4f815687988ef4c6))
* CocUpdate issue by inc sleep time to 3 mins ([706c043](https://github.com/D-Nice/vindi/commit/706c0439a28cbc07e6d06f447380e47ec043d967))
* cocupdate issue with 5 minute timeout ([8daa7a1](https://github.com/D-Nice/vindi/commit/8daa7a1e2ec88e9b70e407a94f6e65532815105d))
* improve nerdtree behaviour with some persistence ([ca36959](https://github.com/D-Nice/vindi/commit/ca36959cf0277e6b17f5a687db5c6b220f0fec56))
* lint signs visual annoyance ([1cdc882](https://github.com/D-Nice/vindi/commit/1cdc882ed1a5127ea124ac53a8755025ab87c8a7))
* loclist position reset ([3ce9b31](https://github.com/D-Nice/vindi/commit/3ce9b314c97cc1fc26c7733167501ef398363a92))
* mv ftplugin to correct nvim config path ([8a0d79f](https://github.com/D-Nice/vindi/commit/8a0d79f7dae650b73d48d01c2a0aeeb2904a5499))
* rm nerdtree conflicting keys with nav ([ef00eae](https://github.com/D-Nice/vindi/commit/ef00eaec48e89e0eaf1a88e24b625f5e824abc62))
* update to working docker image & no cache build ([461473e](https://github.com/D-Nice/vindi/commit/461473e285f336ed65e33dc036e1aaba9821ba9a))

### [1.3.1](https://github.com/D-Nice/vindi/compare/v1.3.0...v1.3.1) (2020-01-18)


### Bug Fixes

* rm coc-tabnine extension ([815e760](https://github.com/D-Nice/vindi/commit/815e760cc2cc2f18efb245cc414ddb7361ee3e4e))

## [1.3.0](https://github.com/D-Nice/vindi/compare/v1.2.0...v1.3.0) (2020-01-09)


### Features

* add coc fix keybinding ([ffda0a1](https://github.com/D-Nice/vindi/commit/ffda0a1dd5ba05d0f0bef31cf3070edfd0f8f2fd))

## [1.2.0](https://github.com/D-Nice/vindi/compare/v1.1.0...v1.2.0) (2020-01-07)


### Features

* add support for local or remote image run ([4868558](https://github.com/D-Nice/vindi/commit/48685586230e815de91c513607fd8c4674a02333))


### Bug Fixes

* **dockerfile:** missing && for nim step ([6310270](https://github.com/D-Nice/vindi/commit/6310270043dbb9cccce5be13a904e3de29db50b5))

## [1.1.0](https://github.com/D-Nice/vindi/compare/v1.0.0...v1.1.0) (2020-01-04)


### Features

* **plug:** add shellcheck ([197409b](https://github.com/D-Nice/vindi/commit/197409b4c926163616450cd3f9c3b171e8810f25))


### Bug Fixes

* **install:** resolve lint warnings ([03948a3](https://github.com/D-Nice/vindi/commit/03948a3583b0c8d0ce03cf4d89d7e2c3aab8e192))

## 1.0.0 (2020-01-04)


### Features

* add Dockerfile ([2c9bced](https://github.com/D-Nice/vindi/commit/2c9bcedf8b5105dca9c778a3c7eacbe0838b568a))
* add install, binary script, base plugins & config ([c6a15c1](https://github.com/D-Nice/vindi/commit/c6a15c18f4731945169c08bddaab966c04d017ef))
* add nim integration ([80e0401](https://github.com/D-Nice/vindi/commit/80e040101f0436d4a3ce885c6a4f7f2dee4135ad))
* shrink image size & rm bloat coc-ext ([6fba7e8](https://github.com/D-Nice/vindi/commit/6fba7e80facbd26925860998963f001f50e886c1))
* **plug:** add vim-markdown-toc ([0cf67c4](https://github.com/D-Nice/vindi/commit/0cf67c48d97fbf4e076d50f3bf6038bd1b7508af))


### Bug Fixes

* **bin:** add rm flag to avoid bloat ([b403b5c](https://github.com/D-Nice/vindi/commit/b403b5c27ce65c6516885d9de2b90914a9be05f5))
* use universal cursorHold loclist ([d435db6](https://github.com/D-Nice/vindi/commit/d435db6c23a5199b3ddc9e92e1cfe2e39e3c1e25))
* **docker:** set pipefail on shell ([7679183](https://github.com/D-Nice/vindi/commit/7679183bf5dd38215e49b413361f99bf62a4eb26))
